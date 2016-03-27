<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品品牌'=>array('/goods/brand/index'),
    '品牌编辑-'.$model['brand_item']['brand_name']
);

echo $this->renderPartial('_form',array('model'=>$model,'action'=>'update&brand_id='.$model['brand_item']['brand_id']));