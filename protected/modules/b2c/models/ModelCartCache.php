<?php
/**
 * 临时购物车处理模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       yiishop.model
 * @license       http://www.yiitian.com/license
 * @version       v1.0.0
 */
class ModelCartCache extends B2cModel
{
    /**
     * 临时购物车商品列表
     *
     * @return bool
     */
    public function Product()
    {
        if (isset(Yii::app()->session['b2c_cart']['items']) && Yii::app()->session['b2c_cart']['items'])
            return Yii::app()->session['b2c_cart']['items'];
        else return false;
    }

    /**
     * 临时购物车商品统计
     *
     * @return array
     */
    public function Total()
    {
        return array(
            'total_num'=>Yii::app()->session['b2c_cart']['total_num'],
            'total_price'=>Yii::app()->session['b2c_cart']['total_price'],
        );
    }

    /**
     * 添加购物车
     *
     * @param $quantity
     * @param $product_id
     * @param $goods_id
     * @param $store
     * @param $freez
     * @param $price
     * @param $quantity_type
     * @return array
     */
    public function Add($quantity,$product_id,$goods_id,$store,$freez,$price,$quantity_type)
    {
        $items = Yii::app()->session['b2c_cart']['items']?Yii::app()->session['b2c_cart']['items']:array();
        $old_quantity = isset($items[$product_id]['quantity'])?$items[$product_id]['quantity']:0;
        if (isset($items[$product_id]) && $items[$product_id]['quantity'] && $quantity_type == 'add')
            $quantity += $items[$product_id]['quantity'];

        $items[$product_id] = array(
            'goods_id'=>$goods_id,
            'product_id'=>$product_id,
            'quantity'=>$quantity,
            'price'=>$price
        );

        if (($quantity+$freez) > $store) return array('code'=>400,'msg'=>'此商品您已购买了'.$old_quantity.'件,库存超过限制','product_quantity'=>0);

        $total_num = 0;
        $total_price= 0.00;
        foreach ($items as $v) {
            $total_num += $v['quantity'];
            $total_price += $v['quantity'] * $v['price'];
        }
        Yii::app()->session['b2c_member_total_num'] = $total_num;
        Yii::app()->session['b2c_cart'] = array(
            'items'=>$items,
            'total_num'=>$total_num,
            'total_price'=>sprintf('%1.2f',$total_price)
        );

        return array('code'=>200,'cart_sum'=>$total_num,'msg'=>'添加购物车成功','total_price'=>$total_price);
    }

    /**
     * 购物商品删除
     *
     * @param string $product_id
     * @return array|int
     */
    public function Del($product_id)
    {
        $items = Yii::app()->session['b2c_cart']['items'];
        if (!isset($items[$product_id])) return array('code'=>400,'msg'=>'删除失败');

        unset($items[$product_id]);
        $total_num = 0;
        $total_price= 0.00;
        foreach ($items as $v) {
            $total_num += $v['quantity'];
            $total_price += $v['quantity'] * $v['price'];
        }
        Yii::app()->session['b2c_member_total_num'] = $total_num;
        Yii::app()->session['b2c_cart'] = array(
            'items'=>$items,
            'total_num'=>$total_num,
            'total_price'=>sprintf('%1.2f',$total_price)
        );

        return array('code'=>200,'cart_sum'=>$total_num,'total_price'=>$total_price);
    }
}