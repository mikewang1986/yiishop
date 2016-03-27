<?php
/**
 * 评论管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */

class CommentController extends BaseController
{
    public function init()
    {
        $this->registerJs(array('oct/member/comment'));
    }

    /**
     * 咨询列表
     */
    public function actionIndex()
    {
        $pageIndex = $this->get('page');
        $Comments = new Comments();
        $result = $Comments->lists($Comments,$pageIndex,$this->pagesize,"comment_id DESC");

        //分页
        $pages = new CPagination($result['count']);
        $this->render('index',array('dataProvider'=>$result['item'],'pages'=>$pages,'pageIndex'=>$pageIndex));
    }

    /**
     * 评论详情
     */
    public function actionDetail()
    {
        $comment_id = $this->post('comment_id');

        $comment_row = Comments::model()->find("comment_id = {$comment_id}");
        $goods_row = Goods::model()->find("goods_id = :goods_id",array(":goods_id"=>$comment_row['goods_id']));

        if ($goods_row['image_default_id'])
            $image_row = ImageImage::model()->find(
                'image_id = :image_id',
                array(':image_id'=>$goods_row['image_default_id']
                )
            );
        echo $this->renderPartial(
            'detail',
            array('comment_row'=>$comment_row,'goods_row'=>$goods_row,'image_row'=>$image_row),
            true
        );
    }

    /**
     * 创建评论
     */
    public function actionCreate()
    {
        $comment_id = $this->post('comment_id');
        $content = $this->post('content');

        $user_id = $this->admini['user_id'];
        $user_name = $this->admini['name'];


    }
} 