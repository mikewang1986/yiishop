<?php

/**
 * "car_b2c_member_goods" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class MemberGoods extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return 'car_b2c_member_goods';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('goods_id, status', 'required'),
			array('member_id, product_id', 'numerical', 'integerOnly'=>true),
			array('goods_id, goods_price, cellphone', 'length', 'max'=>20),
			array('goods_name', 'length', 'max'=>200),
			array('image_default_id', 'length', 'max'=>32),
			array('email, object_type', 'length', 'max'=>100),
			array('status', 'length', 'max'=>8),
			array('send_time, create_time', 'length', 'max'=>10),
			array('disabled', 'length', 'max'=>5),
			array('type', 'length', 'max'=>3),
			array('remark', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('gnotify_id, goods_id, member_id, product_id, goods_name, goods_price, image_default_id, email, cellphone, status, send_time, create_time, disabled, remark, type, object_type', 'safe', 'on'=>'search'),
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
			'gnotify_id' => 'Gnotify',
			'goods_id' => 'Goods',
			'member_id' => 'Member',
			'product_id' => 'Product',
			'goods_name' => 'Goods Name',
			'goods_price' => 'Goods Price',
			'image_default_id' => 'Image Default',
			'email' => 'Email',
			'cellphone' => 'Cellphone',
			'status' => 'Status',
			'send_time' => 'Send Time',
			'create_time' => 'Create Time',
			'disabled' => 'Disabled',
			'remark' => 'Remark',
			'type' => 'Type',
			'object_type' => 'Object Type',
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
