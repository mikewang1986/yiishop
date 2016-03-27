<?php

/**
 * "car_desktop_users" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2007-2014 shop.feipin0512. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class AdminUsers extends BaseModel
{
    public $role;
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{admin_users}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('user_id', 'required'),
			array('user_id, logincount', 'numerical', 'integerOnly'=>true),
			array('status, super', 'length', 'max'=>1),
			array('name', 'length', 'max'=>30),
			array('lastlogin', 'length', 'max'=>10),
			array('lastip', 'length', 'max'=>20),
			array('disabled', 'length', 'max'=>5),
			array('op_no', 'length', 'max'=>50),
			array('config, favorite, memo', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('user_id, status, name, lastlogin, config, favorite, super, lastip, logincount, disabled, op_no, memo', 'safe', 'on'=>'search'),
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
			'user_id' => '后台用户ID',
			'status' => '启用',
			'name' => '姓名',
			'lastlogin' => '最后登录时间',
			'config' => '配置信息',
			'favorite' => '爱好',
			'super' => '超级管理员',
			'lastip' => '上次登录ip',
			'logincount' => '登录次数',
			'disabled' => 'Disabled',
			'op_no' => '操作员no',
			'memo' => '备注',
			'password' => '密码',
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
