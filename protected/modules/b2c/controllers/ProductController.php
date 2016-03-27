<?php
/**
 * 商品详情
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       /protected/modules/b2c/controllers
 * @version       v1.0.0
 */

class ProductController extends B2cController
{
    /**
     * 商品详情
     */
    public function actionIndex()
    {
        $id = $this->get('id');
        $Product = new ModelProduct();
        $model['product'] = $Product->Item($id);
        if (!$model['product']['row']['goods_id']) {
            $this->redirect('/');
        }
        $cid = $model['product']['row']['cat_id'];
        //分类
        $Cat = new ModelCat();
        $model['cat'] = $Cat->Item("cat_id = {$cid}");
        //品牌
        $brand_id = $model['product']['row']['brand_id'];
        $Brand = new ModelBrand();
        $model['brand'] = $Brand->Item("brand_id = {$brand_id}");

        $model['parent_cat'] = $Cat->Item("cat_id = {$model['cat']['parent_id']}");

        $this->render('index',array('model'=>$model,'row'=>$model['product']['row'],'image'=>$model['product']['image']));
    }

    /**
     * 预览详情
     */
    public function actionDetail()
    {
        $id = $this->get('id');
        $Product = new ModelProduct();
        $model['product'] = $Product->Item($id);
        echo $this->renderPartial('detail',array('row'=>$model['product']['row'],'image'=>$model['product']['image']),true);
    }

    /**
     * 咨询
     */
    public function actionReview()
    {
        $product_id = $this->post('product_id');
        $name = $this->post('name');
        $email = $this->post('email');
        $review = $this->post('review');
        $Comment = new ModelComment();
        if ($Comment->add($product_id,$name,$email,$review)) {
            $this->sendJsonResponse(200,'咨询成功，客服尽快回复');
        } else {
            $this->sendJsonResponse(400,'咨询失败');
        }
    }
} 