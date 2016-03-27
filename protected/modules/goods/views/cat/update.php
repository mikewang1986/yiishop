<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品分类'=>array('/goods/cat/index'),
    '分类编辑-'.$model['cat_row']['cat_name']
);
?>
<div class="page-header">
    <h1>
        编辑分类
    </h1>
</div>
<?php
echo $this->renderPartial('_form',array('model'=>$model,'action'=>'update&cat_id='.$model['cat_row']['cat_id']));
