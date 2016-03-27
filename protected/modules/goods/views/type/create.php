<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品类型'=>array('/goods/type/index'),
    '类型添加'
);

echo $this->renderPartial('_form',array('model'=>$model,'action'=>'create'));