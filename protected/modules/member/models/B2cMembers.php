<?php

/**
 * This is the model class for table "{{b2c_members}}".
 *
 * The followings are the available columns in table '{{b2c_members}}':
 * @property integer $member_id
 * @property integer $member_lv_id
 * @property integer $crm_member_id
 * @property string $name
 * @property integer $point
 * @property string $lastname
 * @property string $firstname
 * @property string $area
 * @property string $addr
 * @property string $mobile
 * @property string $tel
 * @property string $email
 * @property string $zip
 * @property integer $order_num
 * @property string $refer_id
 * @property string $refer_url
 * @property integer $b_year
 * @property integer $b_month
 * @property integer $b_day
 * @property string $sex
 * @property string $addon
 * @property string $wedlock
 * @property string $education
 * @property string $vocation
 * @property string $interest
 * @property string $advance
 * @property string $advance_freeze
 * @property integer $point_freeze
 * @property integer $point_history
 * @property string $score_rate
 * @property string $reg_ip
 * @property string $regtime
 * @property integer $state
 * @property integer $pay_time
 * @property string $biz_money
 * @property string $fav_tags
 * @property string $custom
 * @property string $cur
 * @property string $lang
 * @property integer $unreadmsg
 * @property string $disabled
 * @property string $remark
 * @property string $remark_type
 * @property integer $login_count
 * @property integer $experience
 * @property string $foreign_id
 * @property string $resetpwd
 * @property string $resetpwdtime
 * @property string $member_refer
 * @property string $source
 */
