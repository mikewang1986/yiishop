<?php
/**
 * 订单管理
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       /protected/modules/b2c/controllers
 * @version       v1.0.0
 */

class OrderController extends B2cController
{
    public function init()
    {
        if (!$this->username) $this->redirect('/account/login');
    }

    /**
     * 我的订单
     */
    public function actionIndex()
    {
        $Order = new ModelOrder();
        $status = $this->get('status');
        $model['pay_status'] = $pay_status = $this->get('pay_status','bool');
        $model['ship_status'] =  $ship_status = $this->get('pay_status','bool');
        $model['order_list'] = $Order->OrderList($this->member_id,0,15,$status,$pay_status,$ship_status);

        $this->render('index',array('model'=>$model));
    }

    /**
     * 订单详情
     */
    public function actionDetail()
    {
        $order_id = $this->get('order_id');

        $Order = new ModelOrder();
        $model['order_info'] = $Order->orderDetail($order_id);
        $model['order_product'] = $Order->OrderProduct($order_id);

        $this->render('detail',array('model'=>$model));
    }
} 