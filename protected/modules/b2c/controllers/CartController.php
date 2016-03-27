<?php
/**
 * 购物车列表
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       /protected/modules/b2c/controllers
 * @version       v1.0.0
 */

class CartController extends B2cController
{
    /**
     * 购物车列表
     */
    public function actionIndex()
    {
        if ($this->username) $this->_index();
        else $this->_indexcache();
    }

    /**
     * 登录用户购物车
     */
    private function _index()
    {
        $Cart = new ModelCart();
        $Product = new ModelProduct();
        //判断临时数据库信息
        $num = $Cart->CartProductSum($this->member_id);
//        $Cart->CartCacheInsert($this->member_id,$num);

        $cart_list = $Cart->Rows($this->member_id);
        $cart_list_new = $Product->CartGoods($cart_list);

        if (!$cart_list_new) $this->redirect('/cart/empty');

        $item = $cart_list_new['item'];

        $amount = $Cart->CartProductAmount($this->member_id);

        $this->render('index',array('item'=>$item,'num'=>$num,'amount'=>$amount));
    }

    /**
     * 游客购物车信息
     */
    public function _indexcache()
    {
        $CartCache = new ModelCartCache();
        $Product = new ModelProduct();

        $product_list = $CartCache->Product();
        if (!$product_list) $this->redirect('/cart/empty');

        $items = $Product->CartGoodsCache($product_list);
        $total = $CartCache->Total();

        $num = $total['total_num'];
        $amount = $total['total_price'];
        $this->render('index',array('item'=>$items['item'],'num'=>$num,'amount'=>$amount));
    }

    /**
     * 新增购物车商品
     */
    public function actionInsert()
    {
        $product_id = $this->post('product_id','int');
        $quantity = $this->post('quantity','int');
        $quantity_type = $this->post('quantity_type');

        if ($this->username) $this->_insert($product_id,$quantity,$quantity_type);
        else $this->_insertcache($product_id,$quantity,$quantity_type);
    }

    /**
     * 登录状态新增
     *
     * @param $product_id
     * @param $quantity
     * @param $quantity_type
     */
    private function _insert($product_id,$quantity,$quantity_type)
    {
        $Cart = new ModelCart();
        $Product = new ModelProduct();

        //购物车商品总数
        $num = $Cart->CartProductSum($this->member_id);
        //购物车商品信息
        $product_info = $Product->row($product_id,'goods_id,store,freez');

        $result = $Cart->CartInsert($this->member_id,$quantity,$product_id,$product_info['goods_id'],
            $num,$product_info['store'],$product_info['freez'],$quantity_type);

        echo json_encode($result);
    }

    /**
     * 未登录状态新增
     *
     * @param $product_id
     * @param $quantity
     * @param $quantity_type
     */
    private function _insertcache($product_id,$quantity,$quantity_type)
    {
        $Product = new ModelProduct();
        $CartCache = new ModelCartCache();
        //购物车商品总数

        //购物车商品信息
        $product_info = $Product->row($product_id,'goods_id,store,freez,price');
        $result = $CartCache->Add($quantity,$product_id,$product_info['goods_id'],
            $product_info['store'],$product_info['freez'],$product_info['price'],$quantity_type);

        echo json_encode($result);
    }

    /**
     * 删除购物车商品
     */
    public function actionDelete()
    {
        $product_id = $this->post('product_id');

        if ($this->username) $this->_delete($product_id);
        else $this->_deletecache($product_id);
    }

    private function _delete($product_id)
    {
        $Cart = new ModelCart();
        $Product = new ModelProduct();

        //货品信息
        $product_info = $Product->row($product_id,'goods_id,store');

        $result = $Cart->CartDelete($this->member_id,$product_id,$product_info['goods_id']);

        echo json_encode($result);
    }

    private function _deletecache($product_id)
    {
        $CartCache = new ModelCartCache();

        $result = $CartCache->Del($product_id);
        echo json_encode($result);
    }

    /**
     * 购物车为空
     */
    public function actionEmpty()
    {
        if ($this->username) {
            $Cart = new ModelCart();
            $Product = new ModelProduct();

            $cart_list = $Cart->Rows($this->member_id);
            $cart_list_new = $Product->CartGoods($cart_list);
            if ($cart_list_new) $this->redirect('index');
        }
        $this->render('empty');

    }
}