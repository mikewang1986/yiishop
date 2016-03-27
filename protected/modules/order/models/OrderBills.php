<?php

/**
 * "ectools_order_bills" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class OrderBills extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{ectools_order_bills}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('bill_id', 'required'),
			array('rel_id, bill_id, money', 'length', 'max'=>20),
			array('bill_type', 'length', 'max'=>8),
			array('pay_object', 'length', 'max'=>16),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('rel_id, bill_type, pay_object, bill_id, money', 'safe', 'on'=>'search'),
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
			'rel_id' => 'Rel',
			'bill_type' => '单据类型',
			'pay_object' => '支付类型',
			'bill_id' => '关联退款/付款单号',
			'money' => '金额',
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
     * 根据订单号获取交易记录
     *
     * @param $order_id
     * @param bool $row
     * @return mixed
     */
    public function OrderPayment($order_id,$row=false)
    {
        $sql = "SELECT b.*,p.* FROM {{ectools_order_bills}} b ".
        "LEFT JOIN {{ectools_payments}} p ON b.bill_id = p.payment_id ".
        "WHERE b.rel_id = $order_id AND b.bill_type ='payments'";
        if ($row) return $this->QueryRow($sql);
        else return $this->QueryAll($sql);
    }

    /**
     * 根据订单号获取交易记录
     *
     * @param $order_id
     * @param bool $row
     * @return mixed
     */
    public function OrderRefunds($order_id,$row=false)
    {
        $sql = "SELECT b.*,p.* FROM {{ectools_order_bills}} b ".
            "LEFT JOIN {{ectools_refunds}} p ON b.bill_id = p.refund_id ".
            "WHERE b.rel_id = $order_id AND b.bill_type ='refunds'";
        if ($row) return $this->QueryRow($sql);
        else return $this->QueryAll($sql);
    }
}
