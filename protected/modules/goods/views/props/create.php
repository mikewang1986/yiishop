<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品扩展属性'=>array('/goods/props/index'),
    '扩展属性创建'
);

echo $this->renderPartial('_form',array('action'=>'create'));