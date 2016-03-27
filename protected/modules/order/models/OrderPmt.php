<?php

/**
 * "b2c_order_pmt" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class OrderPmt extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_order_pmt}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('pmt_id, order_id', 'required'),
			array('pmt_id, product_id', 'numerical', 'integerOnly'=>true),
			array('order_id, pmt_amount', 'length', 'max'=>20),
			array('pmt_type', 'length', 'max'=>6),
			array('pmt_tag, pmt_memo, pmt_describe', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('pmt_id, order_id, product_id, pmt_type, pmt_amount, pmt_tag, pmt_memo, pmt_describe', 'safe', 'on'=>'search'),
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
			'pmt_id' => '促销规则id',
			'order_id' => '订单id',
			'product_id' => '商品ID',
			'pmt_type' => '优惠规则类型',
			'pmt_amount' => 'Pmt Amount',
			'pmt_tag' => 'Pmt Tag',
			'pmt_memo' => 'Pmt Memo',
			'pmt_describe' => 'Pmt Describe',
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
