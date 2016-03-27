<?php
/**
 * 角色管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */
class RoleController extends BaseController
{
    /**
     * 角色列表
     */
    public function actionIndex()
    {
        $role_list = AdminGroup::model()->findAll();
        $gridDataProvider = new CArrayDataProvider(
            $role_list,
            array(
                'keyField'=>'role_id',
                'sort'=>array(
                    'attributes'=>array(
                        'role_id',
                    ),
                    'defaultOrder'=>array(
                        'role_id'=>CSort::SORT_DESC,
                    )
                ),

                'pagination'=>array(
                    'pageSize'=>$this->pagesize,
                ),

            )
        );

        $template = $this->TemplateButton(array('update','delete'));
        $this->render('index',array('dataProvider'=>$gridDataProvider,'template'=>$template));
    }

    /**
     * 角色编辑
     */
    public function actionUpdate()
    {
        $role_id = $_GET['role_id'];

        $role_row = AdminGroup::model()->find('role_id = :role_id',array(':role_id'=>$role_id));
        $role_list = XAdminiAcl::RoleMenu();

        if ($_POST) {
            $RoleAttr = $_POST['Role'];

            if (
            AdminGroup::model()->updateByPk(
                    $role_id,
                    array(
                        'group_name'=>$RoleAttr['group_name'],
                        'acl'=>implode(',',$RoleAttr['acl'])
                    )
                )
            ) {
                $this->redirect('?r=desktop/role/update&role_id='.$role_id.'&save=update&result=success');
            } else {
                $this->redirect('?r=desktop/role/update&role_id='.$role_id.'&save=update&result=fail');
            }
        }

        $role_row['acl'] = explode(',',$role_row['acl']);

        $param['save'] = $param['result'] = '';
        if (isset($_GET['save'])) $param['save'] = $_GET['save'];
        if (isset($_GET['result'])) $param['result'] = $_GET['result'];

        $this->render('update',array('role_row'=>$role_row,'role_list'=>$role_list,'param'=>$param));
    }
}