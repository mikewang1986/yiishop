<?php
/**
 * 订单管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */

class OrderController extends BaseController
{
    public function __construct($id,$module)
    {
        parent::__construct($id,$module);
        //Yii::app()->clientScript->registerCssFile(Yii::app()->baseUrl.'/css/my.css');
    }

    /**
     * 基本信息
     */
    public function actionBase()
    {
        $order_id = $_POST['order_id'];
        $act = isset($_POST['act'])?$_POST['act']:'';
        $order_info = Orders::model()->find('order_id = :order_id',array(':order_id'=>$order_id));

        //支付详情
        $OrderBills = new OrderBills();
        $payment_info = $OrderBills->OrderPayment($order_id,true);

        //会员信息
        $user_name = Params::PamMember($order_info->member_id);
        $user_info = Params::Member($order_info->member_id);
        $user_info_addon = unserialize($user_info['addon']);

        //商品信息
        $product_list = OrderItems::model()->findAll('order_id = :order_id',array(':order_id'=>$order_id));

        if (empty($act)) $view = 'base';
        else $view = '_order_base';

        echo $this->renderPartial(
            $view,
            array(
                'order_id'=>$order_id,
                'order_info'=>$order_info,
                'payment_info'=>$payment_info,
                'user_name'=>$user_name,
                'user_info'=>$user_info,
                'user_info_addon'=>$user_info_addon,
                'product_list'=>$product_list,
            ),
            true
        );
    }

    /**
     * 商品
     */
    public function actionItem()
    {
        $order_id = $_POST['order_id'];

        //商品信息
        $product_list = OrderItems::model()->findAll('order_id = :order_id',array(':order_id'=>$order_id));

        echo $this->renderPartial(
            '_order_item',array('order_id'=>$order_id,'product_list'=>$product_list),
            true
        );
    }

    /**
     * 收退款记录
     */
    public function actionBills()
    {
        $order_id = $_POST['order_id'];

        //支付详情
        $OrderBills = new OrderBills();
        $payments_list = $OrderBills->OrderPayment($order_id);
        $refunds_list = $OrderBills->OrderRefunds($order_id);

        echo $this->renderPartial(
            '_order_bills',
            array(
                'order_id'=>$order_id,
                'payments_list'=>$payments_list,
                'refunds_list'=>$refunds_list,
            ),
            true
        );
    }

    /**
     * 收发货记录
     */
    public function actionDelivery()
    {
        $order_id = $_POST['order_id'];

        $OrderDelivery = new OrderDelivery();
        $delivery_list = $OrderDelivery->Delivery($order_id);

        $reship_list = $OrderDelivery->Reship($order_id);


        echo $this->renderPartial(
            '_order_delivery',
            array(
                'order_id' => $order_id,
                'delivery_list'=>$delivery_list,
                'reship_list'=>$reship_list,
            ),
            true
        );
    }

    /**
     * 优惠方案
     */
    public function actionPmt()
    {
        $order_id = $_POST['order_id'];

        $pmt_list = OrderPmt::model()->findAll(
            'order_id = :order_id AND pmt_type = :pmt_type',
            array(
                ':order_id'=>$order_id,
                ':pmt_type'=>'order'
            )
        );

        echo $this->renderPartial(
            '_order_pmt',
            array('pmt_list'=>$pmt_list),
            true
        );
    }

    /**
     * 订单留言
     */
    public function actionMark()
    {
        $order_id = $_POST['order_id'];

        $order_info = Orders::model()->find('order_id = :order_id',array(':order_id'=>$order_id));
        $mark_text = $order_info->mark_text;

        if ($mark_text) $mark_text = unserialize($mark_text);

        echo $this->renderPartial(
            '_order_mark',
            array('mark_text'=>$mark_text),
            true
        );
    }

    /**
     * 订单日志
     */
    public function actionLogs()
    {
        $order_id = $_POST['order_id'];

        $log_list = OrderLog::model()->findAll('rel_id = :order_id',array(':order_id'=>$order_id));
        foreach ($log_list as $v) {
            $item['op_name'] = $v->op_name;
            $item['alttime'] = $v->alttime;
            $item['bill_type'] = $v->bill_type;
            $item['behavior'] = Params::BehaviorStatus($v->behavior);
            $item['result'] = $v->result==='SUCCESS'?'成功':'失败';
            $log_text = unserialize($v->log_text);
            $item['txt_key'] = $log_text[0]['txt_key'];

            $item_list[] = $item;
        }

        echo $this->renderPartial(
            '_order_logs',
            array('item_list'=>$item_list),
            true
        );
    }

    /**
     * 顾客留言
     */
    public function actionMsg()
    {
        $order_id = $_POST['order_id'];
        Yii::import('application.modules.member.models.Comments');

        //商品信息
        $product_list = OrderItems::model()->findAll('order_id = :order_id',array(':order_id'=>$order_id));

        //评论信息
        $comment = Comments::model()->findAll('order_id = :order_id',array(':order_id'=>$order_id));

        echo $this->renderPartial(
            '_order_msg',
            array('comment'=>$comment,'product_list'=>$product_list),
            true
        );
    }
} 