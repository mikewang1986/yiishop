<?php
/**
 * 商品管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */
class DefaultController extends BaseController
{
    public $filter;
    public $pagesize = 18;
    public function __construct($id,$module)
    {
        parent::__construct($id,$module);
    }

    public function init()
    {
        $this->registerJs(
            array('jquery.uploadify'),
            'end','bootstrap'
        );

        $this->registerJs(
            array(
                'fuelux/fuelux.wizard.min',
                'jquery.validate.min',
                'additional-methods.min',
                'bootbox.min',
                'jquery.maskedinput.min',
                'select2.min',
                'oct/goods/goods_form'
            ),
            'end'
        );
        $this->filter = array(
            'compare' => array(
                '>'=>'大于',
                '<'=>'小于',
                '='=>'等于',
                '>='=>'大于等于',
                '<='=>'小于等于'
            )
        );
    }
    /**
     * 商品列表
     */
    public function actionIndex()
	{

        $pageIndex = isset($_GET['page'])?$_GET['page']:1;
        $params = $this->get('Goods');
        $Goods = new Goods();
        $result = $Goods->items(GoodsFilter::goods($params),$pageIndex,$this->pagesize);
        $items = $result['items'];
        $count = $result['count'];
        //分页
        $pages = new CPagination($count);
        $this->render('index',array(
            'dataProvider'=>$items,
            'pages' => $pages,
            'pageIndex'=>$pageIndex-1,
            'params'=>$params
        ));
	}

    /**
     * 商品编辑
     */
    public function actionUpdate()
    {
        $goods_id = $this->get('goods_id');
        $model['goods_row'] = Goods::model()->find('goods_id = :goods_id',array(':goods_id'=>$goods_id));
        $ImageImage = new ImageImage();
        if ($_POST) {
            //商品主表信息
            $goods_attributes = $this->post('Goods');
            $goods_attributes['update_time'] = time();
            //限时促销 时间
            $goods_attributes['timestart'] =strtotime($goods_attributes['timestart']."00:00:00");
            $goods_attributes['timeend'] =strtotime($goods_attributes['timeend']."23:59:59");
            $result = Goods::model()->updateByPk($goods_id,$goods_attributes);
            if (!$result) {
                $Goods = new Goods();
                $this->message('error',CHtml::errorSummary($Goods),$this->createUrl('index'));
            }

            //商品图片
            $image_attributes = $this->post('Image');
            $image_attach_attributes = $this->post('ImageAttach');
            $image_ids = $this->post('ImageId');
            $result = $ImageImage->imageList($image_attributes,$image_attach_attributes,$image_ids,$goods_id);
            if (!$result) {
                $this->message('error',CHtml::errorSummary($ImageImage),$this->createUrl('index'));
            }
            //最新上架-----------------加入缓存--------------------
            Yii::import("application.modules.b2c.models.ModelProduct");
            Yii::import("application.modules.b2c.components.*");
            $Product = new ModelProduct();
            $condition = "p.is_default = 'true'";
            $goods_list = $Product->getProducts(
                'g.goods_id,g.name,g.image_default_id,g.price,p.uptime,p.product_id,p.bn',
                $condition,'p.uptime DESC',0,10
            );
            Yii::import("ext.redis.*");
            $list = new ARedisList("productlist");
            $list->clear();
            foreach($goods_list as $k=>$v){
               // $oldlength=$list->count();
                $v_json=json_encode($v);
                $list->add($v_json);
            }

            //------------------------
            //类型改变
            if ($model['goods_row']['type_id'] != $goods_attributes['type_id']) {
                $Product = new Products();
                $product_attributes = array(
                    'bn'=>$goods_attributes['bn'],
                    'price'=>$goods_attributes['price'],
                    'cost'=>$goods_attributes['cost'],
                    'mktprice'=>$goods_attributes['mktprice'],
                    'name'=>$goods_attributes['name'],
                    'weight'=>$goods_attributes['weight'],
                    'unit'=>$goods_attributes['unit'],
                    'store'=>$goods_attributes['store'],
                    'disabled'=>'false',
                    'is_default'=>'true',
                    'uptime'=>time(),
                );

                $result = $Product->typeProduct($goods_id,$product_attributes);
                if (!$result) {
                    $this->message('error','编辑失败',$this->createUrl('index'));
                }


            }

            $this->referrer();
        }
        //商品分类
        $cat = GoodsCat::model()->find('cat_id = :cat_id',array(':cat_id'=>$model['goods_row']['cat_id']));
        $model['cat_row'] = isset($cat->cat_name)?$cat->cat_name:'';
        //商品类型
        $type_list = GoodsType::model()->findAll();
        $type_arr = array();
        if ($type_list) {
            foreach ($type_list as $v) {
                $type_arr[$v->type_id] = $v->name;
            }
        }
        $model['type'] = $type_arr;
        //商品关键字
        $GoodsKeywords = new GoodsKeywords();
        $model['keywords'] = $GoodsKeywords->merge($model['goods_row']['goods_id']);
        //品牌
        $TypeBrand = new TypeBrand();
        $model['brand'] = $TypeBrand->type_brand($model['goods_row']['type_id']);
        //
        if(!empty($model['goods_row']['timestart'])){
            $model['timestart']=date("Y-m-d",$model['goods_row']['timestart']);
        }
        if(!empty($model['goods_row']['timeend'])){
            $model['timeend']=date("Y-m-d",$model['goods_row']['timeend']);
        }
        //商品品牌
        //会员价格
        $MemberLv = new MemberLv();
        $model['member_lv_price'] = $MemberLv->MemberGoodsLvPrice($model['goods_row']['goods_id']);
        //商品图片
        $model['image'] = $ImageImage->goods_image($model['goods_row']['goods_id']);
        //商品-货品信息
        $model['product'] = Products::model()->find('goods_id = :goods_id',array(':goods_id'=>$model['goods_row']['goods_id']));
        //规格
        $data['spec_info'] = '';
        $data['product_num'] = 0;
        if (!empty($model['goods_row']['spec_desc'])) {
            $GoodsTypeSpec = new GoodsTypeSpec();
            $data['spec_info'] = $GoodsTypeSpec->ProductSpecList($goods_id);
            //货品数量
            $data['product_num'] = Products::model()->count('goods_id = :goods_id',array(':goods_id'=>$model['goods_row']['goods_id']));
        }
        //
        $model['spec'] = $data;
        $this->render('update',array('model'=>$model));
    }

