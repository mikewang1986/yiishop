<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品规格'=>array('/goods/spec/index'),
    '规格编辑-'.$model['props_item']['name']
);

echo $this->renderPartial('_form',array('model'=>$model,'action'=>'update&props_id='.$model['props_item']['props_id']));