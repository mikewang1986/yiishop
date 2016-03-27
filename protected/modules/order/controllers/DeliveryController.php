<?php
/**
 * 发/退货管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */

class DeliveryController extends BaseController
{
    public function __construct($id,$module)
    {
        parent::__construct($id,$module);
    }

    /**
     * 发货单
     */
    public function actionIndex()
    {
        $order_id = $this->post('order_id');
        $order_info = Orders::model()->find('order_id = :order_id',array(':order_id'=>$order_id));
        $dlycorp_list = Dlycorp::model()->findAll("disabled = 'false'");
        $Delivery = new Delivery();
        $addr_info = $Delivery->AreaToAddr($order_info['ship_area']);

        echo $this->renderPartial(
            'index',
            array(
                'order_id'=>$order_id,
                'order_info'=>$order_info,
                'dlycorp_list'=>$dlycorp_list,
                'addr_info'=>$addr_info
            ),
            true
        );
    }

    /**
     * 发货创建
     */
    public function actionCreate()
    {
        $order_id = $this->post('order_id');
        $delivery_attributes = $this->post('Delivery');
        $params_attributes = $this->post('Params');
        $area = $this->post('Area');

        if ($area['town']) $params_attributes['region_id'] = $area['town'];
        elseif ($area['city']) $params_attributes['region_id'] = $area['city'];
        else $params_attributes['region_id'] = $area['province'];

        $Delivery = new Delivery();
        $result = $Delivery->OrderDelivery($order_id,$delivery_attributes,$params_attributes);
        echo json_encode($result);
    }

    /**
     * 退货
     */
    public function actionReship()
    {
        $order_id = $this->post('order_id');
        $Order = new Orders();
        $order_info = $Order->Item($order_id);
        $dlycorp_list = Dlycorp::model()->findAll("disabled = 'false'");
        $Delivery = new Delivery();
        $addr_info = $Delivery->AreaToAddr($order_info['ship_area']);

        echo $this->renderPartial(
            'reship',
            array(
                'order_id'=>$order_id,
                'order_info'=>$order_info,
                'dlycorp_list'=>$dlycorp_list,
                'addr_info'=>$addr_info
            ),
            true
        );
    }

    /**
     * 退货创建
     */
    public function actionReshipcreate()
    {
        $order_id = $this->post('order_id');
        $reship_attributes = $this->post('Reship');
        $params_attributes = $this->post('Params');
        $area = $this->post('Area');

        if ($area['town']) $params_attributes['region_id'] = $area['town'];
        elseif ($area['city']) $params_attributes['region_id'] = $area['city'];
        else $params_attributes['region_id'] = $area['province'];

        $Delivery = new Delivery();
        $result = $Delivery->OrderReship($order_id,$reship_attributes,$params_attributes);
        echo json_encode($result);
    }

    /**
     * 动态获取地址
     */
    public function actionRegion()
    {
        $region_id = $this->post('region_id');
        $Delivery = new Delivery();
        $region_list = $Delivery->Regions($region_id);

        $region_str = '';
        foreach ($region_list as $v) {
            $region_str .= "<option value='{$v['region_id']}'>{$v['local_name']}</option>";
        }

        echo $region_str;
    }
}