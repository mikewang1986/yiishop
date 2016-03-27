<?php
/**
 * 分类列表
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       /protected/modules/b2c/controllers
 * @version       v1.0.0
 */
class CategoryController extends B2cController
{
    public $pagesize = 1;
    /**
     * 列表
     */
    public function actionIndex()
    {
        $cid = $this->get('cid');
        $page = isset($_GET['page'])?$this->get('page'):1;
        $model = array();
        $Product = new ModelProduct();
        $condition = "g.cat_id = {$cid} AND p.is_default = 'true'";
        $model['count'] = $Product->getCount($condition);
        $start = ($page - 1) * $this->pagesize;
        $model['product_list'] = $Product->getProducts(
            'g.goods_id,g.name,g.image_default_id,g.price,p.uptime,p.product_id,p.bn',
            $condition,'p.uptime DESC',$start,$this->pagesize
        );
        $Cat = new ModelCat();
        $model['cat'] = $Cat->Item("cat_id = {$cid}");
        $model['parent_cat'] = $Cat->Item("cat_id = {$model['cat']['parent_id']}");
        $mutli = Page::multi($page,$model['count'],$this->pagesize,'/category.html?cid='.$cid);
        $this->render('index',array('model'=>$model,'cid'=>$cid,'mutli'=>$mutli));
    }
}