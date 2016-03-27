<?php $this->beginContent('//layouts/main_iframe'); ?>
<?php $this->widget('bootstrap.widgets.TbGridView', array(
    'dataProvider' => $dataProvider,
    'type'=>'bordered',
    'columns' => array(
        array(
            'id'=>'brand_id',
            'class'=>'CCheckBoxColumn',
            'selectableRows'=>2,
            'headerHtmlOptions' => array('width'=>'33px','style'=>'text-align:center'),
            'checkBoxHtmlOptions' => array('name' => 'selectdel[]'),
            'htmlOptions'=>array(
                'style'=>'text-align:center',
            )
        ),
        array(
            'name'=>'brand_id',
            'header'=>'品牌ID'
        ),
        array(
            'name' => 'brand_name',
            'header' => '品牌名',
        ),
    ),
)); ?>

<?php $this->endContent(); ?>