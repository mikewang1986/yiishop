<?php
/**
 * "imicms_wxuser" 数据表模型类.
 *
 * @author        wanglei<147566179@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Weixin extends BaseModel
{
    public $login_account;
    public $createtime;
    public $weixin_name;
    public $Merbers = array();
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{imicms_wxuser}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('uid, wxname, wxid, weixin, headerpic, token, province, city, areaid, qq, wxfans, typeid, tongji, allcardnum, cardisok, yetcardnum, totalcardnum, createtime, tpltypeid, updatetime, tpltypename, tpllistid, tpllistname, tplcontentid, menuid, tplcontentname, copyid, smtp_plat_host, smtp_plat_send, smtp_plat_pass, smtp_plat_reply, sms_plat_reply, sms_plat_user, sms_plat_pass, color_id, share_ticket, share_dated, authorizer_access_token, authorizer_refresh_token, authorizer_expires, type, web_access_token, web_refresh_token, web_expires, wx_coupons, card_ticket, wx_liaotian, card_expires, qr, eqx, eqxpassword, guanhuai, title1, title2, url, text', 'required'),
			array('uid, winxintype, wxfans, typeid, allcardnum, cardisok, yetcardnum, totalcardnum, tpltypeid, tpllistid, tplcontentid, menuid, copyid, smtp_plat_status, smtp_plat_port, smtp_plat_order_feed, smtp_plat_pay_feed, sms_plat_status, sms_plat_order_feed, sms_plat_pay_feed, shoptpltypeid, transfer_customer_service, color_id, smsstatus, emailstatus, printstatus, agentid, openphotoprint, freephotocount, oauth, encode, ifbiz, oauthinfo, type, wx_coupons, wx_liaotian, dynamicTmpls, guanhuai', 'numerical', 'integerOnly'=>true),
			array('wxname, city, smtp_plat_host, smtp_plat_send, smtp_plat_pass, smtp_plat_reply, sms_plat_reply, sms_plat_user, sms_plat_pass, sub_notice_btn', 'length', 'max'=>60),
			array('appid, appsecret, areaid, routerid, member_code, feiyin_key', 'length', 'max'=>50),
			array('wxid, weixin, tpltypename, tpllistname, tplcontentname, namecolor, shoptpltypename, phone, smsuser, smspassword, emailuser, emailpassword, fuwuappid', 'length', 'max'=>20),
			array('headerpic, token, copyright, sub_notice, need_phone_notice, title1, title2, url, text', 'length', 'max'=>255),
			array('province, device_no', 'length', 'max'=>30),
			array('qq', 'length', 'max'=>25),
			array('typename', 'length', 'max'=>90),
			array('createtime, updatetime', 'length', 'max'=>13),
			array('smtp_plat_ssl', 'length', 'max'=>1),
			array('pigsecret, share_ticket', 'length', 'max'=>150),
			array('email', 'length', 'max'=>100),
			array('aeskey', 'length', 'max'=>45),
			array('share_dated, card_expires', 'length', 'max'=>15),
			array('authorizer_access_token, authorizer_refresh_token, web_access_token, web_refresh_token', 'length', 'max'=>200),
			array('authorizer_expires, web_expires', 'length', 'max'=>10),
			array('card_ticket', 'length', 'max'=>120),
			array('qr', 'length', 'max'=>1000),
			array('eqx', 'length', 'max'=>5),
			array('eqxpassword', 'length', 'max'=>32),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, uid, wxname, winxintype, appid, appsecret, wxid, weixin, headerpic, token, province, city, areaid, qq, wxfans, typeid, typename, tongji, allcardnum, cardisok, yetcardnum, totalcardnum, createtime, tpltypeid, updatetime, tpltypename, tpllistid, tpllistname, tplcontentid, menuid, tplcontentname, copyright, namecolor, copyid, smtp_plat_status, smtp_plat_host, smtp_plat_port, smtp_plat_send, smtp_plat_pass, smtp_plat_reply, smtp_plat_ssl, smtp_plat_order_feed, smtp_plat_pay_feed, sms_plat_status, sms_plat_reply, sms_plat_user, sms_plat_pass, sms_plat_order_feed, sms_plat_pay_feed, shoptpltypeid, shoptpltypename, routerid, pigsecret, transfer_customer_service, color_id, smsstatus, phone, smsuser, smspassword, emailstatus, email, emailuser, emailpassword, printstatus, member_code, feiyin_key, device_no, agentid, openphotoprint, freephotocount, oauth, aeskey, encode, ifbiz, fuwuappid, oauthinfo, share_ticket, share_dated, authorizer_access_token, authorizer_refresh_token, authorizer_expires, type, web_access_token, web_refresh_token, web_expires, wx_coupons, card_ticket, wx_liaotian, card_expires, qr, dynamicTmpls, sub_notice, need_phone_notice, sub_notice_btn, eqx, eqxpassword, guanhuai, title1, title2, url, text', 'safe', 'on'=>'search'),
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
			'id' => 'ID',
			'uid' => 'Uid',
			'wxname' => 'Wxname',
			'winxintype' => 'Winxintype',
			'appid' => 'Appid',
			'appsecret' => 'Appsecret',
			'wxid' => 'Wxid',
			'weixin' => 'Weixin',
			'headerpic' => 'Headerpic',
			'token' => 'Token',
			'province' => 'Province',
			'city' => 'City',
			'areaid' => 'Areaid',
			'qq' => 'Qq',
			'wxfans' => 'Wxfans',
			'typeid' => 'Typeid',
			'typename' => 'Typename',
			'tongji' => 'Tongji',
			'allcardnum' => 'Allcardnum',
			'cardisok' => 'Cardisok',
			'yetcardnum' => 'Yetcardnum',
			'totalcardnum' => 'Totalcardnum',
			'createtime' => 'Createtime',
			'tpltypeid' => 'Tpltypeid',
			'updatetime' => 'Updatetime',
			'tpltypename' => 'Tpltypename',
			'tpllistid' => 'Tpllistid',
			'tpllistname' => 'Tpllistname',
			'tplcontentid' => 'Tplcontentid',
			'menuid' => 'Menuid',
			'tplcontentname' => 'Tplcontentname',
			'copyright' => 'Copyright',
			'namecolor' => 'Namecolor',
			'copyid' => 'Copyid',
			'smtp_plat_status' => 'Smtp Plat Status',
			'smtp_plat_host' => 'Smtp Plat Host',
			'smtp_plat_port' => 'Smtp Plat Port',
			'smtp_plat_send' => 'Smtp Plat Send',
			'smtp_plat_pass' => 'Smtp Plat Pass',
			'smtp_plat_reply' => 'Smtp Plat Reply',
			'smtp_plat_ssl' => 'Smtp Plat Ssl',
			'smtp_plat_order_feed' => 'Smtp Plat Order Feed',
			'smtp_plat_pay_feed' => 'Smtp Plat Pay Feed',
			'sms_plat_status' => 'Sms Plat Status',
			'sms_plat_reply' => 'Sms Plat Reply',
			'sms_plat_user' => 'Sms Plat User',
			'sms_plat_pass' => 'Sms Plat Pass',
			'sms_plat_order_feed' => 'Sms Plat Order Feed',
			'sms_plat_pay_feed' => 'Sms Plat Pay Feed',
			'shoptpltypeid' => 'Shoptpltypeid',
			'shoptpltypename' => 'Shoptpltypename',
			'routerid' => 'Routerid',
			'pigsecret' => 'Pigsecret',
			'transfer_customer_service' => 'Transfer Customer Service',
			'color_id' => 'Color',
			'smsstatus' => 'Smsstatus',
			'phone' => 'Phone',
			'smsuser' => 'Smsuser',
			'smspassword' => 'Smspassword',
			'emailstatus' => 'Emailstatus',
			'email' => 'Email',
			'emailuser' => 'Emailuser',
			'emailpassword' => 'Emailpassword',
			'printstatus' => 'Printstatus',
			'member_code' => 'Member Code',
			'feiyin_key' => 'Feiyin Key',
			'device_no' => 'Device No',
			'agentid' => 'Agentid',
			'openphotoprint' => 'Openphotoprint',
			'freephotocount' => 'Freephotocount',
			'oauth' => 'Oauth',
			'aeskey' => 'Aeskey',
			'encode' => 'Encode',
			'ifbiz' => 'Ifbiz',
			'fuwuappid' => 'Fuwuappid',
			'oauthinfo' => 'Oauthinfo',
			'share_ticket' => 'Share Ticket',
			'share_dated' => 'Share Dated',
			'authorizer_access_token' => 'Authorizer Access Token',
			'authorizer_refresh_token' => 'Authorizer Refresh Token',
			'authorizer_expires' => 'Authorizer Expires',
			'type' => 'Type',
			'web_access_token' => 'Web Access Token',
			'web_refresh_token' => 'Web Refresh Token',
			'web_expires' => 'Web Expires',
			'wx_coupons' => 'Wx Coupons',
			'card_ticket' => 'Card Ticket',
			'wx_liaotian' => 'Wx Liaotian',
			'card_expires' => 'Card Expires',
			'qr' => 'Qr',
			'dynamicTmpls' => 'Dynamic Tmpls',
			'sub_notice' => 'Sub Notice',
			'need_phone_notice' => 'Need Phone Notice',
			'sub_notice_btn' => 'Sub Notice Btn',
			'eqx' => 'Eqx',
			'eqxpassword' => 'Eqxpassword',
			'guanhuai' => 'Guanhuai',
			'title1' => 'Title1',
			'title2' => 'Title2',
			'url' => 'Url',
			'text' => 'Text',
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

    /**
     * 公众号列表
     *
     * @param $pageIndex
     * @param $pagesize
     * @return array
     */
    public function weixinList($pageIndex,$pagesize,$map="")
    {
        $sql = " FROM {{imicms_wxuser}} ";
        $count = $this->RowCount("SELECT count(*)".$sql);
        $select = 'id,wxname,agentid,uid';
        $start = ($pageIndex - 1) * $pagesize;
        $list = $this->QueryAll("SELECT {$select} ".$sql." ORDER BY id DESC LIMIT {$start},{$pagesize}");
		if(!empty($list)){
			foreach($list as $key=>$value){
				$usersql=" select member_id,member_lv_id,name as username from {{b2c_members}} where member_id=".$value['uid'];
				$user=$this->QueryRow($usersql);
				if($user){
					$list[$key]['user']['username']=$user['username'];
					//微信等级
					$list[$key]['user']['gid']=$user['member_lv_id']-1;
				}
			}
		}
        return array('count'=>$count,'list'=>$list);
    }

	/**
	 * 公众号列表
	 *
	 * @param $select
	 * @param $condition
	 * @return string
	 */
	public function items_sql($select,$condition)
	{
		$sql = "SELECT {$select}
        FROM car_imicms_wxuser";
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
