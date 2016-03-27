<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品规格'=>array('/goods/spec/index'),
    '规格编辑-'.$model['spec_item']['spec_name']
);

echo $this->renderPartial('_form',array('model'=>$model,'action'=>'update&spec_id='.$model['spec_item']['spec_id']));