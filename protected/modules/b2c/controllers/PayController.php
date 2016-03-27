<?php
/**
 * 订单支付
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       /protected/modules/b2c/controllers
 * @version       v1.0.0
 */

class PayController extends B2cController
{
    public function init()
    {
        if (!$this->username) $this->redirect('/account/login');
    }
} 