<?php
/**
 * 品牌管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */
class BrandController extends BaseController
{
    public function __construct($id,$module)
    {
        parent::__construct($id,$module);
    }

    public function init()
    {
        $this->registerJs(
            array('jquery.uploadify'),
            'end','bootstrap'
        );
        $this->registerJs(
            array(
                'oct/goods/brand'
            ),
            'end'
        );
    }

    /**
     * 品牌列表
     */
    public function actionIndex()
    {
        $pageIndex = isset($_GET['page'])?$_GET['page']:1;
        $Brand = new Brand();
        $result = $Brand->BrandList($pageIndex,$this->pagesize);

        //分页
        $pages = new CPagination($result['count']);

        $this->render('index',array(
            'dataProvider'=>$result['item'],
            'pages' => $pages,
            'pageIndex'=>$pageIndex-1
        ));
    }

    /**
     * 品牌编辑
     */
    public function actionUpdate()
    {
        $brand_id = $this->get('brand_id');
        if ($_POST) {
            $brand_attributes = $this->post('Brand');
            $type_attributes = $this->post('GoodsType');

            $brand_attributes['last_modify'] = time();
            $result = Brand::model()->updatebypk($brand_id,$brand_attributes);
            if (!$result) {
                $Brand = new Brand();
                $this->message('error',CHtml::errorSummary($Brand),$this->createUrl('index'));
            }

            if ($type_attributes) {
                $TypeBrand = new TypeBrand();
                $result = $TypeBrand->type_brand_update($brand_id,$type_attributes);
                if (!$result) {
                    $this->message('error',CHtml::errorSummary($TypeBrand),$this->createUrl('index'));
                }
            }
            $this->referrer();
        }
        $model['brand_item'] = Brand::model()->find('brand_id = :brand_id',array(':brand_id'=>$brand_id));
        $model['type_list'] = GoodsType::model()->findAll('disabled = :disabled',array(':disabled'=>'false'));
        $type_brand_list = TypeBrand::model()->findAll('brand_id = :brand_id',array(':brand_id'=>$brand_id));
        $model['type_brand_list'] = array();
        foreach ($type_brand_list as $v) {
            $model['type_brand_list'][] = $v['type_id'];
        }

        $this->render('update',array('model'=>$model));
    }

    /**
     * 品牌创建
     */
    public function actionCreate()
    {
        if ($_POST) {
            $Brand = new Brand();
            $Brand->attributes = $this->post('Brand');
            $type_attributes = $this->post('GoodsType');

            if (!$Brand->save()) {
                $Brand = new Brand();
                $this->message('error',CHtml::errorSummary($Brand),$this->createUrl('index'));
            }

            if ($type_attributes) {
                $brand_id = Yii::app()->db->getLastInsertID();
                $TypeBrand = new TypeBrand();
                $result = $TypeBrand->type_brand_insert($brand_id,$type_attributes);
                if (!$result) {
                    $this->message('error',CHtml::errorSummary($TypeBrand),$this->createUrl('index'));
                }
            }
            $this->referrer();
        }
        $model['type_list'] = GoodsType::model()->findAll('disabled = :disabled',array(':disabled'=>'false'));
        $this->render('create',array('model'=>$model));
    }

    /**
     * 品牌删除
     */
    public function actionDelete()
    {
        $brand_id = $this->get('brand_id');
        $brand_attributes['disabled'] = 'true';
        $brand_attributes['last_modify'] = time();
        $result = Brand::model()->updatebypk($brand_id,$brand_attributes);
        if ($result) {
            $this->message('success','删除成功',$this->createUrl('index'));
        } else {
            $Brand = new Brand();
            $this->message('error',CHtml::errorSummary($Brand),$this->createUrl('index'));
        }
    }

    /**
     * 品牌列表Dialog展示
     */
    public function actionSpecial()
    {
        $brand_list = Brand::model()->findAll(
            'disabled = :disabled',
            array(':disabled'=>'false'),
            array('select'=>'brand_id,brand_name')
        );

        $item = array();
        foreach ($brand_list as $v) {
            $row['label'] = $v['brand_name'];
            $row['value'] = $v['brand_name'];
            $row['brand_id'] = $v['brand_id'];
            $item[] = $row;
        }

        echo json_encode($item);
    }

    /**
     * 根据类型获取品牌
     */
    public function actionAjaxtypebrand()
    {
        $TypeBrand = new TypeBrand();
        $type_id = $this->post('type_id');
        $list = $TypeBrand->type_brand($type_id);

        $str = '<option value="">请选择</option>';
        foreach ($list as $v) {
            $str .= '<option value="'.$v['brand_id'].'">'.$v['brand_name'].'</option>';
        }

        echo $str;
    }

    public function actionTest()
    {
        echo ini_get('upload_max_filesize').'<br>';
        echo ini_get('post_max_size');
    }
}