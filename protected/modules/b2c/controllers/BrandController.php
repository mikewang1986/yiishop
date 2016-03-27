<?php

class BrandController extends B2cController
{
	public function actionIndex()
	{
        $this->render('index');
	}

    /**
     * 品牌
     */
    public function actionOct()
    {

        $brand_id = 24;
        $type_brand_list = TypeBrand::model()->findAll(
            'brand_id = :brand_id',
            array(
                ':brand_id'=>$brand_id
            )
        );

        $TypeBrand = new TypeBrand();
        $type_ids = implode(',',$TypeBrand->getFindAllids($type_brand_list,'type_id'));

        //类型列表
        $type_list = GoodsType::model()->findAllBySql(
            'SELECT * FROM car_b2c_goods_type WHERE type_id IN ('.$type_ids.')'
        );

        //价格区间
        $type_price_item = array();
        foreach ($type_list as $v) {
            $price = unserialize($v->price);
            if (empty($price)) continue;
            $type_price_item = $price;
        }

        //商品属性值
        $goods_type_props_list = GoodsTypeProps::model()->findAllBySql(
            'SELECT * FROM car_b2c_goods_type_props WHERE type_id IN ('.$type_ids.')'
        );

        $Goodstypeprops = new GoodsTypeProps();
        $props_ids = implode(',',$Goodstypeprops->getFindAllids($goods_type_props_list,'props_id'));

        //商品属性值数据
        $goods_type_props_value_list = GoodsTypePropsValue::model()->findAllBySql(
            'SELECT * FROM car_b2c_goods_type_props_value WHERE props_id IN ('.$props_ids.')'
        );

        $goods_type_props_value_item = array();
        foreach ($goods_type_props_value_list as $v) {
            $goods_type_props_value_item[$v->props_id][] = $v;
        }

        //规格

        /*提交数据到页面*/
        $data = array(
            'type_list' => $type_list,
            'goods_type_props_list' => $goods_type_props_list,
            'goods_type_props_value_item' => $goods_type_props_value_item,
            'type_price_item' => $type_price_item
        );
        $this->render('oct',$data);
    }

    public function actionTest()
    {
        $memcache = new Memcache();
        $memcache->connect('128.128.1.41', 11211);
        $memcache->set('key', 'Memcache test successful!', 0, 60);
        $result = $memcache->get('key');
        unset($memcache);
        echo $result;
    }
}