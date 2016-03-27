<?php
/**
 * 控制面板理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2015 shop.feipin0512.com
 * @version    1.0
 */

class DefaultController extends BaseController
{
    public function actionIndex()
    {
        $this->render('index');
    }
} 