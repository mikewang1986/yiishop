<?php
/**
 * 商品首页
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       /protected/modules/b2c/controllers
 * @version       v1.0.0
 */
class DefaultController extends B2cController
{
    public $layout='column_home';
    /**
     * 商城入口
     */
    public function actionIndex()
    {
        //get 方法得到的值
        Yii::import("ext.redis.*");
        //分类列表
        $Cat = new ModelCat();
        $model['cat_list'] = $Cat->Items();
      /*  $cat_list=new ARedisCache();
        if($cat_list->get('cat_list')){
            $cat_liststr=$cat_list->get('cat_list');
            if(!empty($cat_liststr)){
                $cat_listarray=explode(",",$cat_liststr);
                foreach($cat_listarray as $key=>$value){
                    $model['cat_list'][$key]['cat_id']=$value;
                }
            }
        }
        //最新上架
        $list = new ARedisList("productlist");
        if($list->count()>0){
             $goods_list=$list->getData();
             foreach( $goods_list as $k=>$v){
                 $model['new_list'][$k]=json_decode($v,true);
            }
        }
        else{*/
            $Product = new ModelProduct();
            $condition = "p.is_default = 'true'";
            $model['new_list'] = $Product->getProducts(
                'g.goods_id,g.name,g.image_default_id,g.price,p.uptime,p.product_id,p.bn',
                $condition,'p.uptime DESC',0,10
            );
        //}
        $this->render('index',array('model'=>$model));
    }
}