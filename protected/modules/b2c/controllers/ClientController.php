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

class ClientController extends CController
{

    public function actionGetUserInfo()
    {
        $client=new SoapClient("http://yiishop.com.cn/WebServer/approval");
        $res= $client->get_user_info('{"user_name":"3434were","request_id":"3434"}');
        //$res= $client->get_user_info('teere');
        var_dump($res);
        // Yii:app()->end();
    }

}