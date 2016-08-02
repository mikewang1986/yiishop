<?php
class AdminController extends Controller
{
    public $layout='//layouts/admin_login';

    public function actionIndex()
    {
        $this->redirect(array('login'));

    }

    /**
     * 后台管理员登录
     */
    public function actionLogin()
    {
        $model = new AdminUsers();
        $error = false;
        if ($_POST) {
            $name = $_POST['Desktopusers']['name'];
            $password = md5(md5($_POST['Desktopusers']['password']));
            //用户名、密码检查
            $user = AdminUsers::model()->find(
                "name = :name AND password = :password",
                array(
                    ':name' => $name,
                    ':password' => $password
                )
            );

            if ($user) {
                //注入session
                $permisson = $this->_UserPermission($user['role']);

                $admini = array(
                    'user_id'=>$user['user_id'],
                    'name' => $name,
                    'super'=>$user['super'],
                    'role'=>$user['role'],
                    'group_name'=>$permisson['group_name'],
                    'acl'=>$permisson['acl']
                );
                Yii::app()->session['_admini'] = $admini;
                $this->redirect('?r=desktop/default/index');

            } else {
                $error = true;
                $this->render('login',array('model'=>$model,'error'=>$error));
            }
        } else {
            $this->render('login',array('model'=>$model,'error'=>$error));
        }
    }

    /**
     * 用户推出
     */
    public function actionLogout()
    {
        unset(Yii::app()->session['_admini']);
        $this->redirect(array('admin/login'));
    }

    /**
     * 会员角色、权限
     *
     * @param $role_id
     * @return mixed
     */
    private function _UserPermission($role_id)
    {
        $role_row = AdminGroup::model()->find(
            'role_id = :role_id',
            array(':role_id'=>$role_id),
            array('select'=>'group_name,acl')
        );

        return $role_row;
    }
} 