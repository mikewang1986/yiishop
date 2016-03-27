<?php
$this->breadcrumbs=array(
    '管理员和权限'=>array(''),
    '角色列表'=>array('goods/default/index')
);
?>

<?php $this->widget('bootstrap.widgets.TbGridView', array(
    'dataProvider' => $dataProvider,
    'type'=>'bordered',
    'columns' => array(
        array(
            'id'=>'role_id',
            'class'=>'CCheckBoxColumn',
            'selectableRows'=>2,
            'headerHtmlOptions' => array('width'=>'33px','style'=>'text-align:center'),
            'checkBoxHtmlOptions' => array('name' => 'selectdel[]'),
            'htmlOptions'=>array(
                'style'=>'text-align:center',
            )
        ),
        array(
            'header'=>'操作',
            'htmlOptions' => array('nowrap'=>'nowrap'),
            'template'=>$template,
            'class'=>'bootstrap.widgets.TbButtonColumn',
            'buttons'=>array(
                'update'=>array(
                    'url'=>'Yii::app()->controller->createUrl("/desktop/role/update",array("role_id"=>$data->role_id))',
                    'label'=>'编辑',
                )
            ),
        ),
        array(
            'name'=>'group_name',
            'header'=>'角色名',
        ),
        array(
            'name'=>'create_time',
            'header'=>'录入时间',
            'value'=>'date("Y-m-d H:i",$data->create_time)'
        ),
    ),
)); ?>