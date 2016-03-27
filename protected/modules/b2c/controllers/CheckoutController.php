<?php
/**
 * 订单确认管理
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       /protected/modules/b2c/controllers
 * @version       v1.0.0
 */

class CheckoutController extends B2cController
{
    public function init()
    {
        if (!$this->username) $this->redirect('/account/login');
    }

    /**
     * 订单提交
     */
    public function actionIndex()
    {
        $Cart = new ModelCart();
        $result = $Cart->CardIdentProduct($this->member_id);
        if ($result['code'] == 400 || empty($result)) $this->redirect('/');

        $order_info = $result['data'];
        $item = $order_info['cart_list'];
        $num = $order_info['quantity_sum'];
        $amount = $order_info['amount'];
        $addr_row = $order_info['addr'];

        //配送方式
        $dly=$order_info['dly'];
        //支付方式
        $payment = $order_info['payment'];

        $this->render('checkout',
            array(
                'item'=>$item,
                'num'=>$num,
                'amount'=>$amount,
                'addr_row'=>$addr_row,
                'dly'=>$dly,
                'payment'=>$payment,
            )
        );
    }

    /**
     * 订单提交
     */
    public function actionSubmit()
    {
        $Order = new ModelOrder();
        $result = $Order->Create($this->member_id);

        if($result['code']== 400){
            header("Content-type:text/html;charset=utf-8");
            echo '<script>alert("'.$result['msg'].'");</script>';
            die;
        } else {
            $this->redirect('/order/index.html');
        }
    }
}