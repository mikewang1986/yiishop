
<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
Yii::setPathOfAlias('bootstrap', dirname(__FILE__).'/../extensions/bootstrap');
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'后台管理',
    'language' => 'zh_cn',
	// preloading 'log' component
	'preload'=>array('log'),
    'aliases' => array(
        'bootstrap' => realpath(__DIR__ . '/../extensions/bootstrap'), // change this if necessary
    ),
    'defaultController'=>'admin/login',
	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
        //'ext.quickdlgs.*',
        'bootstrap.helpers.*',
        'bootstrap.behaviors.*',
        'bootstrap.components.*',
        'application.modules.desktop.models.*'
	),
    'theme'=>'ace',
    'modules'=>array(
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'2013',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','128.128.9.116','::1'),
            'generatorPaths'=>array(
                'bootstrap.gii',
            ),
		),
        'goods','order','cms','desktop','user','weixin'
	),

	// application components+
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),
        'bootstrap'=>array(
            'class'=>'bootstrap.components.TbApi',
        ),
        'mailer' => array(
            'class' => 'application.extensions.mailer.EMailer',
            'pathViews' => 'application.views.email',
            'pathLayouts' => 'application.views.email.layouts'
        ),

        'cache'=>array(
            'class'=>'system.caching.CFileCache',
            'cachePath'=>'./cache',
        ),
		/*"redis" => array(
			"class" => "ext.redis.ARedisConnection",
			"hostname" => "127.0.0.1",
			"port" => 6379
		),*/

//        'memcache'=>array(
//            'class'=>'',
//        ),
		// uncomment the following to enable URLs in path-format
        /*
		'urlManager'=>array(
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
        */

		// database settings are configured in database.php
		'db'=>require(dirname(__FILE__).'/database.php'),

		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),

		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning,info',
				),
//                array(
//                    'class'=>'ext.yii-debug-toolbar.YiiDebugToolbarRoute',
//                    'ipFilters'=>array('127.0.0.1'),
//                ),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),

        'session' => array(
            'cookieParams' => array(
                'lifetime' => 7200*3,
            ),
        ),

	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
    'params'=>require(dirname(__FILE__).'/params.php'),
);
