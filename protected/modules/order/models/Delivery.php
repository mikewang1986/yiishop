<?php

/**
 * "b2c_delivery" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Delivery extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_delivery}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('member_id, delivery', 'numerical', 'integerOnly'=>true),
			array('order_id, logi_name', 'length', 'max'=>100),
			array('delivery_bn', 'length', 'max'=>32),
			array('money, ship_zip', 'length', 'max'=>20),
			array('is_protect, disabled', 'length', 'max'=>5),
			array('logi_id, logi_no, ship_name, ship_tel, ship_mobile, op_name', 'length', 'max'=>50),
			array('ship_area', 'length', 'max'=>255),
			array('ship_email', 'length', 'max'=>200),
			array('t_begin, t_send, t_confirm', 'length', 'max'=>10),
			array('status', 'length', 'max'=>8),
			array('ship_addr, memo', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('delivery_id, order_id, delivery_bn, member_id, money, is_protect, delivery, logi_id, logi_name, logi_no, ship_name, ship_area, ship_addr, ship_zip, ship_tel, ship_mobile, ship_email, t_begin, t_send, t_confirm, op_name, status, memo, disabled', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'delivery_id' => '配送流水号',
			'order_id' => '订单号',
			'delivery_bn' => '配送流水号',
			'member_id' => '订货会员ID',
			'money' => '配送费用',
			'is_protect' => '是否保价',
			'delivery' => '配送方式(货到付款、EMS...)',
			'logi_id' => '物流公司ID',
			'logi_name' => '物流公司名称',
			'logi_no' => '物流单号',
			'ship_name' => '收货人姓名',
			'ship_area' => '收货人地区',
			'ship_addr' => '收货人地址',
			'ship_zip' => '收货人邮编',
			'ship_tel' => '收货人电话',
			'ship_mobile' => '收货人手机',
			'ship_email' => '收货人Email',
			't_begin' => '单据生成时间',
			't_send' => '单据结束时间',
			't_confirm' => '单据确认时间',
			'op_name' => '操作者',
			'status' => '状态',
			'memo' => '备注',
			'disabled' => '无效',
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
     * 订单发货
     *
     * @param $order_id
     * @param $delivery_attributes
     * @param $params_attributes
     * @return array
     */
    public function OrderDelivery($order_id,$delivery_attributes,$params_attributes)
    {
        //订单信息
        $sql = "SELECT order_id,member_id,member_id,ship_status FROM {{b2c_orders}} WHERE order_id = $order_id";
        $order_row = $this->QueryRow($sql);

        //订单状态已经操作过返回
        if ($order_row['ship_status'] == 1) return array('code'=>200,'msg'=>'订单已发货，请勿重复发货');

        $time = time();
        $delivery_id = $this->delivery_no();

        $shipping_id = $delivery_attributes['shipping_id'];
        $shipping = Yii::app()->params['dlytype_id'][$shipping_id];
        $ship_name = $params_attributes['ship_name'];
        $ship_addr = $params_attributes['ship_addr'];
        $ship_zip = $params_attributes['ship_zip'];
        $ship_tel = $params_attributes['ship_tel'];
        $ship_mobile = $params_attributes['ship_mobile'];
        $ship_area = $this->AddrAreaTo($params_attributes['region_id']);
        $logi_name = $this->Dlycorp($delivery_attributes['logi_id']);

        $order_product_list = $this->QueryAll("SELECT product_id,goods_id,bn,name,nums FROM {{b2c_order_items}} WHERE order_id = $order_id");
        $transaction = Yii::app()->db->beginTransaction();
        try {
            //订单支付状态更新
            $this->ModelEdit(
                '{{b2c_orders}}',
                array('order_id'=>$order_id),
                array(
                    'ship_status'=>1,'shipping_id'=>$shipping_id,
                    'shipping'=>$shipping,'ship_area'=>$ship_area,
                    'ship_name'=>$ship_name,'ship_addr'=>$ship_addr,
                    'ship_zip'=>$ship_zip,'ship_tel'=>$ship_tel,
                    'ship_mobile'=>$ship_mobile
                ));

            //商品库存变更
            $this->orderStoreMinus($order_id,$delivery_id,$order_product_list);

            //生成发货单
            $this->ModelInsert(
                '{{b2c_delivery}}',
                array(
                    'delivery_id'=>$delivery_id,
                    'order_id'=>$order_id,
                    'delivery_bn'=>'',
                    'member_id'=>$order_row['member_id'],
                    'money'=>$delivery_attributes['cost_freight'],
                    'is_protect'=>'false',
                    'delivery'=>$shipping_id,
                    'logi_id'=>$delivery_attributes['logi_id'],
                    'logi_name'=>$logi_name,
                    'logi_no'=>$delivery_attributes['logi_no'],
                    'ship_name'=>$ship_name,
                    'ship_area'=>$ship_area,
                    'ship_addr'=>$ship_addr,
                    'ship_zip'=>$ship_zip,
                    'ship_tel'=>$ship_zip,
                    'ship_mobile'=>$ship_mobile,
                    'ship_email'=>'',
                    't_begin'=>$time,
                    't_send'=>$time,
                    't_confirm'=>$time,
                    'op_name'=>Yii::app()->session['_admini']['name'],
                    'status'=>'succ',
                    'memo'=>$delivery_attributes['memo'],
                )
            );

            //订单支付日志
            $this->ModelInsert(
                '{{b2c_order_log}}',
                array(
                    'rel_id'=>$order_id,
                    'op_id'=>Yii::app()->session['_admini']['user_id'],
                    'op_name'=>Yii::app()->session['_admini']['name'],
                    'alttime'=>$time,
                    'bill_type'=>'order',
                    'behavior'=>'delivery',
                    'result'=>'SUCCESS',
                    'log_text'=>serialize(
                        array(
                            array(
                                'txt_key'=>'订单已发货，物流公司：'.$logi_name.',物流号：'.$delivery_attributes['logi_no'],
                                'data'=>array(
                                    $order_id,$logi_name,$delivery_attributes['logi_no']
                                )
                            )
                        )
                    ),
                )
            );
            $transaction->commit();
            return array('code'=>200,'msg'=>'订单发货成功','order_id'=>$order_id);
        } catch(Exception $e) {
            $transaction->rollback();
            return array('code'=>400,'msg'=>'订单发货失败');
        }
    }

    /**
     * 订单退货
     *
     * @param $order_id
     * @param $reship_attributes
     * @param $params_attributes
     * @return array
     */
    public function OrderReship($order_id,$reship_attributes,$params_attributes)
    {
        //订单信息
        $sql = "SELECT order_id,member_id,member_id,ship_status FROM {{b2c_orders}} WHERE order_id = $order_id";
        $order_row = $this->QueryRow($sql);

        //订单状态已经操作过返回
        if ($order_row['ship_status'] == 4) return array('code'=>200,'msg'=>'订单已退货，请勿重复发货');

        $time = time();
        $reship_id = $this->delivery_no();

        $shipping_id = $reship_attributes['shipping_id'];
        $shipping = Yii::app()->params['dlytype_id'][$shipping_id];
        $ship_name = $params_attributes['ship_name'];
        $ship_addr = $params_attributes['ship_addr'];
        $ship_zip = $params_attributes['ship_zip'];
        $ship_tel = $params_attributes['ship_tel'];
        $ship_mobile = $params_attributes['ship_mobile'];
        $ship_area = $this->AddrAreaTo($params_attributes['region_id']);
        $logi_name = $this->Dlycorp($reship_attributes['logi_id']);

        $order_product_list = $this->QueryAll("SELECT product_id,goods_id,bn,name,nums FROM {{b2c_order_items}} WHERE order_id = $order_id");
        $transaction = Yii::app()->db->beginTransaction();
        try {
            //订单支付状态更新
            $this->ModelEdit(
                '{{b2c_orders}}',
                array('order_id'=>$order_id),
                array(
                    'ship_status'=>4,'shipping_id'=>$shipping_id,
                    'shipping'=>$shipping,'ship_area'=>$ship_area,
                    'ship_name'=>$ship_name,'ship_addr'=>$ship_addr,
                    'ship_zip'=>$ship_zip,'ship_tel'=>$ship_tel,
                    'ship_mobile'=>$ship_mobile
                ));

            //商品库存变更
            $this->orderStoreMinus($order_id,$reship_id,$order_product_list);

            //生成发货单
            $this->ModelInsert(
                '{{b2c_reship}}',
                array(
                    'reship_id'=>$reship_id,
                    'order_id'=>$order_id,
                    'reship_bn'=>'',
                    'member_id'=>$order_row['member_id'],
                    'money'=>'',
                    'is_protect'=>'false',
                    'delivery'=>$shipping_id,
                    'logi_id'=>$reship_attributes['logi_id'],
                    'logi_name'=>$logi_name,
                    'logi_no'=>$reship_attributes['logi_no'],
                    'ship_name'=>$ship_name,
                    'ship_area'=>$ship_area,
                    'ship_addr'=>$ship_addr,
                    'ship_zip'=>$ship_zip,
                    'ship_tel'=>$ship_zip,
                    'ship_mobile'=>$ship_mobile,
                    'ship_email'=>'',
                    't_begin'=>$time,
                    't_send'=>$time,
                    't_confirm'=>$time,
                    'op_name'=>Yii::app()->session['_admini']['name'],
                    'status'=>'succ',
                    'memo'=>$reship_attributes['memo'],
                )
            );

            //订单支付日志
            $this->ModelInsert(
                '{{b2c_order_log}}',
                array(
                    'rel_id'=>$order_id,
                    'op_id'=>Yii::app()->session['_admini']['user_id'],
                    'op_name'=>Yii::app()->session['_admini']['name'],
                    'alttime'=>$time,
                    'bill_type'=>'order',
                    'behavior'=>'delivery',
                    'result'=>'SUCCESS',
                    'log_text'=>serialize(
                        array(
                            array(
                                'txt_key'=>'订单已退货，物流公司：'.$logi_name.',物流号：'.$reship_attributes['logi_no'],
                                'data'=>array(
                                    $order_id,$logi_name,$reship_attributes['logi_no']
                                )
                            )
                        )
                    ),
                )
            );
            $transaction->commit();
            return array('code'=>200,'msg'=>'订单退货成功','order_id'=>$order_id);
        } catch(Exception $e) {
            $transaction->rollback();
            return array('code'=>400,'msg'=>'订单退货失败');
        }
    }

    /**
     * 订单支付减去商品表  货品表库存
     * @param $order_id
     * @param $reship_id
     * @param $order_product_list
     */
    public function orderStoreMinus($order_id,$reship_id,$order_product_list){
        foreach ($order_product_list as $v) {
            //减去商品表库存
            $set_str = "freez = freez - {$v['nums']}";
            $condition = "product_id = {$v['product_id']}";
            $this->Execute("UPDATE {{b2c_products}} SET $set_str WHERE $condition");

            $this->ModelInsert('{{b2c_reship_items}}',
                array('reship_id'=>$reship_id,'order_item_id'=>$order_id,'item_type'=>'goods',
                    'product_id'=>$v['product_id'],'product_bn'=>$v['bn'],'product_name'=>$v['name'],'number'=>$v['nums'])
            );
        }
    }

    /**
     * 订单支付增回商品表  货品表库存
     * @param $order_id
     * @param $reship_id
     * @param $order_product_list
     */
    public function orderStoreIncrease($order_id,$reship_id,$order_product_list){
        foreach ($order_product_list as $v) {
            //减去商品表库存
            $set_str = "freez = freez + {$v['nums']}";
            $condition = "product_id = {$v['product_id']}";
            $this->Execute("UPDATE {{b2c_products}} SET $set_str WHERE $condition");

            $this->ModelInsert('{{b2c_reship_items}}',
                array('reship_id'=>$reship_id,'order_item_id'=>$order_id,'item_type'=>'goods',
                    'product_id'=>$v['product_id'],'product_bn'=>$v['bn'],'product_name'=>$v['name'],'number'=>$v['nums'])
            );
        }
    }

    /**
     * 生成支付单号
     *
     * @return string
     */
    public function delivery_no()
    {
        return time().substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
    }

    /**
     * 收货地区格式修改
     *
     * @param $area
     * @return mixed
     */
    public function AddrArea($area)
    {
        if (empty($area)) return $area;
        $areaArr = explode(':', $area);
        $item['area'] = '';
        $item['area_id'] = '';

        if (isset($areaArr[1]) && !empty($areaArr[1])) $item['area'] = str_replace('/', '', $areaArr[1]);
        if (isset($areaArr[2]) && !empty($areaArr[2])) $item['area_id'] = $areaArr[2];
        return $item;
    }

    /**
     * 快递公司名
     *
     * @param $corp_id
     * @return mixed
     */
    public function Dlycorp($corp_id)
    {
        $dlycorp_row = $this->QueryRow("SELECT `name` FROM {{b2c_dlycorp}} WHERE corp_id = {$corp_id}");
        return $dlycorp_row['name'];
    }

    /**
     * 收货地址格式编辑
     *
     * @param $region_id
     * @return string
     */
    public function AddrAreaTo($region_id)
    {
        $region_row = $this->QueryRow("SELECT region_path FROM car_ectools_regions WHERE region_id = $region_id");
        $region_path = trim($region_row['region_path'], ',');

        $region_list = $this->QueryAll(
            "SELECT local_name FROM car_ectools_regions
            WHERE region_id IN ({$region_path}) ORDER BY region_grade ASC"
        );

        foreach ($region_list as $v) {
            $area_arr[] = $v['local_name'];
        }
        $area = implode('/', $area_arr);

        return 'mainland:' . $area . ':' . $region_id;
    }

    /**
     * 收货地址格式还原
     *
     * @param $area
     * @return array
     */
    public function AreaToAddr($area)
    {
        $areaArr = explode(':',$area);
        $region_id = isset($areaArr[2])?$areaArr[2]:0;

        $region_row = $this->QueryRow("SELECT region_id,region_path FROM car_ectools_regions WHERE region_id = {$region_id}");

        $region_path = trim($region_row['region_path'],',');
        $regionArr = explode(',',$region_path);

        $item = array();
        $item['province'] = $this->Regions();
        if (isset($regionArr[0]) && $regionArr[0]) {
            $item['province_id'] = $regionArr[0];
            $item['city'] = $this->Regions($regionArr[0]);
        }
        if (isset($regionArr[1]) && $regionArr[1]) {
            $item['city_id'] = $regionArr[1];
            $item['town'] = $this->Regions($regionArr[1]);
        }
        if (isset($regionArr[2]) && $regionArr[2]) {
            $item['town_id'] = $regionArr[2];
        }

        return $item;
    }

    /**
     * 收货地区
     *
     * @param int $region_id
     * @return mixed
     */
    public function Regions($region_id = 0)
    {
        if ($region_id)
            $rows = $this->QueryAll(
                "SELECT region_id,local_name FROM car_ectools_regions
                WHERE p_region_id = {$region_id} ORDER BY region_id ASC"
            );
        else $rows = $this->QueryAll(
            "SELECT region_id,local_name FROM car_ectools_regions
            WHERE region_grade = 1 ORDER BY region_id ASC"
        );

        return $rows;
    }
}
