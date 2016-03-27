<?php

/**
 * "b2c_members" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Members extends BaseModel
{
    public $login_account;
    public $createtime;
    public $member_lv_name;
    public $Merbers = array();
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_members}}';
	}

    /**
     * @return string 相关的数据库表的名称
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
			'member_id' => 'Member',
			'member_lv_id' => 'Member Lv',
			'crm_member_id' => 'Crm Member',
			'name' => 'Name',
			'point' => 'Point',
			'lastname' => 'Lastname',
			'firstname' => 'Firstname',
			'area' => 'Area',
			'addr' => 'Addr',
			'mobile' => 'Mobile',
			'tel' => 'Tel',
			'email' => 'Email',
			'zip' => 'Zip',
			'order_num' => 'Order Num',
			'refer_id' => 'Refer',
			'refer_url' => 'Refer Url',
			'b_year' => 'B Year',
			'b_month' => 'B Month',
			'b_day' => 'B Day',
			'sex' => 'Sex',
			'addon' => 'Addon',
			'wedlock' => 'Wedlock',
			'education' => 'Education',
			'vocation' => 'Vocation',
			'interest' => 'Interest',
			'advance' => 'Advance',
			'advance_freeze' => 'Advance Freeze',
			'point_freeze' => 'Point Freeze',
			'point_history' => 'Point History',
			'score_rate' => 'Score Rate',
			'reg_ip' => 'Reg Ip',
			'regtime' => 'Regtime',
			'state' => 'State',
			'pay_time' => 'Pay Time',
			'biz_money' => 'Biz Money',
			'fav_tags' => 'Fav Tags',
			'custom' => 'Custom',
			'cur' => 'Cur',
			'lang' => 'Lang',
			'unreadmsg' => 'Unreadmsg',
			'disabled' => 'Disabled',
			'remark' => 'Remark',
			'remark_type' => 'Remark Type',
			'login_count' => 'Login Count',
			'experience' => 'Experience',
			'foreign_id' => 'Foreign',
			'resetpwd' => 'Resetpwd',
			'resetpwdtime' => 'Resetpwdtime',
			'member_refer' => 'Member Refer',
			'source' => 'Source',
		);
	}

    /**
     * 筛选条件
     *
     * @param $data
     * @return array
     */
    public function search($data)
    {
        $conditionArr = array();
        if (isset($data['member_id']) && $member_id =$data['member_id']){
            $conditionArr[] = "t.member_id = $member_id";
        }

        if (isset($data['login_account']) && $login_account = $data['login_account']) {
            $conditionArr[] = "p.login_account = '$login_account'";
        }

        if (isset($data['member_lv_id']) && $member_lv_list = $data['member_lv_id']) {
            $conditionArr[] = "t.member_lv_id = $member_lv_list";
        }
        $result['conditionArr'] = $conditionArr;

        return $result;
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

    /**
     * 会员列表
     *
     * @param $pageIndex
     * @param $pagesize
     * @return array
     */
    public function memberList($pageIndex,$pagesize)
    {
        $sql = " FROM {{pam_members}} p LEFT JOIN {{b2c_members}} m
        ON p.member_id = m.member_id";

        $count = $this->RowCount("SELECT count(*)".$sql);
        $select = 'p.member_id,p.createtime,m.name,m.mobile,m.email,m.point,m.member_lv_id';
        $start = ($pageIndex - 1) * $pagesize;
        $list = $this->QueryAll("SELECT {$select} ".$sql." ORDER BY p.member_id DESC LIMIT {$start},{$pagesize}");

        return array('count'=>$count,'list'=>$list);
    }
	/**
	 *会员列表
	 *
	 * @param $condition
	 * @param $pageIndex
	 * @param $pageSize
	 * @return mixed
	 */
	public function items($condition,$pageIndex,$pageSize)
	{

		$select = 'p.member_id,p.createtime,m.name,m.mobile,m.email,m.point,m.member_lv_id';
		$sql = $this->items_sql($select,$condition);
		$count = $this->RowCount($this->items_sql('count(*)',$condition));
		$start = ($pageIndex - 1)*$pageSize;
		$sql .= " ORDER BY m.member_id DESC LIMIT $start,$pageSize";
		return array('list'=>$this->QueryAll($sql),'count'=>$count);
	}
	/**
	 * 会员列表
	 *
	 * @param $select
	 * @param $condition
	 * @return string
	 */
	public function items_sql($select,$condition)
	{
		$sql = "SELECT {$select}
        FROM car_pam_members  p LEFT JOIN car_b2c_members m ON p.member_id = m.member_id";
		if ($condition) $sql .= " WHERE $condition";
		return $sql;
	}

	public function objectToArray($obj){
		$arr = is_object($obj) ? get_object_vars($obj) : $obj;
		if(is_array($arr)){
			return array_map(__FUNCTION__,$arr);
		}else{
			return $arr;
		}
	}
}
