<?php
/**
 * 会员信息管理.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       yiishop.model
 * @license       http://www.yiitian.com/license
 * @version       v1.0.0
 */

class ModelAccount extends B2cModel
{
    /**
     * 用户登录校验
     *
     * @param $user
     * @param $password
     * @return array
     */
    public function Login($user,$password)
    {
        $user_info = $this->ModelQueryRow("SELECT * FROM {{pam_members}} WHERE login_account = '{$user}'");

        if (!$user_info) return array('code'=>400,'msg'=>'用户不存在');
        $user_info_member = $this->ModelQueryRow("SELECT member_id,mobile,email FROM {{b2c_members}} WHERE member_id = {$user_info['member_id']}");

        if ($user_info['login_password'] != $this->extends_md5(
                $password,$user_info['login_account'],$user_info['createtime'])
        ) {
            return array('code'=>400,'msg'=>'密码错误');
        }

        Yii::app()->session['member_id'] = $user_info['member_id'];
        Yii::app()->session['login_account'] = $user_info['login_account'];
        Yii::app()->session['mobile'] = $user_info_member['mobile'];
        Yii::app()->session['email'] = $user_info_member['email'];
        Yii::app()->session['login_time'] = time();
        Yii::app()->session['ctime'] = $user_info['createtime'];

        //合并购物车
//        $Cart = new WapCart();
//        $Cart->CartCacheInsert($user_info['member_id'],$Cart->CartProductSum($user_info['member_id']));

        return array(
            'code'=>200,
            //'msg'=>$this->UrlRef(),
            'data'=>array(
                'member_id'=>$user_info['member_id'],
                'member_name'=>$user_info['login_account'],
                'login_time'=>time(),
                'ctime'=>$user_info['createtime'],
                'timeout'=>3600*5,
            )
        );
    }

    /**
     * 用户注册
     *
     * @param $account
     * @param $password
     * @return array
     */
    public function Register($account,$password)
    {
        $user_info_member = $this->ModelQueryRow("SELECT member_id FROM {{pam_members}} WHERE password_account = '{$account}'");
        if ($user_info_member) return array('code'=>400,'msg'=>'用户名已存在');
        $user_name = $account;
        $insert_time = time();
        $password = $this->extends_md5($password,$user_name,$insert_time);
        //$Point = new WapPoint();
        $transaction = Yii::app()->db->beginTransaction();
        try {
            //新增数据到会员信息主表：car_b2c_members
            $this->ModelInsert('{{b2c_members}}',array(
                'name'=>$user_name,
                'regtime'=>$insert_time,
                'cur'=>'CNY',
                'source'=>'pc',
                'tel'=>$account,
                'sex'=>'0',
                'member_lv_id'=>1,
            ));
            $member_id = Yii::app()->db->getLastInsertID();
            //新增数据到会员用户名、密码表：car_pam_members
            $this->ModelInsert('{{pam_members}}',array(
                'member_id'=>$member_id,
                'login_account'=>$account,
                'login_type'=>'mobile',
                'login_password'=>$password,
                'password_account'=>$account,
                'disabled'=>'false',
                'createtime'=>$insert_time
            ));
            //注册送积分
            //$Point->Register($member_id);

            $transaction->commit();

            Yii::app()->session['member_id'] = $member_id;
            Yii::app()->session['login_account'] = $user_name;
            Yii::app()->session['mobile'] = $account;
            Yii::app()->session['email'] = '';
            Yii::app()->session['login_time'] = time();
            Yii::app()->session['ctime'] = $insert_time;

            $data = array(
                'code'=>200,
                'msg'=>'用户注册成功',
                'member_id'=>$member_id,
                'member_name'=>$account,
                'login_time'=>$insert_time,
                'ctime'=>$insert_time,
                'url_ref'=>$this->UrlRef()
            );

            return $data;
        } catch(Exception $e) {
            $transaction->rollback();
            return array('code'=>400,'msg'=>'用户注册失败');
        }
    }

    /**
     * 找回密码
     *
     * @param $account
     * @param $password
     * @return mixed
     */
    public function FindPw($account,$password)
    {
        $user_info = $this->ModelQueryRow("SELECT * FROM car_pam_members WHERE login_account = '$account' AND login_type = 'mobile'");
        $user_name = $account;
        $insert_time = $user_info['createtime'];
        $password = $this->extends_md5($password,$user_name,$insert_time);
        if ($user_info['login_password'] == $password) return true;

        return $this->ModelEdit(
            'car_pam_members',
            array('login_account'=>$account,'login_type'=>'mobile'),
            array('login_password'=>$password)
        );
    }

    /**
     * 重置密码
     * @param $member_id
     * @param string $password
     * @return bool
     */
    public function resetPwd($member_id,$password)
    {
        $user_info = $this->ModelQueryRow("SELECT * FROM {{pam_members}} WHERE member_id = {$member_id}");
        $user_name = $user_info['login_account'];
        $insert_time = $user_info['createtime'];
        $password = $this->extends_md5($password,$user_name,$insert_time);
        return $this->ModelExecute("UPDATE {{pam_members}} SET login_password ='$password'
        WHERE member_id = {$member_id}");
    }

    /**
     * 返回页面
     *
     * @return mixed
     */
    public function UrlRef()
    {
        if (Yii::app()->session['url_referrer']) return Yii::app()->session['url_referrer'];
        return Yii::app()->request->urlReferrer;
    }
    /**
     * 得到用户信息
     *
     * @return mixed
     */
    public function get_userinfo($member_id)
    {
        $user_info = $this->ModelQueryRow("SELECT * FROM {{b2c_members}} WHERE member_id = {$member_id}");
        return $user_info;
    }
    /*
     * 更新用户信息
     */
     public function save_userinfo($member_id,$account){
         return $this->ModelEdit('{{b2c_members}}',array('member_id'=>$member_id),$account);
     }
} 