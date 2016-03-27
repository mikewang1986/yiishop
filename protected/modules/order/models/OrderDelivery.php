<?php

/**
 * "b2c_order_delivery" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class OrderDelivery extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_order_delivery}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('dly_id', 'required'),
			array('order_id, dly_id', 'length', 'max'=>20),
			array('dlytype', 'length', 'max'=>8),
			array('items', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('order_id, dlytype, dly_id, items', 'safe', 'on'=>'search'),
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
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'order_id' => '订单ID',
			'dlytype' => '单据类型',
			'dly_id' => '关联单号',
			'items' => '货品明细',
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
     * 收发货列表
     *
     * @param $order_id
     * @return mixed
     */
    public function Delivery($order_id)
    {
        $sql = "SELECT * FROM {{b2c_delivery}} WHERE order_id = {$order_id}";

        return $this->QueryAll($sql);
    }

    /**
     * 退货列表
     *
     * @param $order_id
     * @return mixed
     */
    public function Reship($order_id)
    {
        $sql = "SELECT * FROM {{b2c_reship}} WHERE order_id = {$order_id}";

        return $this->QueryAll($sql);
    }
}
