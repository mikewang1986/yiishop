<?php
/**
 * 文章管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */

class ArticleController extends BaseController
{
    public function init()
    {
        $this->registerJs(
            array('jquery.uploadify'),
            'end','bootstrap'
        );
        $this->registerJs(
            array(
                'oct/cms/article'
            ),
            'end'
        );
    }

    /**
     * 文章列表
     */
    public function actionIndex()
    {
        $pageIndex = isset($_GET['page'])?$_GET['page']:1;
        $params = $this->get('Category');

        $Article = new CmsArticle();
        $result = $Article->lists(
            $Article,
            $pageIndex,
            $this->pagesize,
            'id DESC'
        );

        $this->render(
            'index',
            array('item'=>$result['item'],'count'=>$result['count'],'params'=>$params)
        );
    }

    /**
     * 新增文章
     */
    public function actionCreate()
    {
        $Article = new CmsArticle();
        if ($_POST) {
            $attributes = $this->post('Article');
            $attributes['createtime'] = time();

            $Article->attributes = $attributes;
            if ($Article->save()) {
                $this->referrer();
            } else {
                $this->message('error',CHtml::errorSummary($Article),$this->createUrl('index'));
            }
        }

        $model['category_list'] = CmsCategory::model()->findAll("disabled = 'false'");
        $this->render('create',array('model'=>$model));
    }

    /**
     * 编辑文章
     */
    public function actionUpdate()
    {
        $id = $this->get('id');
        if ($_POST) {
            $attributes = $this->post('Article');
            $attributes['updatetime'] = time();
            if (CmsArticle::model()->updateByPk($id,$attributes)) {
                $this->referrer();
            } else {
                $Article = new CmsArticle();
                $this->message('error',CHtml::errorSummary($Article),$this->createUrl('index'));
            }
        }
        $model['article_row'] = CmsArticle::model()->find("id = {$id}");
        $model['category_list'] = CmsCategory::model()->findAll("disabled = 'false'");
        $this->render('update',array('model'=>$model));
    }

    /**
     * 删除文章
     */
    public function actionDelete()
    {
        $id = $this->get('id','int');
        $attributes['disabled'] = 'true';
        $attributes['updatetime'] = time();
        if (CmsArticle::model()->updateByPk($id,$attributes)) {
            $this->referrer();
        } else {
            $Article = new CmsArticle();
            $this->message('error',CHtml::errorSummary($Article),$this->createUrl('index'));
        }
    }
} 