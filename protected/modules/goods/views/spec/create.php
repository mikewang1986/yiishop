<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品规格'=>array('/goods/spec/index'),
    '规格创建'
);

echo $this->renderPartial('_form',array('action'=>'create'));