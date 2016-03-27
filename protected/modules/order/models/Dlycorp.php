<?php

/**
 * This is the model class for table "{{b2c_dlycorp}}".
 *
 * The followings are the available columns in table '{{b2c_dlycorp}}':
 * @property integer $corp_id
 * @property string $type
 * @property string $corp_code
 * @property string $name
 * @property string $disabled
 * @property integer $ordernum
 * @property string $website
 * @property string $request_url
 */
class Dlycorp extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_dlycorp}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('ordernum', 'numerical', 'integerOnly'=>true),
			array('type', 'length', 'max'=>6),
			array('corp_code, name, website, request_url', 'length', 'max'=>200),
			array('disabled', 'length', 'max'=>5),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('corp_id, type, corp_code, name, disabled, ordernum, website, request_url', 'safe', 'on'=>'search'),
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
			'corp_id' => 'Corp',
			'type' => 'Type',
			'corp_code' => 'Corp Code',
			'name' => 'Name',
			'disabled' => 'Disabled',
			'ordernum' => 'Ordernum',
			'website' => 'Website',
			'request_url' => 'Request Url',
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

		$criteria->compare('corp_id',$this->corp_id);
		$criteria->compare('type',$this->type,true);
		$criteria->compare('corp_code',$this->corp_code,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('disabled',$this->disabled,true);
		$criteria->compare('ordernum',$this->ordernum);
		$criteria->compare('website',$this->website,true);
		$criteria->compare('request_url',$this->request_url,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Dlycorp the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
