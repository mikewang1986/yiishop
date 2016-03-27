<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品分类'=>array('/goods/cat/index'),
    '分类创建'
);
?>
<div class="page-header">
    <h1>
        新建分类
    </h1>
</div>
<?php
echo $this->renderPartial('_form',array('model'=>$model,'action'=>'create'));
