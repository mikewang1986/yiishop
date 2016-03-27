<?php
/**
 * 会员管理(后台）
 *
 * @author     wanglei<147566179@qq.com>
 * @copyright  Copyright 2008-2016 shop.feipin0512.com
 * @version    1.0
 */

class MemberController extends BaseController
{
    public $filter;
    public function init()
    {
        $Memberlv = new MemberLv();
        $this->filter = array(
            'disabled' => array(
                'false' => '正常',
                'true' => '禁用'
            )
        );
        $memberlvs = $Memberlv->MemberLvList();
        if (!empty($memberlvs)) {
            foreach($memberlvs as $kv=>$vv) {
                 $memberlist[$vv['member_lv_id']]=$vv['name'];
            }
        }
        $this->filter['member_lv_id'] = $memberlist;
    }
    /**
     * 会员列表
     */
    public function actionIndex()
    {
        $act = isset($_POST['act'])?$_POST['act']:'';
        $pageIndex = isset($_GET['page'])?$_GET['page']:1;
        //会员信息表
        $Members = new Members();
        $params = $this->get('Members');
        $result = $Members->items(MembersFilter::members($params),$pageIndex,$this->pagesize);
        $view = '_member_base';
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
        $member_id=intval($this->get('member_id'));
        $Members = new Members();
        $params = $this->get('Members');
        //会员信息表
        $member_info = Members::model()->find('member_id = :member_id',array(':member_id'=>$member_id));
        if ($_POST) {
            //会员信息列表
            $members_attributes = $this->post('Members');
           // $members_attributes['update_time'] = time();
        }
        $member_info1=$member_info->attributes;
        //地区
        $Regions = new Regions();
        $area_id= $Regions->getregion_id($member_info1['area']);
        $area_list = $Regions->RegionsChild($area_id);
        //会员用户表
        $pam_member_info = PamMembers::model()->find('member_id = :member_id',array(':member_id'=>$member_id));
        //会员等级
        $member_lv_list = MemberLv::model()->findAll();
        $member_info['login_account'] = $pam_member_info['login_account'];
        $this->render(
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

    /**
     * 动态获取地址
     */
    public function actionRegion()
    {
        $region_id = $this->post('region_id');
        $Addr = new ModelAddr();
        $region_list = $Addr->Regions($region_id);
        $region_str = '';
        foreach ($region_list as $v) {
            $region_str .= "<option value='{$v['region_id']}'>{$v['local_name']}</option>";
        }
        echo $region_str;
    }
} 