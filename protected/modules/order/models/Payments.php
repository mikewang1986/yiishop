<?php

/**
 * "ectools_payments" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Payments extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{ectools_payments}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('op_id', 'numerical', 'integerOnly'=>true),
			array('payment_id, money, cur_money, paycost, ip', 'length', 'max'=>20),
			array('member_id, pay_name, pay_app_id, return_url', 'length', 'max'=>100),
			array('status', 'length', 'max'=>8),
			array('pay_type', 'length', 'max'=>7),
			array('t_payed, currency, t_begin, t_confirm', 'length', 'max'=>10),
			array('payment_bn', 'length', 'max'=>32),
			array('account, bank, pay_account, pay_ver, thirdparty_account', 'length', 'max'=>50),
			array('disabled', 'length', 'max'=>5),
			array('trade_no', 'length', 'max'=>30),
			array('memo', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('payment_id, money, cur_money, member_id, status, pay_name, pay_type, t_payed, op_id, payment_bn, account, bank, pay_account, currency, paycost, pay_app_id, pay_ver, ip, t_begin, t_confirm, memo, return_url, disabled, trade_no, thirdparty_account', 'safe', 'on'=>'search'),
		);
	}

    /**
     * @return array 对模型的属性验证规则.
     */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

    /**
     * @return array 对模型的属性验证规则.
     */
	public function attributeLabels()
	{
		return array(
			'payment_id' => '支付单号',
			'money' => '支付金额',
			'cur_money' => '支付货币金额',
			'member_id' => '会员用户名',
			'status' => '支付状态',
			'pay_name' => 'Pay Name',
			'pay_type' => '支付类型',
			't_payed' => '支付完成时间',
			'op_id' => '操作员',
			'payment_bn' => '支付单唯一编号',
			'account' => '收款账号',
			'bank' => '收款银行',
			'pay_account' => '支付账户',
			'currency' => '货币',
			'paycost' => '支付网关费用',
			'pay_app_id' => '支付方式名称',
			'pay_ver' => '支付版本号',
			'ip' => '支付IP',
			't_begin' => '支付开始时间',
			't_confirm' => '支付确认时间',
			'memo' => '支付注释',
			'return_url' => '支付返回地址',
			'disabled' => '支付单状态',
			'trade_no' => '支付单交易编号',
			'thirdparty_account' => '第三方支付账户',
		);
	}

    /**
     * 返回指定的AR类的静态模型.
     * Please note that you should have this exact method in all your CActiveRecord descendants!
     * @param string $className active record class name.
     * @return Admin the static model class
     */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

    /**
     * 订单支付
     *
     * @param $order_id
     * @param $payments_attributes
     * @param int $pay_status
     * @return array
     */
    public function OrderPayment($order_id,$payments_attributes,$pay_status=1)
    {
        //订单信息
        $sql = "SELECT order_id,member_id,final_amount,member_id,payment,pay_status FROM {{b2c_orders}} WHERE order_id = $order_id";
        $order_row = $this->QueryRow($sql);

        //订单状态已经操作过返回
        if ($order_row['pay_status'] == 1) return array('code'=>200,'msg'=>'订单已支付过，请勿重复支付');

        //会员信息
        $member_sql = "SELECT member_id,name FROM {{b2c_members}} WHERE member_id = {$order_row['member_id']}";
        $member_row = $this->QueryRow($member_sql);

        $pay_time = time();
        $paymentNo = $this->payment_no();

        $order_product_list = $this->QueryAll("SELECT product_id,goods_id,nums FROM {{b2c_order_items}} WHERE order_id = $order_id");

        $transaction = Yii::app()->db->beginTransaction();
        try {
            //订单支付状态更新
            if(empty($payed)){
                $payed = $order_row['final_amount'];
            }
            $this->ModelEdit('{{b2c_orders}}',array('order_id'=>$order_id),array('pay_status'=>$pay_status,'payed'=>$payed,'score_g'=>ceil($order_row['final_amount'])));

            //商品库存变更
            $this->orderStoreMinus($order_product_list);

            //生成支付单
            $this->ModelInsert(
                '{{ectools_payments}}',
                array(
                    'payment_id'=>$paymentNo,
                    'money'=>$order_row['final_amount'],
                    'cur_money'=>$order_row['final_amount'],
                    'member_id'=>$order_row['member_id'],
                    'status'=>'succ',
                    'pay_name'=>$payments_attributes['pay_name'],
                    'pay_type'=>$payments_attributes['pay_type'],
                    't_payed'=>time(),
                    'op_id'=>Yii::app()->session['_admini']['user_id'],
                    'payment_bn'=>$this->payment_no(),
                    'account'=>$payments_attributes['account'],
                    'bank'=>$payments_attributes['bank'],
                    'pay_account'=>$payments_attributes['pay_account'],
                    'currency'=>'CNY',
                    'paycost'=>'',
                    'pay_app_id'=>$payments_attributes['pay_app_id'],
                    'ip'=>'',
                    't_begin'=>$pay_time,
                    't_confirm'=>$pay_time,
                    'memo'=>$payments_attributes['memo'],
                    'return_url'=>'',
                    'disabled'=>'false',
                    'trade_no'=>$order_id,
                    'thirdparty_account'=>'',
                )
            );
            //订单钱款单据
            $this->ModelInsert(
                '{{ectools_order_bills}}',
                array(
                    'rel_id'=>$order_id,
                    'bill_type'=>'payments',
                    'pay_object'=>'order',
                    'bill_id'=>$paymentNo,
                    'money'=>$order_row['final_amount']
                )
            );

            //订单支付日志
            $this->ModelInsert(
                '{{b2c_order_log}}',
                array(
                    'rel_id'=>$order_id,
                    'op_id'=>$order_row['member_id'],
                    'op_name'=>$member_row['name'],
                    'alttime'=>$pay_time,
                    'bill_type'=>'order',
                    'behavior'=>'payments',
                    'result'=>'SUCCESS',
                    'log_text'=>serialize(
                        array(
                            array(
                                'txt_key'=>'订单已付款，订单号'.$order_id.'付款'.$order_row['final_amount'].'元',
                                'data'=>array(
                                    $order_id,$order_row['final_amount']
                                )
                            )
                        )
                    ),
                )
            );
            $transaction->commit();
            return array('code'=>200,'msg'=>'订单支付成功','order_id'=>$order_id,'total_amount'=>$order_row['final_amount']);
        } catch(Exception $e) {
            $transaction->rollback();
            return array('code'=>400,'msg'=>'订单支付失败');
        }
    }

    /**
     * 订单退款
     *
     * @param $order_id
     * @param $payments_attributes
     * @param int $pay_status
     * @return array
     */
    public function OrderRefund($order_id,$payments_attributes,$pay_status=5)
    {
        //订单信息
        $sql = "SELECT order_id,member_id,final_amount,member_id,payment,pay_status FROM {{b2c_orders}} WHERE order_id = $order_id";
        $order_row = $this->QueryRow($sql);

        //订单状态已经操作过返回
        if ($order_row['pay_status'] == 5) return array('code'=>200,'msg'=>'订单已全额退款，请勿重复支付');

        //会员信息
        $member_sql = "SELECT member_id,name FROM {{b2c_members}} WHERE member_id = {$order_row['member_id']}";
        $member_row = $this->QueryRow($member_sql);

        $pay_time = time();
        $paymentNo = $this->payment_no();

        $order_product_list = $this->QueryAll("SELECT product_id,goods_id,nums FROM {{b2c_order_items}} WHERE order_id = $order_id");

        $transaction = Yii::app()->db->beginTransaction();
        try {
            //订单支付状态更新
            $this->ModelEdit('{{b2c_orders}}',array('order_id'=>$order_id),array('pay_status'=>$pay_status,'payed'=>0.00,'score_g'=>0));

            //商品库存变更
            $this->orderStoreIncrease($order_product_list);

            //生成支付单
            $this->ModelInsert(
                '{{ectools_refunds}}',
                array(
                    'refund_id'=>$paymentNo,
                    'money'=>$order_row['final_amount'],
                    'cur_money'=>$order_row['final_amount'],
                    'member_id'=>$order_row['member_id'],
                    'account'=>$payments_attributes['account'],
                    'bank'=>$payments_attributes['bank'],
                    'pay_account'=>$payments_attributes['pay_account'],
                    'currency'=>'CNY',
                    'paycost'=>'',
                    'pay_type'=>$payments_attributes['pay_type'],
                    'status'=>'succ',
                    'pay_name'=>$payments_attributes['pay_name'],
                    'pay_ver'=>'1.0',
                    'op_id'=>Yii::app()->session['_admini']['user_id'],
                    'refund_bn'=>'',
                    'pay_app_id'=>$payments_attributes['pay_app_id'],
                    't_begin'=>$pay_time,
                    't_payed'=>$pay_time,
                    't_confirm'=>$pay_time,
                    'memo'=>$payments_attributes['memo'],
                    'disabled'=>'false',
                    'trade_no'=>$order_id,
                )
            );
            //订单钱款单据
            $this->ModelInsert(
                '{{ectools_order_bills}}',
                array(
                    'rel_id'=>$order_id,
                    'bill_type'=>'refunds',
                    'pay_object'=>'order',
                    'bill_id'=>$paymentNo,
                    'money'=>$order_row['final_amount']
                )
            );

            //订单支付日志
            $this->ModelInsert(
                '{{b2c_order_log}}',
                array(
                    'rel_id'=>$order_id,
                    'op_id'=>Yii::app()->session['_admini']['user_id'],
                    'op_name'=>Yii::app()->session['_admini']['name'],
                    'alttime'=>$pay_time,
                    'bill_type'=>'order',
                    'behavior'=>'refunds',
                    'result'=>'SUCCESS',
                    'log_text'=>serialize(
                        array(
                            array(
                                'txt_key'=>'订单已退款，订单号'.$order_id.'退款'.$order_row['final_amount'].'元',
                                'data'=>array(
                                    $order_id,$order_row['final_amount']
                                )
                            )
                        )
                    ),
                )
            );
            $transaction->commit();
            return array('code'=>200,'msg'=>'订单退款成功','order_id'=>$order_id,'total_amount'=>$order_row['final_amount']);
        } catch(Exception $e) {
            $transaction->rollback();
            return array('code'=>400,'msg'=>'订单支付失败');
        }
    }

    /**
     * 订单支付减去商品表  货品表库存
     * @param $order_product_list
     */
    public function orderStoreMinus($order_product_list){
        foreach ($order_product_list as $v) {
            //减去商品表库存
            $set_str = "store = store - {$v['nums']} , freez= freez + {$v['nums']}";
            $condition = "product_id = {$v['product_id']}";
            $this->Execute("UPDATE {{b2c_products}} SET $set_str WHERE $condition");

            //减去货品表库存
            $set_str =" store = store-{$v['nums']}";
            $condition = "goods_id = {$v['goods_id']}";
            $this->Execute("UPDATE {{b2c_goods}} SET $set_str WHERE $condition");
        }
    }

    /**
     * 订单支付增回商品表  货品表库存
     * @param $order_product_list
     */
    public function orderStoreIncrease($order_product_list){
        foreach ($order_product_list as $v) {
            //减去商品表库存
            $set_str = "store = store + {$v['nums']} , freez = freez - {$v['nums']}";
            $condition = "product_id = {$v['product_id']}";
            $this->Execute("UPDATE {{b2c_products}} SET $set_str WHERE $condition");

            //减去货品表库存
            $set_str =" store = store + {$v['nums']}";
            $condition = "goods_id = {$v['goods_id']}";
            $this->Execute("UPDATE {{b2c_goods}} SET $set_str WHERE $condition");
        }
    }

    /**
     * 生成支付单号
     *
     * @return string
     */
    public function payment_no()
    {
        return time().substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
    }
}
