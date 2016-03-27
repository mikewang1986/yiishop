<?php
/**
 * 会员管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */

class MemberController extends BaseController
{
    public $member_id;

    public function init()
    {
        $this->member_id = $_POST['member_id'];

    }

    /**
     * 基本信息
     */
    public function actionBase()
    {
        $act = isset($_POST['act'])?$_POST['act']:'';

        //会员信息表
        $member_info = Members::model()->find('member_id = :member_id',array(':member_id'=>$this->member_id));

        //会员用户表
        $pam_member_info = PamMembers::model()->find('member_id = :member_id',array(':member_id'=>$this->member_id));

        $member_info['login_account'] = $pam_member_info['login_account'];

        if (empty($act)) $view = 'base';
        else $view = '_member_base';

        echo $this->renderPartial($view,array('member_info'=>$member_info),true);
    }

    /**
     * 编辑会员
     */
    public function actionUpdate()
    {
        //会员信息表
        $member_info = Members::model()->find('member_id = :member_id',array(':member_id'=>$this->member_id));

        //地区
        $Regions = new Regions();
        $area_list = $Regions->AreaToAddr($member_info['area']);

        //会员用户表
        $pam_member_info = PamMembers::model()->find('member_id = :member_id',array(':member_id'=>$this->member_id));

        //会员等级
        $member_lv_list = MemberLv::model()->findAll();

        $member_info['login_account'] = $pam_member_info['login_account'];

        echo $this->renderPartial(
            '_update',
            array(
                'member_info'=>$member_info,
                'member_lv_list'=>$member_lv_list,
                'area_list'=>$area_list,
            )
        );
    }

    /**
     * 预存款
     */
    public function actionAdvance()
    {
        //会员信息表
        $member_info = Members::model()->find('member_id = :member_id',array(':member_id'=>$this->member_id));

        //预存款日志
        $advance_list = Advance::model()->findAll('member_id = :member_id',array(':member_id'=>$this->member_id));

        echo $this->renderPartial(
            '_advance',
            array(
                'member_info'=>$member_info,
                'advance_list'=>$advance_list,
            ),
            true
        );
    }

    /**
     * 经验值
     */
    public function actionExperience()
    {
        //会员信息表
        $member_info = Members::model()->find('member_id = :member_id',array(':member_id'=>$this->member_id));

        echo $this->renderPartial('_experience',array('member_info'=>$member_info),true);
    }

    /**
     * 订单
     */
    public function actionOrder()
    {
        Yii::import('application.modules.order.models.Orders');
        //订单列表
        $order_list = Orders::model()->findAll('member_id = :member_id',array(':member_id'=>$this->member_id));

        echo $this->renderPartial('_order',array('order_list'=>$order_list),true);
    }

    /**
     * 会员备注
     */
    public function actionRemark()
    {
        //会员信息表
        $member_info = Members::model()->find('member_id = :member_id',array(':member_id'=>$this->member_id));

        echo $this->renderPartial('_remark',array('member_info'=>$member_info),true);
    }
} 