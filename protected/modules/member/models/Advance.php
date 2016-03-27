<?php

/**
 * "b2c_member_advance" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Advance extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_member_advance}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('member_id', 'numerical', 'integerOnly'=>true),
			array('money, payment_id, order_id, import_money, explode_money, member_advance, shop_advance', 'length', 'max'=>20),
			array('message', 'length', 'max'=>255),
			array('mtime', 'length', 'max'=>10),
			array('paymethod, memo', 'length', 'max'=>100),
			array('disabled', 'length', 'max'=>5),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('log_id, member_id, money, message, mtime, payment_id, order_id, paymethod, memo, import_money, explode_money, member_advance, shop_advance, disabled', 'safe', 'on'=>'search'),
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
			'log_id' => '日志id',
			'member_id' => '用户id',
			'money' => '出入金额',
			'message' => '管理备注',
			'mtime' => '交易时间',
			'payment_id' => '支付单号',
			'order_id' => '订单号',
			'paymethod' => '支付方式',
			'memo' => '业务摘要',
			'import_money' => '存入金额',
			'explode_money' => '支出金额',
			'member_advance' => '当前余额',
			'shop_advance' => '商店余额',
			'disabled' => '失效',
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
