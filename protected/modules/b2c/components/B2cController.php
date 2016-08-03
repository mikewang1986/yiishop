<?php
/**
 * 控制器基础类，所有控制器均需继承此类
 * @author chenfenghua <843958575@qq.com>
 */
class B2cController extends Controller
{
    public $layout='column_default';
    //add by wanglei 每个页面基类
    public $jqPageId;   //must be unique across all pages in jquery mobile.
    public $pagesize = 15;
    public $username;
    public $member_id = '';
    public $img = '/';
    public $cart;
    public $controller;
    public function __construct($id,$module)
    {
        parent::__construct($id,$module);
        $this->username = Yii::app()->session['login_account'];
        $this->member_id = Yii::app()->session['member_id'];
        $this->controller = $id;
    }
    public function init()
    {
        $this->img = 'http://'.$_SERVER['HTTP_HOST'].'/';
        //购物车内容
        $this->cart = Layouts::Cart($this->member_id);
    }
    /**
     * 登录设置
     */
    public function CheckLogin()
    {
        if (!$this->username) $this->redirect('/account/login');
    }
    /**
     * GET获取单个数据
     */
    public function get($val,$type='str')
    {
        if ($type == 'str') {
            $data = isset($_GET[$val])?$_GET[$val]:'';
        } else if($type == 'int') {
            $data = isset($_GET[$val])?$_GET[$val]:0;
        } elseif ($type == 'bool') {
            $data = isset($_GET[$val])?$_GET[$val]:'false';
        } else {
            $data = isset($_GET[$val])?$_GET[$val]:'';
        }
        return $this->_CheckAndQuote($data);
    }

    /**
     * POST获取单个数据
     */
    public function post($val,$type='str')
    {
        if ($type == 'str') {
            $data = isset($_POST[$val])?$_POST[$val]:'';
        } else if($type == 'int') {
            $data = isset($_POST[$val])?$_POST[$val]:0;
        } elseif ($type == 'bool') {
            $data = isset($_GET[$val])?$_GET[$val]:false;
        } else {
            $data = isset($_GET[$val])?$_GET[$val]:'';
        }
        return $this->_CheckAndQuote($data);
    }

    /**
     * prevent from invalidate sql sentense is put in advanced
     *
     * @param  $value value of waiting for format
     * @return string formatted value
     */
    function _CheckAndQuote($value)
    {
        if (is_int($value) || is_float($value)) {
            return $value;
        }
        return htmlspecialchars(addslashes($value));
    }

    /**
     * 加载js文件
     * @param $file
     * @param string $type
     * @param string $theme
     */
    public function registerJs($file,$type='end',$theme='b2c')
    {
        switch($type) {
            case 'end':
                $js = CClientScript::POS_END;
                break;
            default:
                $js = CClientScript::POS_END;
        }
        if (is_array($file)) {
            foreach ($file as $model)
                Yii::app()->clientScript->registerScriptFile(Yii::app()->baseUrl .'/themes/'.$theme.'/js/'.$model.'.js',$js);
        } else
            Yii::app()->clientScript->registerScriptFile(Yii::app()->baseUrl .'/themes/'.$theme.'/js/'.$file.'.js',$js);
    }

    //返回json响应
    /**
     * @param int $code
     * @param string $msg
     * @param array $data
     */
    public function sendJsonResponse($code=200,$msg='',$data=array()){
        $result = array('code'=>$code,'msg'=>$msg,'data'=>$data);
        echo json_encode($result);
        die();
    }
    /**
     * 返回上一个页面
     */
    public function referrer($type = 0,$action = array('index'))
    {
            if ($type == 1) {
                if (isset(Yii::app()->request->urlReferrer) && Yii::app()->request->urlReferrer)
                    $this->redirect(Yii::app()->request->urlReferrer);
            } else {
                $this->redirect($action);
            }
    }
}