<?php
/**
 * 单页管理
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       /protected/modules/b2c/controllers
 * @version       v1.0.0
 */

class PageController extends B2cController
{
    /**
     * 关于商城
     */
    public function actionAbout()
    {
        $this->render('about');
    }
} 