<?php

/**
 * This is the model class for table "{{pam_account}}".
 *
 * The followings are the available columns in table '{{pam_account}}':
 * @property integer $account_id
 * @property string $account_type
 * @property string $login_name
 * @property string $login_password
 * @property string $disabled
 * @property string $createtime
 */
class PamAccount extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{pam_account}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('login_name, login_password', 'required'),
			array('account_type', 'length', 'max'=>30),
			array('login_name', 'length', 'max'=>100),
			array('login_password', 'length', 'max'=>32),
			array('disabled', 'length', 'max'=>5),
			array('createtime', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('account_id, account_type, login_name, login_password, disabled, createtime', 'safe', 'on'=>'search'),
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
			'account_id' => 'Account',
			'account_type' => 'Account Type',
			'login_name' => 'Login Name',
			'login_password' => 'Login Password',
			'disabled' => 'Disabled',
			'createtime' => 'Createtime',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('account_id',$this->account_id);
		$criteria->compare('account_type',$this->account_type,true);
		$criteria->compare('login_name',$this->login_name,true);
		$criteria->compare('login_password',$this->login_password,true);
		$criteria->compare('disabled',$this->disabled,true);
		$criteria->compare('createtime',$this->createtime,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PamAccount the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
