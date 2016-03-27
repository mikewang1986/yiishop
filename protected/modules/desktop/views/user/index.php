<?php
$this->breadcrumbs=array(
    '管理员和权限'=>array(''),
    '操作员列表'
);
?>
<div>
    <form action="?r=desktop/user/index" method="get">
        <input type="hidden" name="r" value="desktop/user/index">
        <label style="padding-top: 3px;">用户名: <input type="text" name="name" value="<?php echo isset($search['name'])?$search['name']:'';?>" aria-controls="sample-table-2"></label>
        <button class="btn btn-sm btn-primary" style="padding: 0 7px;">搜索</button>
    </form>
</div>

<?php $this->widget('bootstrap.widgets.TbGridView', array(
    'dataProvider' => $dataProvider,
    'type'=>'bordered',
    'columns' => array(
        array(
            'id'=>'user_id',
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
                    'url'=>'Yii::app()->controller->createUrl("/desktop/user/update",array("user_id"=>$data->user_id))',
                    'label'=>'编辑',
                )
            ),
        ),
        array(
            'name'=>'name',
            'header'=>'用户名',
        ),
        array(
            'name'=>'super',
            'header'=>'超级管理员',
            'value'=>'$data->super==1?"是":"否"'
        ),
        array(
            'name'=>'role',
            'header'=>'角色',
        ),
        array(
            'name'=>'lastlogin',
            'header'=>'最后登录时间',
            'value'=>'!empty($data->lastlogin)?date("Y-m-d H:i:s",$data->lastlogin):"未登录"'
        ),
    ),
));
?>