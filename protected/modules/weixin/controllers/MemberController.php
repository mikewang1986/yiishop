<?php
/**
 * 微信号管理
 *
 * @author     王磊<147566179@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */

class MemberController extends BaseController
{
   // public $weixin_id;
    public function init()
    {
        //$this->weixin_id = $_POST['weixin_id'];
    }
      /**
     * 微信列表
     */
    public function actionIndex()
    {
        $act = isset($_POST['act'])?$_POST['act']:'';
        $pageIndex = isset($_GET['page'])?$_GET['page']:1;
        //会员信息表
        $Members = new Weixin();
        $params = $this->get('Weixin');
        $agentid= isset($_GET['agentid'])?$_GET['agentid']:0;
        $map=array('agentid'=>$agentid);
        $result = $Members->weixinList($pageIndex,$this->pagesize);
        $view = '_weixin_base';
        //分页
        $pages = new CPagination($result['count']);
        $this->render($view,array(
            'dataProvider'=>$result['list'],
            'pages' => $pages,
            'pageIndex'=>$pageIndex-1,
            'params'=>$params
        ));
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