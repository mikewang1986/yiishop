<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品品牌'=>array('/goods/brand/index'),
    '品牌创建'
);
echo $this->renderPartial('_form',array('action'=>'create','model'=>$model));