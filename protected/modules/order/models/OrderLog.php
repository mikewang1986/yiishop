<?php

/**
 * "car_b2c_order_log" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class OrderLog extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_order_log}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('result', 'required'),
			array('op_id', 'numerical', 'integerOnly'=>true),
			array('rel_id', 'length', 'max'=>20),
			array('op_name', 'length', 'max'=>100),
			array('alttime', 'length', 'max'=>10),
			array('bill_type', 'length', 'max'=>16),
			array('behavior', 'length', 'max'=>8),
			array('result', 'length', 'max'=>7),
			array('log_text, addon', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('log_id, rel_id, op_id, op_name, alttime, bill_type, behavior, result, log_text, addon', 'safe', 'on'=>'search'),
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
			'log_id' => '订单日志ID',
			'rel_id' => '对象ID',
			'op_id' => '操作员ID',
			'op_name' => '操作人名称',
			'alttime' => '操作时间',
			'bill_type' => '操作人员姓名',
			'behavior' => '日志记录操作的行为',
			'result' => '日志结果',
			'log_text' => '操作内容',
			'addon' => '序列化数据',
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
