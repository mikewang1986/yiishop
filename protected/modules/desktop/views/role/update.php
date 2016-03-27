<?php
$this->breadcrumbs=array(
    '管理员和权限'=>array('/desktop/role/index'),
    '角色列表'=>array('/desktop/role/index'),
    '角色编辑-'.$role_row['group_name']
);

echo $this->renderPartial('_form',array('role_row'=>$role_row,'role_list'=>$role_list,'param'=>$param));
