<?php
$this->breadcrumbs=array(
    '商品管理'=>array('/goods/default'),
    '商品列表'=>array('/goods/default'),
    '创建商品'
);
?>
<div class="page-header">
    <h1>
        创建商品
    </h1>
</div>
<?php echo $this->renderPartial('_form',array('model'=>$model,'action'=>'create'));?>