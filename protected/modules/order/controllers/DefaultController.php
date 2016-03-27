<?php

/**
 * 订单管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */
class DefaultController extends BaseController
{
    public function __construct($id,$module)
    {
        parent::__construct($id,$module);
    }

    public function init()
    {
        $this->registerJs(array('oct/order/order'));
    }

    /**
     * 订单列表
     */
    public function actionIndex()
	{
        $pageIndex = isset($_GET['page'])?$_GET['page']:1;
        $view = isset($_GET['view'])?$_GET['view']:0;
        $conditionArr = array();
        //待发货 pay_status:1;ship_status:0
        if ($view == 0) $conditionArr = array('pay_status'=>1,'ship_status'=>0);

        //已发货 ship_status:1
        if ($view == 1) $conditionArr = array('ship_status'=>1);

        //待支付 pay_status:0
        if ($view == 2) $conditionArr = array('pay_status'=>0);

        //已支付到担保方 pay_status:2
        if ($view == 3) $conditionArr = array('pay_status'=>2);

        //已支付 pay_status:1
        if ($view == 4) $conditionArr = array('pay_status'=>1);

        //货到付款
        if ($view == 5) $conditionArr = array('pay_status'=>10);

        //活动 status:active
        if ($view == 6) $conditionArr = array('status'=>'active','pay_status'=>0);

        //已作废 status:dead
        if ($view == 7) $conditionArr = array('status'=>'dead');

        //已完成 status:finish
        if ($view == 8) $conditionArr = array('status'=>'finish');

        //全部
        if ($view == 9) $conditionArr = array();

        $Order = new Orders();
        $result = $Order->orderList($conditionArr,$pageIndex,$this->pagesize);

        $order_list = array();
        foreach ($result['items'] as $k=>$v) {
            $order_list[$k] = $v;
            $order_list[$k]['pay_status_name'] = Params::PayStatus($v['pay_status']);
            $order_list[$k]['ship_status_name'] = Params::ShipStatus($v['ship_status']);
            $order_list[$k]['member_name'] = Params::PamMember($v['member_id']);
        }

        //分页
        $pages = new CPagination($result['count']);

		$this->render(
            'index',
            array(
                'dataProvider'=>$order_list,
                'view'=>$view,
                'pages' => $pages,
                'pageIndex'=>$pageIndex-1
            )
        );
	}
}