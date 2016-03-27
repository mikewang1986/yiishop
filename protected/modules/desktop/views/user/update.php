<?php
$this->breadcrumbs=array(
    '管理员和权限'=>array('/desktop/user/index'),
    '操作员列表'=>array('/desktop/user/index'),
    '操作员编辑-'.$model['user_row']['name']
);

echo $this->renderPartial('_form',array('model'=>$model));
