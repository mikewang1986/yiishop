<?php

/**
 * 会员管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */
class DefaultController extends BaseController
{
    public function __construct($id,$module)
    {
        parent::__construct($id,$module);
    }

    public function init()
    {
        $this->registerJs(array('oct/member/member'));
    }

    /**
     * 会员列表
     */
    public function actionIndex()
	{
        $pageIndex = isset($_GET['page'])?$_GET['page']:1;

        $Members = new Members();
        $result = $Members->memberList($pageIndex,$this->pagesize);

        //分页
        $pages = new CPagination($result['count']);

        $this->render('index',array(
            'dataProvider'=>$result['list'],
            'pages' => $pages,
            'pageIndex'=>$pageIndex-1
        ));
	}
}