<?php
class WeixinModule extends CWebModule
{
	public function init()
	{
		// import the module-level models and components
		$this->setImport(array(
			'weixin.models.*',
			'weixin.components.*',
			'user.models.*',
			'user.components.*',
			'application.modules.b2c.models.*',
			'application.modules.b2c.components.*',
            'desktop.models.Regions',
            'goods.models.Goods',
            'goods.models.ImageImage'
		));
	}

	public function beforeControllerAction($controller, $action)
	{
		if(parent::beforeControllerAction($controller, $action))
		{

			return true;
		}
		else
			return false;
	}
}
