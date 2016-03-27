<?php
/**
 * 分类管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */

class CatController extends BaseController
{
    public $pagesize = 1000;

    public function init()
    {
        $this->registerJs(
            array('jquery.uploadify'),'end','bootstrap'
        );
        $this->registerJs(
            array('bootbox.min','oct/goods/cat', 'select2.min', 'oct/goods/goodcat_form'
            )
        );
    }
    /**
     * 分类列表
     */
    public function actionIndex()
    {
        $pageIndex = isset($_GET['page'])?$_GET['page']:1;
        $GoodsCat = new GoodsCat();
        $result = $GoodsCat->CatList($pageIndex,$this->pagesize);
        //分页
        $pages = new CPagination($result['count']);
        //render 和renderpartial之间最大的区别就是：一个是渲染模板，一个不渲染模板
        $this->render('index',array(
            'dataProvider'=>$result['item'],
            'pages' => $pages,
            'pageIndex'=>$pageIndex-1
        ));
    }

    /**
     * 分类编辑
     */
    public function actionUpdate()
    {
        $cat_id = $this->get('cat_id');
        $GoodsCat = new GoodsCat();
        $cat_row = GoodsCat::model()->find('cat_id = :cat_id',array(':cat_id'=>$cat_id));
        //商品类型
        $criteria = new CDbCriteria();
        $criteria->select = '*';
        $criteria->condition = "1=1";
        $criteria->order = 'type_id ASC';
        $type_list = GoodsType::model()->findAll($criteria);
        $type_arr = array();
        if ($type_list) {
            foreach ($type_list as $v) {
                $type_arr[$v->type_id] = $v->name;
            }
        }
        $model['type'] = $type_arr;
        $ImageImage = new ImageImage();
        if ($_POST) {
            $cat_attributes = $this->post('Cat');
            $cat_attributes['parent_id'] = $cat_attributes['parent_id']?$cat_attributes['parent_id']:0;
            $cat_path = ',';
            if ($cat_attributes['parent_id']) {
                $parent_row = GoodsCat::model()->find('cat_id = :cat_id',array(':cat_id'=>$cat_attributes['parent_id']));
                $cat_path = $parent_row['cat_path'];
            }
            $cat_attributes['cat_path'] = $cat_attributes['parent_id']?$cat_path.$cat_attributes['parent_id'].',':',';

            //商品类型
            $result =GoodsCat::model()->updatebypk($cat_id,$cat_attributes);
            if ($result) {

                //商品图片
                //最新上架-----------------加入缓存--------------------
                Yii::import("application.modules.b2c.models.ModelCat");
                Yii::import("application.modules.b2c.components.*");
                Yii::import("ext.redis.*");
                //分类列表
                $Cat = new ModelCat();
                $cat_list = $Cat->Items();
                $cat_cache = new ARedisCache();
                if($cat_cache->get("cat_list")){
                    $cat_cache->delete("cat_list");
                }
                if(!empty($cat_list)) {
                    foreach ($cat_list as $k => $v) {
                        $cat_cachearray[$k] = $v['cat_id'];
                    }
                    $cache_catstr=implode(",",$cat_cachearray);
                    $cat_cache->set('cat_list',$cache_catstr,5*10);
                }

                $this->referrer();
            } else {
                $this->message('error',CHtml::errorSummary($GoodsCat),$this->createUrl('index'));
            }
        }
        $result = $GoodsCat->CatList(0,$this->pagesize);
        $model['cat_row'] = $cat_row;
        //$model['type'] =  $type_row;
        //商品图片
        $model['image'] = $ImageImage->goods_cat_image($model['cat_row']['cat_id']);
        $model['parent'] = $result['item'];
        $this->render('update',array('model'=>$model));
    }

    /**
     * 分类添加
     */
    public function actionCreate()
    {
        $GoodsCat = new GoodsCat();
        if ($_POST) {
            $cat_attributes = $this->post('Cat');
            $cat_attributes['parent_id'] = $cat_attributes['parent_id']?$cat_attributes['parent_id']:0;

            $cat_path = ',';
            if ($cat_attributes['parent_id']) {
                $parent_row = GoodsCat::model()->find('cat_id = :cat_id',array(':cat_id'=>$cat_attributes['parent_id']));
                $cat_path = $parent_row['cat_path'];
            }
            $cat_attributes['cat_path'] = $cat_attributes['parent_id']?$cat_path.$cat_attributes['parent_id'].',':',';
            $GoodsCat->attributes = $cat_attributes;
            if ($GoodsCat->save()) {
                //最新分类ID
              /*  $cat_id = Yii::app()->db->getLastInsertID();
                //分类图片
                $ImageImage = new ImageImage();
                $image_attributes = $this->post('Image');
                $image_attach_attributes = $this->post('ImageAttach');
                $image_ids = $this->post('ImageId');
                $result = $ImageImage->imagecatList($image_attributes,$image_attach_attributes,$image_ids,$cat_id,"goods_cat");
                if (!$result) {
                    $this->message('error',CHtml::errorSummary($ImageImage),$this->createUrl('index'));
                }*/
                $this->referrer();
            } else {
                $this->message('error',CHtml::errorSummary($GoodsCat),$this->createUrl('index'));
            }


        }
        $result = $GoodsCat->CatList(0,$this->pagesize);
        $model['parent'] = $result['item'];

        //商品类型
        $type_list = GoodsType::model()->findAll();
        $type_arr = array();
        if ($type_list) {
            foreach ($type_list as $v) {
                $type_arr[$v['type_id']] = $v['name'];
            }
        }
        $model['type'] = $type_arr;

        if ($this->get('parent_id')) {
            $model['cat_row']['parent_id'] = $this->get('parent_id');
        }

        $this->render('create',array('model'=>$model));
    }

    /**
     * 品牌删除
     */
    public function actionDelete()
    {
        $cat_id = $this->get('cat_id');
        $cat_attributes['disabled'] = 'true';
        $cat_attributes['last_modify'] = time();
        $result = GoodsCat::model()->updatebypk($cat_id,$cat_attributes);
        if ($result) {
            $this->message('success','删除成功',$this->createUrl('index'));
        } else {
            $GoodsCat = new GoodsCat();
            $this->message('error',CHtml::errorSummary($GoodsCat),$this->createUrl('index'));
        }
    }

    /**
     * 分类图片
     */
    public function actionImg()
    {
        echo $this->renderPartial('img',array(),true);
    }

    /**
     * Ajax获取商品分类
     */
    public function actionAjaxgoodscat()
    {
        $cat_id = $this->post('cat_id');
        $GoodsCat = new GoodsCat();

        $default = $this->post('default');
        $result = $GoodsCat->CatSelect($cat_id,$default);
        $goods_select = $result['item'];
        if ($default == 0) {
            $cat_one = isset($goods_select['one'])?$goods_select['one']:array();
            $cat_two = isset($goods_select['two'])?$goods_select['two']:array();
            //$cat_three = isset($goods_select['three'])?$goods_select['three']:array();
            $cat_three = array();

            echo $this->renderPartial('_model_goods_cat',
                array(
                    'cat_id'=>$cat_id,
                    'cat_one'=>$cat_one,
                    'cat_two'=>$cat_two,
                    'cat_three'=>$cat_three,
                    'active'=>$result['active']
                ),
                true
            );
        }
        else if ($default == 1) {
            $cat_two = $goods_select['two'];
            echo TbHtml::navList($cat_two);
        }
        else if ($default == 2) {
            $cat_three = $goods_select['three'];
            echo TbHtml::navList($cat_three);
        }
    }
} 