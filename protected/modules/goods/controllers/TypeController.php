<?php
/**
 * 商品类型管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */
class TypeController extends BaseController
{
    public function __construct($id,$module)
    {
        parent::__construct($id,$module);
    }

    public function init()
    {
        $this->registerJs(array('oct/goods/type'));
    }

    /**
     * 类型列表
     */
    public function actionIndex()
    {
        $pageIndex = isset($_GET['page'])?$_GET['page']:1;
        $GoodsType = new GoodsType();
        $result = $GoodsType->TypeList($pageIndex,$this->pagesize);

        //分页
        $pages = new CPagination($result['count']);

        $this->render('index',array(
            'dataProvider'=>$result['item'],
            'pages' => $pages,
            'pageIndex'=>$pageIndex-1
        ));
    }

    /**
     * 类型编辑
     */
    public function actionUpdate()
    {
        $type_id = $this->get('type_id');
        if ($_POST) {
            $type_attributes = $this->post('Type');
            $type_brand_attributes = $this->post('TypeBrand');
            //商品类型主表修改
            $type_attributes['lastmodify'] = time();
            $result = GoodsType::model()->updatebypk($type_id,$type_attributes);
            if (!$result) {
                $GoodsType = new GoodsType();
                $this->message('error',CHtml::errorSummary($GoodsType),$this->createUrl('index'));
            }
            //类型-品牌
            if ($type_brand_attributes) {
                $TypeBrand = new TypeBrand();
                $result = $TypeBrand->brand_type_update($type_id,$type_brand_attributes);
                if (!$result) {
                    $this->message('error',CHtml::errorSummary($TypeBrand),$this->createUrl('index'));
                }
            }
            //类型-扩展属性
            $type_props_attributes = $this->post('TypeProps');
            if ($type_props_attributes) {
                $GoodsTypePropsRelation = new GoodsTypePropsRelation();
                $result = $GoodsTypePropsRelation->props_update($type_id,$type_props_attributes['props_id']);
                if (!$result) {
                    $this->message('error',CHtml::errorSummary($GoodsTypePropsRelation),$this->createUrl('index'));
                }
            }
            //类型-规格
            $type_props_spec = $this->post('Spec');
            if($type_props_spec) {
                if ($type_props_spec['spec_id']) {
                    $GoodsTypeSpec = new GoodsTypeSpec();
                    $result = $GoodsTypeSpec->spec_update($type_id, $type_props_spec['spec_id']);
                    if (!$result) {
                        $this->message('error', CHtml::errorSummary($GoodsTypeSpec), $this->createUrl('index'));
                    }
                }
            }
            else{
                $GoodsTypeSpec = new GoodsTypeSpec();
                $result = $GoodsTypeSpec->spec_update($type_id, array(0));
                if (!$result) {
                    $this->message('error', CHtml::errorSummary($GoodsTypeSpec), $this->createUrl('index'));
                }
            }
            $this->message('success','编辑成功',$this->createUrl('index'));
        }
        $model['type_item'] = GoodsType::model()->find('type_id = :type_id',array(':type_id'=>$type_id));
        //品牌列表
        $model['brand_list'] = Brand::model()->findAll('disabled = :disabled',array(':disabled'=>'false'));
        //类型-品牌
        $type_brand_list = TypeBrand::model()->findAll('type_id = :type_id',array(':type_id'=>$type_id));
        $model['type_brand_list'] = array();
        foreach ($type_brand_list as $v) {
            $model['type_brand_list'][] = $v['brand_id'];
        }
        //扩展属性
        $GoodsTypeProps = new GoodsTypeProps();
        $model['props_list'] = $GoodsTypeProps->TypeProps($type_id);

        //规格
        $GoodsTypeSpec = new GoodsTypeSpec();
        $model['spec_list'] = Specification::model()->findAll('disabled = :disabled',array(':disabled'=>'false'));
        $spec_list = $GoodsTypeSpec->TypeSpec($type_id);
        $model['spec_selected'] = array();
        foreach ($spec_list as $v) {
            $model['spec_selected'][$v['spec_id']] = $v['spec_id'];
        }

        $this->render('update',array('model'=>$model));
    }

