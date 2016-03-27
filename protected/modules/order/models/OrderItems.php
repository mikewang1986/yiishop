<?php

/**
 * "b2c_order_items" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class OrderItems extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_order_items}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('obj_id, product_id, type_id, score, weight', 'numerical', 'integerOnly'=>true),
			array('nums, sendnum', 'numerical'),
			array('order_id, goods_id, cost, price, g_price, amount', 'length', 'max'=>20),
			array('bn', 'length', 'max'=>40),
			array('name', 'length', 'max'=>200),
			array('item_type', 'length', 'max'=>7),
			array('addon', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('item_id, order_id, obj_id, product_id, goods_id, type_id, bn, name, cost, price, g_price, amount, score, weight, nums, sendnum, addon, item_type', 'safe', 'on'=>'search'),
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
			'item_id' => '订单明细ID',
			'order_id' => '订单ID',
			'obj_id' => '订单明细对应的商品对象ID, 对应到car_b2c_order_objects表',
			'product_id' => '货品ID',
			'goods_id' => '商品ID',
			'type_id' => '商品类型ID',
			'bn' => '明细商品的品牌名',
			'name' => '明细商品的名称',
			'cost' => '明细商品的成本',
			'price' => '明细商品的销售价(购入价)',
			'g_price' => '明细商品的会员价原价',
			'amount' => '明细商品总额',
			'score' => '明细商品积分',
			'weight' => '明细商品重量',
			'nums' => '明细商品购买数量',
			'sendnum' => '明细商品发货数量',
			'addon' => '明细商品的规格属性',
			'item_type' => '明细商品类型',
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
}
