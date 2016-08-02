<?php
/**
 * webserive例子
 *
 * @author          wanglei
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link
 * @package       /protected/modules/b2c/controllers
 * @version       v1.0.0
 */

class WebServerController extends CController
{
    /**
     * @var array error
     * @soap
     */
    public $error=array(
        '0000'=>'操作成功',
        '0001'=>'操作失败',
        '0002'=>'参数param错误',
        '1001'=>'用户不存在',
    );
    public function actions()
    {
        return array(
            'approval'=>array(
                'class'=>'CWebServiceAction',
                /*'classMap'=>array(//classMap其实只要是对应的Model就行，比如这里的ApiUser
                    'ApiUser',
                ),*/

            ),
        );
    }
    /**
     * @desc get_user_info()获取用户信息,代码注释里包含 * @soap,则 此方法可通过soap访问到
     * @param string
     * @return array the ApiUser info 也必须和Model名称一致
     * @soap
     */
    public function get_user_info($param_arr){
        $param_arr=CJSON::decode($param_arr);
        $param['user_name']=htmlspecialchars(@$param_arr['user_name']);
        $param['request_id']=intval(@$param_arr['request_id']);
        $res=array('user_name'=>$param['user_name'],'request_id'=>$param['request_id']);
      //  $prices['user_name']="erer";
       // $prices['request_id']=5;
        return $res;
        /*$param_arr=CJSON::decode($param_arr);
        $param['user_name']=htmlspecialchars(@$param_arr['user_name']);
        $param['request_id']=intval(@$param_arr['request_id']);
        //添加API访问日志信息
        $apiLog=new ApiLog1();
        $log_id=$apiLog->insert_api_log($param['request_id'], CJSON::encode($param));
        $res=array('user_name'=>$param['user_name'],'user_email'=>$param['user_email']);
        //验证相关参数是否符合要求
        if (empty($param['user_name'])) {
            $res['response_time']=date("YmdHis");
            $res['error_code']='0002';
            $res['error_msg']=str_replace('param','user_name',$this->error['0002']);
            //更新API访问日志信息
            $apiLog->update_api_log($log_id, CJSON::encode($res),@$res['response_time'], @$res['error_code'],$res['error_msg']);
            return CJSON::encode($res);
        }

        if ($param['request_id']<=0) {
            $res['response_time']=date("YmdHis");
            $res['error_code']='0002';
            $res['error_msg']=str_replace('param','request_id',$this->error['0002']);
            //更新API访问日志信息
            $apiLog->update_api_log($log_id, @$res,@$res['response_time'], @$res['error_code'],$res['error_msg']);
            return $res;
        }
        $user=new User();
        $user_info=$user->getUserInfo($param['user_name']);

        if ($user_info)
        {
            $res['error_code']="1003";
        }
        else
        {
            $res['error_code']="0000";
        }
        $res['response_time']=date("YmdHis");
        $res['error_msg']=$this->error[$res['error_code']];

        //更新API访问日志信息
        $apiLog->update_api_log($log_id, @$res,@$res['response_time'], @$res['error_code'],$res['error_msg']);

        return $res;*/


    }

    /*
     * 代码注释里不包含 * @soap,则无法通过soap方式访问
     */
    public function test($param_arr){
        $arr =  array(
            'user_id'=>$param_arr['user_id'],
            'request_id'=>$param_arr['request_id'],//'请求号',
            'request_time'=>$param_arr['request_time'],//'请求时间'
        );
        return true;
    }

}