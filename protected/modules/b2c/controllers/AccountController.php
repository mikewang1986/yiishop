<?php
/**
 * 用户中心
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       /protected/modules/b2c/controllers
 * @version       v1.0.0
 */

class AccountController extends B2cController
{
    /**
     * 会员中心首页
     */
    public function actionIndex()
    {
        $this->CheckLogin();
        //最近的订单
        $Order = new ModelOrder();
        $model['order_list'] = $Order->items('order_id,final_amount,createtime,status,pay_status',"member_id = {$this->member_id}");
        $this->render('index',array('model'=>$model));
    }

    /**
     * 用户登录
     */
    public function actionLogin()
    {
        $this->render('login',array('referer'=> $_SERVER['HTTP_REFERER']));
    }

    /**
     * 用户名、密码、验证
     */
    public function actionLogincheckall()
    {
        $user_name = $this->post('username');
        $password = $this->post('password');

        $User = new ModelAccount();
        $result = $User->Login($user_name,$password);

        echo json_encode($result);
    }

    /**
     * 用户注册
     */
    public function actionRegister()
    {
        $this->render('register');
    }

    /**
     * 用户注册提交
     */
    public function actionRescheckall()
    {
        $account = $this->post('username');
        $password = $this->post('password');
        $Register = new ModelAccount();
        $result = $Register->Register($account,$password);
        echo json_encode($result);
    }

    /**
     * 重置密码
     */
    public function actionReset()
    {
        $this->CheckLogin();
        $this->render('reset');
    }

    /**
     * 重置密码
     */
    public function actionResetcheck()
    {
        $this->CheckLogin();
        $pwd = $this->post('password');

        $user = new ModelAccount();
        if(empty($pwd) || mb_strlen($pwd,'utf-8')<6 || mb_strlen($pwd,'utf-8')>20) {

        }

        if (!$user->resetPwd($this->member_id,$pwd)) {
            echo json_encode(array('code'=>400,'msg'=>'密码重置失败'));
            die;
        }

        echo json_encode(array('code'=>200,'msg'=>'密码重置成功'));
    }

    /**
     * 用户退出
     */
    public function actionLogout()
    {
        $this->CheckLogin();
        unset(Yii::app()->session['member_id']);
        unset(Yii::app()->session['login_account']);
        unset(Yii::app()->session['mobile']);
        unset(Yii::app()->session['email']);
        unset(Yii::app()->session['login_time']);
        unset(Yii::app()->session['ctime']);
        unset(Yii::app()->session['b2c_member_total_num']);
        $this->redirect('/');
    }
    /**
     * 用户资料
     */
    public function  actionShopwap(){
        //验证是否登录
        $this->CheckLogin();
        $UserAccount = new ModelAccount();
        $Users=$UserAccount->get_userinfo($this->member_id);
        $outgoldinfo=unserialize($Users['outgoldinfo']);
        $this->render('shopwap',array('userinfo'=>$Users,'outgoldinfo'=>$outgoldinfo));
    }
    /**
     * 用户资料更新
     */
    public function actionSave(){
        //验证是否登录
         $this->CheckLogin();
        // $account = $this->post('members','new');
         // $outgoldinfo= $this->post('outgoldinfo','new');
         $account=$_POST['members'];
         $outgoldinfo= $_POST['outgoldinfo'];
         //print_r($outgoldinfo);
        ///  exit;
         $account['outgoldinfo']=serialize($outgoldinfo);
         $UserAccount = new ModelAccount();
         $UserAccount->save_userinfo($this->member_id,$account);
         $this->referrer();
    }

}