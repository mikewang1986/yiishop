<?php
/**
 * 操作员管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */

class UserController extends BaseController
{
    /**
     * 操作员列表
     */
    public function actionIndex()
    {
        $search['name'] = $this->get('name');
        $conditionArr = array();
        $condition = '';
        if ($search['name']) $conditionArr[] = "name = '{$search['name']}'";

        if ($conditionArr) $condition = implode(' AND ',$conditionArr);

        $user_list = AdminUsers::model()->findAll($condition);

        $gridDataProvider = new CArrayDataProvider(
            $user_list,
            array(
                'keyField'=>'user_id',
                'sort'=>array(
                    'attributes'=>array(
                        'user_id',
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
        $this->render('index',array('dataProvider'=>$gridDataProvider,'template'=>$template,'search'=>$search));
    }

    /**
     * 权限选择
     */
    public function actionUpdate()
    {
        $user_id = $_GET['user_id'];
        $user_row = AdminUsers::model()->find("user_id = $user_id");
        if ($_POST) {
            $UserAttr = $_POST['User'];

            if (
            AdminUsers::model()->updateByPk(
                $user_id,
                array(
                    'name'=>$UserAttr['name'],
                    'role'=>$UserAttr['role']
                )
            )
            ) {
                $this->redirect('?r=desktop/user/update&user_id='.$user_id.'&save=update&result=success');
            } else {
                $this->redirect('?r=desktop/user/update&user_id='.$user_id.'&save=update&result=fail');
            }
        }
        $role_list = AdminGroup::model()->findAll();

        $param['save'] = $param['result'] = '';
        if (isset($_GET['save'])) $param['save'] = $_GET['save'];
        if (isset($_GET['result'])) $param['result'] = $_GET['result'];

        $model['user_row'] = $user_row;
        $model['role_list'] = $role_list;
        $model['param'] = $param;
        $this->render('update',array('model'=>$model));
    }
} 