    /**
     * 类型添加
     */
    public function actionCreate()
    {
        if ($_POST) {
            $GoodsType = new GoodsType;
            $GoodsType->attributes = $this->post('Type');
            $type_brand_attributes = $this->post('TypeBrand');
            //商品类型主表修改
            $result = $GoodsType->save();
            if (!$result) {
                $GoodsType = new GoodsType();
                $this->message('error',CHtml::errorSummary($GoodsType),$this->createUrl('index'));
            }
            $type_id = Yii::app()->db->getLastInsertID();
            //类型-品牌
            if ($type_brand_attributes) {
                $TypeBrand = new TypeBrand();
                $result = $TypeBrand->brand_type_update($type_id,$type_brand_attributes);
                if (!$result) {
                    $this->message('error',CHtml::errorSummary($TypeBrand),$this->createUrl('index'));
                }
            }
            //类型-扩展属性
            $type_props_attributes = $this->post('TypeProps');
            if (isset($type_props_attributes['props_id']) && $type_props_attributes['props_id']) {
                $GoodsTypePropsRelation = new GoodsTypePropsRelation();
                $result = $GoodsTypePropsRelation->props_update($type_id,$type_props_attributes['props_id']);
                if (!$result) {
                    $this->message('error',CHtml::errorSummary($GoodsTypePropsRelation),$this->createUrl('index'));
                }
            }
            //类型-规格
            $type_props_spec = $this->post('Spec');
            if (isset($type_props_spec['spec_id']) && $type_props_spec['spec_id']) {
                $GoodsTypeSpec = new GoodsTypeSpec();
                $result = $GoodsTypeSpec->spec_update($type_id,$type_props_spec['spec_id']);
                if (!$result) {
                    $this->message('error',CHtml::errorSummary($GoodsTypeSpec),$this->createUrl('index'));
                }
            }

            $this->message('success','创建成功',$this->createUrl('index'));
        }
        //品牌列表
        $model['brand_list'] = Brand::model()->findAll('disabled = :disabled',array(':disabled'=>'false'));
        //规格
        $model['spec_list'] = Specification::model()->findAll('disabled = :disabled',array(':disabled'=>'false'));
        $this->render('create',array('model'=>$model));
    }

    /**
     * 类型删除
     */
    public function actionDelete()
    {
        $type_id = $this->get('type_id');
        //商品类型主表修改
        $type_attributes['disabled'] = 'true';
        $type_attributes['lastmodify'] = time();
        $result = GoodsType::model()->updatebypk($type_id,$type_attributes);
        if (!$result) {
            $GoodsType = new GoodsType();
            $this->message('error',CHtml::errorSummary($GoodsType),$this->createUrl('index'));
        }
        //类型-品牌
        $result = TypeBrand::model()->deleteAll('type_id = :type_id',array(':type_id'=>$type_id));
        if (!$result) {
            $TypeBrand = new TypeBrand();
            $this->message('error',CHtml::errorSummary($TypeBrand),$this->createUrl('index'));
        }
        //类型-扩展属性
        $result = GoodsTypePropsRelation::model()->deleteAll('type_id = :type_id',array(':type_id'=>$type_id));
        if (!$result) {
            $GoodsTypePropsRelation = new GoodsTypePropsRelation();
            $this->message('error',CHtml::errorSummary($GoodsTypePropsRelation),$this->createUrl('index'));
        }
        //类型-规格
        $result = GoodsTypeSpec::model()->deleteAll('type_id = :type_id',array(':type_id'=>$type_id));
        if (!$result) {
            $GoodsTypeSpec = new GoodsTypeSpec();
            $this->message('error',CHtml::errorSummary($GoodsTypeSpec),$this->createUrl('index'));
        }

        $this->message('success','删除成功',$this->createUrl('index'));
    }

    /**
     * 根据类型获取规格、扩展属性
     */
    public function actionAjaxspecprops()
    {
        $type_id = $this->post('type_id');

        //规格
        $GoodsTypeSpec = new GoodsTypeSpec();
        if ($GoodsTypeSpec->TypeSpec($type_id)) $model['spec'] = true;
        else $model['spec'] = false;

            //扩展属性
        $GoodsTypeProps = new GoodsTypeProps();
        if ($GoodsTypeProps->TypePropsRelation($type_id)) $model['props'] = true;
        else $model['props'] = false;

        echo json_encode($model);
    }
} 