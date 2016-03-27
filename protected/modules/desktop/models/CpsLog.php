<?php

/**
 * This is the model class for table "oct_cps_log".
 *
 * The followings are the available columns in table 'oct_cps_log':
 * @property string $log_id
 * @property integer $case_id
 * @property integer $put_id
 * @property integer $valuation_id
 * @property integer $action
 * @property string $visit_user
 * @property integer $member_id
 * @property string $order_id
 * @property string $log_text
 * @property string $create_time
 * @property string $disabled
 */
class CpsLog extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{cps_log}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('case_id, put_id, valuation_id, action, create_time', 'required'),
			array('case_id, put_id, valuation_id, action, member_id', 'numerical', 'integerOnly'=>true),
			array('visit_user', 'length', 'max'=>128),
			array('order_id', 'length', 'max'=>20),
			array('create_time', 'length', 'max'=>10),
			array('disabled', 'length', 'max'=>5),
			array('log_text', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('log_id, case_id, put_id, valuation_id, action, visit_user, member_id, order_id, log_text, create_time, disabled', 'safe', 'on'=>'search'),
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
			'log_id' => 'Log',
			'case_id' => 'Case',
			'put_id' => 'Put',
			'valuation_id' => 'Valuation',
			'action' => 'Action',
			'visit_user' => 'Visit User',
			'member_id' => 'Member',
			'order_id' => 'Order',
			'log_text' => 'Log Text',
			'create_time' => 'Create Time',
			'disabled' => 'Disabled',
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

		$criteria->compare('log_id',$this->log_id,true);
		$criteria->compare('case_id',$this->case_id);
		$criteria->compare('put_id',$this->put_id);
		$criteria->compare('valuation_id',$this->valuation_id);
		$criteria->compare('action',$this->action);
		$criteria->compare('visit_user',$this->visit_user,true);
		$criteria->compare('member_id',$this->member_id);
		$criteria->compare('order_id',$this->order_id,true);
		$criteria->compare('log_text',$this->log_text,true);
		$criteria->compare('create_time',$this->create_time,true);
		$criteria->compare('disabled',$this->disabled,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CpsLog the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

    /**
     * 日志列表
     *
     * @param $pageIndex
     * @param $pagesize
     * @param string $select
     * @param string $condition
     * @return mixed
     */
    public function logList($pageIndex,$pagesize,$select='*',$condition="l.disabled='false'")
    {
        $start = ($pageIndex - 1) * $pagesize;
        $sql = "SELECT COUNT(*) FROM oct_cps_log l
        LEFT JOIN oct_cps_case s ON l.case_id = s.case_id
        LEFT JOIN oct_cps_put p ON l.put_id = p.put_id
        LEFT JOIN oct_cps_valuation v ON l.valuation_id = v.valuation_id
        WHERE {$condition}";

        $result['count'] = $this->RowCount($sql);

        $sql = "SELECT {$select} FROM oct_cps_log l
        LEFT JOIN oct_cps_case s ON l.case_id = s.case_id
        LEFT JOIN oct_cps_put p ON l.put_id = p.put_id
        LEFT JOIN oct_cps_valuation v ON l.valuation_id = v.valuation_id";
        $sql .= " WHERE {$condition} ORDER BY l.log_id DESC LIMIT {$start},{$pagesize}";
        $result['list'] = $this->QueryAll($sql);

        foreach ($result['list'] as $k=>$v) {
            $result['list'][$k]['member_name'] = '';
           if ($v['member_id']) $member_id[] = $v['member_id'];
        }
        if (isset($member_id) && $member_id) {
            $member_id_str = implode(',',$member_id);
            $member_list = $this->QueryAll("SELECT member_id,login_account,login_type FROM {{pam_members}} WHERE member_id IN ({$member_id_str})");
            $member_list_new = array();
            foreach ($member_list as $v) {
                if ($v['login_type'] == 'mobile') $member_list_new[$v['member_id']] = $v['login_account'];
                else {
                    if (isset($member_list_new[$v['member_id']])) continue;
                    else $member_list_new[$v['member_id']] = $v['login_account'];
                }
            }

            foreach ($result['list'] as $k=>$v) {
                if (isset($member_list_new[$v['member_id']])) $result['list'][$k]['member_name'] = $member_list_new[$v['member_id']];
            }
        }
        return $result;
    }

    /**
     * 日志统计
     *
     * @param $case_id
     * @return mixed
     */
    public function Statistics($case_id)
    {
        $sql = "select x.case_id,c.name,s.store_name,p.url,x.visit,x.login,x.register,x.order from(select l.case_id
        ,l.put_id
        ,sum(case when action=1 then 1 else 0 end) visit
        ,sum(case when action=4 then 1 else 0 end) login
        ,sum(case when action=2 then 1 else 0 end) register
        ,sum(case when action=3
                and exists(
                    select * from oct_cps_log g
                    where g.action=1
                    and g.visit_user=l.visit_user
                    and DATE_ADD(FROM_UNIXTIME(g.create_time),INTERVAL 7 DAY)>=FROM_UNIXTIME(l.create_time))
            then 1 else 0 end
            )  'order'
        from oct_cps_log l where l.case_id= {$case_id}
        group by l.put_id) x
        join oct_cps_case c on x.case_id=c.case_id
        join oct_cps_put p on x.put_id=p.put_id
        join oct_stores s on p.val_id = s.store_id
        order by x.visit desc
        ";

        return $this->QueryAll($sql);
    }
}
