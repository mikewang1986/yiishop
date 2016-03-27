<?php
/**
 * 栏目管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */

class CategoryController extends BaseController
{
    public function init()
    {
        $this->registerJs(array('oct/cms/category'));
    }
    /**
     * 栏目列表
     */
    public function actionIndex()
    {
        $params = $this->get('Category');

        $Category = new CmsCategory();
        $result = $Category->CategoryList();

        $this->render(
            'index',
            array('item'=>$result,'params'=>$params)
        );
    }

    /**
     * 新增栏目
     */
    public function actionCreate()
    {
        if ($_POST) {
            $Category = new CmsCategory();
            $attributes = $this->post('Category');
            $attributes['create_time'] = time();
            $Category->attributes = $attributes;
            if ($Category->save()) {
                $this->referrer();
            } else {
                $this->message('error',CHtml::errorSummary($Category),$this->createUrl('index'));
            }
        }
        $category_list = CmsCategory::model()->findAll('parent_id = :parent_id AND disabled = :disabled',array(':parent_id'=>0,':disabled'=>'false'));
        $model = array('category_list'=>$category_list);
        $this->render('create',array('model'=>$model));
    }

    /**
     * 编辑栏目
     */
    public function actionUpdate()
    {
        $id = $this->get('id','int');
        if ($_POST) {
            $Category = new CmsCategory();
            $attributes = $this->post('Category');
            $attributes['update_time'] = time();
            if ($Category->updateByPk($id,$attributes)) {
                $this->referrer();
            } else {
                $this->message('error',CHtml::errorSummary($Category),$this->createUrl('index'));
            }
        }
        $category_row = CmsCategory::model()->find("id = {$id}");
        $category_list = CmsCategory::model()->findAll('parent_id = :parent_id AND disabled = :disabled',array(':parent_id'=>0,':disabled'=>'false'));
        $model = array('category_row'=>$category_row,'category_list'=>$category_list);
        $this->render('update',array('model'=>$model));
    }

    /**
     * 删除栏目
     */
    public function actionDelete()
    {
        $id = $this->get('id','int');
        $Category = new CmsCategory();
        $attributes['disabled'] = 'true';
        $attributes['update_time'] = time();
        if ($Category->updateByPk($id,$attributes)) {
            $this->referrer();
        } else {
            $this->message('error',CHtml::errorSummary($Category),$this->createUrl('index'));
        }
    }
} 