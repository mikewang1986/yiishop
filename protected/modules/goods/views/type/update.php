<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品类型'=>array('/goods/type/index'),
    '类型编辑-'.$model['type_item']['name']
);

echo $this->renderPartial('_form',array('model'=>$model,'action'=>'update&type_id='.$model['type_item']['type_id']));