class B2cMembers extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_members}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('member_lv_id, crm_member_id, point, order_num, b_year, b_month, b_day, point_freeze, point_history, state, pay_time, unreadmsg, login_count, experience', 'numerical', 'integerOnly'=>true),
			array('name, lastname, firstname, mobile, tel, refer_id, vocation, member_refer', 'length', 'max'=>50),
			array('area, addr, foreign_id, resetpwd', 'length', 'max'=>255),
			array('email, refer_url', 'length', 'max'=>200),
			array('zip, advance, advance_freeze, biz_money, cur, lang', 'length', 'max'=>20),
			array('sex, wedlock', 'length', 'max'=>1),
			array('education', 'length', 'max'=>30),
			array('score_rate, disabled', 'length', 'max'=>5),
			array('reg_ip', 'length', 'max'=>16),
			array('regtime, resetpwdtime', 'length', 'max'=>10),
			array('remark_type', 'length', 'max'=>2),
			array('source', 'length', 'max'=>6),
			array('addon, interest, fav_tags, custom, remark', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('member_id, member_lv_id, crm_member_id, name, point, lastname, firstname, area, addr, mobile, tel, email, zip, order_num, refer_id, refer_url, b_year, b_month, b_day, sex, addon, wedlock, education, vocation, interest, advance, advance_freeze, point_freeze, point_history, score_rate, reg_ip, regtime, state, pay_time, biz_money, fav_tags, custom, cur, lang, unreadmsg, disabled, remark, remark_type, login_count, experience, foreign_id, resetpwd, resetpwdtime, member_refer, source', 'safe', 'on'=>'search'),
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
			'member_id' => '会员用户名',
			'member_lv_id' => '会员等级',
			'crm_member_id' => '联通CRM，存储CRM的member_id',
			'name' => '姓名',
			'point' => '积分',
			'lastname' => '姓氏',
			'firstname' => '名字',
			'area' => '地区',
			'addr' => '地址',
			'mobile' => '手机',
			'tel' => '固定电话',
			'email' => 'EMAIL',
			'zip' => '邮编',
			'order_num' => '订单数',
			'refer_id' => '来源ID',
			'refer_url' => '推广来源URL',
			'b_year' => '生年',
			'b_month' => '生月',
			'b_day' => '生日',
			'sex' => '性别',
			'addon' => '会员额外序列化信息',
			'wedlock' => '婚姻状况',
			'education' => '教育程度',
			'vocation' => '职业',
			'interest' => '扩展信息里的爱好',
			'advance' => '会员账户余额',
			'advance_freeze' => '会员预存款冻结金额',
			'point_freeze' => '会员当前冻结积分(暂时停用)',
			'point_history' => '会员历史总积分(暂时停用)',
			'score_rate' => '积分折换率',
			'reg_ip' => '注册时IP地址',
			'regtime' => '注册时间',
			'state' => '会员验证状态',
			'pay_time' => '上次结算时间',
			'biz_money' => '上次结算后到现在的所有因商业合作(推广人,代理)而产生的可供结算的金额',
			'fav_tags' => '会员感兴趣的tag',
			'custom' => '用户可根据自己的需要定义额外的会员注册信息,这里存的是序列化后的信息目前系统序列化进去的有： industry:工作行业 company:工作单位 co_addr:公司地址 salary:月收入',
			'cur' => '货币(偏爱货币)',
			'lang' => '偏好语言',
			'unreadmsg' => '未读信息',
			'disabled' => 'Disabled',
			'remark' => '备注',
			'remark_type' => '备注类型',
			'login_count' => 'Login Count',
			'experience' => '经验值',
			'foreign_id' => 'foreign_id(弃用',
			'resetpwd' => '找回密码唯一标示',
			'resetpwdtime' => '找回密码时间',
			'member_refer' => '会员来源(弃用)',
			'source' => '平台来源',
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

		$criteria->compare('member_id',$this->member_id);
		$criteria->compare('member_lv_id',$this->member_lv_id);
		$criteria->compare('crm_member_id',$this->crm_member_id);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('point',$this->point);
		$criteria->compare('lastname',$this->lastname,true);
		$criteria->compare('firstname',$this->firstname,true);
		$criteria->compare('area',$this->area,true);
		$criteria->compare('addr',$this->addr,true);
		$criteria->compare('mobile',$this->mobile,true);
		$criteria->compare('tel',$this->tel,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('zip',$this->zip,true);
		$criteria->compare('order_num',$this->order_num);
		$criteria->compare('refer_id',$this->refer_id,true);
		$criteria->compare('refer_url',$this->refer_url,true);
		$criteria->compare('b_year',$this->b_year);
		$criteria->compare('b_month',$this->b_month);
		$criteria->compare('b_day',$this->b_day);
		$criteria->compare('sex',$this->sex,true);
		$criteria->compare('addon',$this->addon,true);
		$criteria->compare('wedlock',$this->wedlock,true);
		$criteria->compare('education',$this->education,true);
		$criteria->compare('vocation',$this->vocation,true);
		$criteria->compare('interest',$this->interest,true);
		$criteria->compare('advance',$this->advance,true);
		$criteria->compare('advance_freeze',$this->advance_freeze,true);
		$criteria->compare('point_freeze',$this->point_freeze);
		$criteria->compare('point_history',$this->point_history);
		$criteria->compare('score_rate',$this->score_rate,true);
		$criteria->compare('reg_ip',$this->reg_ip,true);
		$criteria->compare('regtime',$this->regtime,true);
		$criteria->compare('state',$this->state);
		$criteria->compare('pay_time',$this->pay_time);
		$criteria->compare('biz_money',$this->biz_money,true);
		$criteria->compare('fav_tags',$this->fav_tags,true);
		$criteria->compare('custom',$this->custom,true);
		$criteria->compare('cur',$this->cur,true);
		$criteria->compare('lang',$this->lang,true);
		$criteria->compare('unreadmsg',$this->unreadmsg);
		$criteria->compare('disabled',$this->disabled,true);
		$criteria->compare('remark',$this->remark,true);
		$criteria->compare('remark_type',$this->remark_type,true);
		$criteria->compare('login_count',$this->login_count);
		$criteria->compare('experience',$this->experience);
		$criteria->compare('foreign_id',$this->foreign_id,true);
		$criteria->compare('resetpwd',$this->resetpwd,true);
		$criteria->compare('resetpwdtime',$this->resetpwdtime,true);
		$criteria->compare('member_refer',$this->member_refer,true);
		$criteria->compare('source',$this->source,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return B2cMembers the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