    /**
     * 商品添加
     */
    public function actionCreate()
    {
        if ($_POST) {
            $Goods = new Goods();
            $ImageImage = new ImageImage();
            $goods_attributes = $this->post('Goods');
            //判断货号是否存在
            $bn_goods = Goods::model()->find('bn = :bn',array(':bn'=>$goods_attributes['bn']));
            if ($bn_goods) {
                $this->message('error','货号冲突',$this->createUrl('index'));
            }
            $goods_attributes['update_time'] = time();
            //限时促销 时间
            $goods_attributes['timestart'] =strtotime($goods_attributes['timestart']."00:00:00");
            $goods_attributes['timeend'] =strtotime($goods_attributes['timeend']."23:59:59");
            $Goods->attributes = $goods_attributes;

            if (!$Goods->save()) {
                $this->message('error',CHtml::errorSummary($Goods),$this->createUrl('index'));
            }

            $goods_id = Yii::app()->db->getLastInsertID();
            //商品图片
            $image_attributes = $this->post('Image');
            $image_attach_attributes = $this->post('ImageAttach');
            $image_ids = $this->post('ImageId');
            $result = $ImageImage->imageList($image_attributes,$image_attach_attributes,$image_ids,$goods_id);
            if (!$result) {
                $this->message('error',CHtml::errorSummary($ImageImage),$this->createUrl('index'));
            }

            //创建货品
            $product_attributes = array(
                'goods_id'=>$goods_id,
                'bn'=>$goods_attributes['bn'],
                'price'=>$goods_attributes['price'],
                'cost'=>$goods_attributes['cost'],
                'mktprice'=>$goods_attributes['mktprice'],
                'name'=>$goods_attributes['name'],
                'weight'=>$goods_attributes['weight'],
                'unit'=>$goods_attributes['unit'],
                'store'=>$goods_attributes['store'],
                'freez'=>0,
                'goods_type'=>'normal',
                'is_default'=>'true',
                'uptime'=>time(),
                'marketable'=>'true'
            );
            $Product = new Products();
            $Product->attributes = $product_attributes;
            if (!$Product->save()) {
                $this->message('error',CHtml::errorSummary($Product),$this->createUrl('index'));
            }

            $this->referrer();
        }
        //商品类型
        $type_list = GoodsType::model()->findAll();
        $type_arr = array();
        if ($type_list) {
            foreach ($type_list as $v) {
                $type_arr[$v->type_id] = $v->name;
            }
        }

        //品牌
        $TypeBrand = new TypeBrand();
        $model['brand'] = $TypeBrand->type_brand();

        $model['type'] = $type_arr;
        $this->render('create',array('model'=>$model));
    }

