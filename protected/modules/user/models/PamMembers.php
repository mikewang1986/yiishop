<?php

/**
 * "pam_members" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class PamMembers extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{pam_members}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('login_account, login_password, password_account', 'required'),
			array('member_id', 'numerical', 'integerOnly'=>true),
			array('login_account, password_account', 'length', 'max'=>100),
			array('login_type', 'length', 'max'=>6),
			array('login_password', 'length', 'max'=>32),
			array('disabled', 'length', 'max'=>5),
			array('createtime', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('member_id, login_account, login_type, login_password, password_account, disabled, createtime', 'safe', 'on'=>'search'),
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
			'member_id' => '账户序号ID',
			'login_account' => '登录名',
			'login_type' => '账户类型',
			'login_password' => '登录密码',
			'password_account' => '登录密码加密所用账号',
			'disabled' => 'Disabled',
			'createtime' => '创建时间',
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
