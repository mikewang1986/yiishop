<?php
$this->breadcrumbs=array(
    '商品管理'=>array('/goods/default'),
    '商品列表'=>array('/goods/default'),
    '编辑-'.$model['goods_row']['name']
);
?>
<div class="page-header">
    <h1>
        编辑商品
    </h1>
</div>
<?php echo $this->renderPartial('_form',array('model'=>$model,'action'=>'update&goods_id='.$model['goods_row']['goods_id']));?>