    /**
     * 商品规格
     */
    public function actionSpec()
    {
        $goods_id = $this->get('goods_id');

        $goods_row = Goods::model()->find('goods_id = :goods_id',array(':goods_id'=>$goods_id));

        if ($_POST) {
            $product_attributes = $this->post('Product');

            $Product = new Products();
            $result = $Product->createProduct($goods_id,$goods_row,$product_attributes);

            if ($result) {
                $this->message('success','编辑成功',$this->createUrl('index'));
            } else {
                $this->message('error','编辑失败',$this->createUrl('index'));
            }
        }
        //商品规格
        $GoodsTypeSpec = new GoodsTypeSpec();
        $items = $GoodsTypeSpec->TypeSpecValue($goods_row['type_id']);
        $spec_list_t = $GoodsTypeSpec->ProductSpecList($goods_id);

        $spec_list = array();
        foreach ($spec_list_t as $v) {
            $spec_list[$v['spec_id']] = $v;
        }

        //货品列表
        $product_list = Products::model()->findAll('goods_id = :goods_id AND spec_desc <> :spec_desc AND disabled = :disabled',
            array(':goods_id'=>$goods_id,':spec_desc'=>'',':disabled'=>'false'));

        echo $this->render('spec',array('items'=>$items,'spec_list'=>$spec_list,'goods_row'=>$goods_row,'product_list'=>$product_list));
    }

    /**
     * 商品扩展属性
     */
    public function actionProps()
    {
        $goods_id = $this->get('goods_id');

        $goods_row = Goods::model()->find('goods_id = :goods_id',array(':goods_id'=>$goods_id));

        //商品扩展属性
        $GoodsTypeProps = new GoodsTypeProps;
        if ($_POST) {
            $props_attributes = $this->post('Props');
            $GoodsTypeProps = new GoodsTypeProps();
            $result = $GoodsTypeProps->TypeGoodsValue($goods_id,$goods_row['type_id'],$props_attributes['props_id'],$props_attributes['props_value_id']);
            if ($result) {
                $this->message('success','编辑成功',$this->createUrl('index'));
            } else {
                $this->message('error','编辑失败',$this->createUrl('index'));
            }
        }
        $type_props = $GoodsTypeProps->TypeProps($goods_row['type_id']);
        $model['type_props'] = $type_props;
        $model['type_goods_value'] = $GoodsTypeProps->TypeGoodsValueList($goods_id,$goods_row['type_id']);

        $model['goods_row'] = $goods_row;
        $this->render('props',array('model'=>$model));
    }

    /**
     * Ajax获取商品列表
     */
    public function actionAjaxgoodslist()
    {
        $pageIndex = isset($_GET['page'])?$_GET['page']:1;
        $params = $this->get('Goods');
        $Goods = new Goods();
        //改为用produnct表中 product_id 查询
        if(!empty($params['bn'])){

            $sql = "select g.bn from car_b2c_products as p left join car_b2c_goods as g on g.goods_id = p.goods_id where p.product_id = '".$params['bn']."'";
            $res = $Goods->queryRow($sql);

            if(!empty($res)){
                $params['bn'] = $res['bn'];
            }
        }

        $result = $Goods->items(GoodsFilter::goods($params),$pageIndex,$this->pagesize);
        $items = $result['items'];
        $count = $result['count'];

        //分页
        $pages = new CPagination($count);

        echo $this->renderPartial(
            'ajaxgoodslist',
            array(
                'dataProvider'=>$items,
                'pages' => $pages,
                'pageIndex'=>$pageIndex-1,
                'params'=>$params
            )
        );
    }
}