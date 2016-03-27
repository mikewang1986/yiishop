<?php
/**
 * 规格处理模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       yiishop.model
 * @license       http://www.yiitian.com/license
 * @version       v1.0.0
 */
class ModelSpec extends B2cModel
{
    private static $_instance;
    /**
     * 根据Goods表spec_desc信息获取规格详情
     *
     * @param $spec_list
     * @return mixed
     */
    public function GoodsSpecImage($spec_list)
    {
        if (empty($spec_list)) return false;
        //二维数组转一维数组
        foreach ($spec_list as $k=>$v) {
            $spec_id[] = $k;
            foreach ($v as $vv) {
                $vv['spec_id'] = $k;
                $spec_list_sort[] = $vv;
                if (isset($vv['spec_image']) && !empty($vv['spec_image']))
                    $image_list[] = "'".$vv['spec_image']."'";
            }
        }

        //获取规格名称
        $specs = implode(',',$spec_id);
        $spec_sql = "SELECT spec_id,spec_name,spec_show_type,spec_type FROM {{b2c_specification}} WHERE
        spec_id IN ($specs)";
        $spec_list = $this->ModelQueryAll($spec_sql);
        foreach ($spec_list as $v) {
            $spec_list_val[$v['spec_id']] = $v;
        }

        //获取规格图片
        if (isset($image_list) && $image_list) {
            $images = implode(',',$image_list);
            $image_list_sql = "SELECT image_id,s_url FROM {{image_image}} WHERE image_id IN ($images)";
            $image_list_val = $this->ModelQueryAll($image_list_sql);
            foreach ($image_list_val as $v) {
                $image_list_spec[$v['image_id']] = $v['s_url'];
            }
        }

        //图片url 存放到一维数组$spec_list_sort中
        foreach ($spec_list_sort as $v) {
            if (isset($v['spec_image']) && !empty($v['spec_image'])) {
                $v['image_url'] = $this->img_url.$image_list_spec[$v['spec_image']];
            }
            $spec_list_val[$v['spec_id']]['spec_val'][] = $v;
        }

        foreach ($spec_list_val as $v) {
            $item[] = $v;
        }

        return $item;
    }

    /**
     * 根据货品ID获取规格
     *
     * @param $product_id
     * @return array
     */
    public function ProductSpec($product_id)
    {
        $product_list = $this->ModelQueryAll(
            "SELECT product_id,spec_info FROM {{b2c_products}} WHERE product_id IN ($product_id)"
        );
        $item = array();
        foreach ($product_list as $v) {
            if (empty($v['spec_info'])) continue;
            foreach (explode('、',$v['spec_info']) as $kk=>$vv) {
                $spec = explode('：',$vv);
                $item[$v['product_id']][$kk+1]['label'] = $spec[0];
                $item[$v['product_id']][$kk+1]['value'] = $spec[1];
            }
        }

        return $item;
    }

    /**
     * 商品规格
     *
     * @param $goods_id
     * @return array
     */
    public function ProductSpecList($goods_id)
    {
        $product_list = $this->ModelQueryAll(
            "SELECT product_id,spec_desc FROM {{b2c_products}} WHERE goods_id = {$goods_id}"
        );

        $item = array();
        $spec = array();
        $spec_value = array();
        foreach ($product_list as $v) {
            $spec_info = unserialize($v['spec_desc']);
            if (isset($spec_info['spec_value_id']) && $spec_info['spec_value_id']!='') {
                foreach ($spec_info['spec_value_id'] as $kk=>$vv) {
                    $item['spec'][$kk][$vv] = $vv;
                    $item['product'][$v['product_id']][$kk] = $vv;

                    if (!in_array($kk,$spec)) $spec[] = $kk;
                    if (!in_array($vv,$spec_value)) $spec_value[] = $vv;
                }
            }
        }

        if (!$spec)  return array();
        if (!$spec_value) return array();

        $spec_str = implode(',',$spec);
        $spec_value_str = implode(',',$spec_value);

        //规格
        $spec_list = $this->ModelQueryAll(
            "SELECT spec_id,spec_name FROM {{b2c_specification}} WHERE spec_id IN ($spec_str)"
        );
        foreach ($spec_list as $v) {
            $spec_list_key[$v['spec_id']] = $v['spec_name'];
        }

        //规格值
        $spec_value_list = $this->ModelQueryAll(
            "SELECT spec_value_id,spec_value FROM {{b2c_spec_values}} WHERE spec_value_id IN ($spec_value_str)"
        );
        foreach ($spec_value_list as $v) {
            $spec_value_list_key[$v['spec_value_id']] = $v['spec_value'];
        }

        $att = array();
        foreach ($item['spec'] as $k=>$v) {
            $row = array(
                'spec_id'=>$k,
                'spec_name'=>$spec_list_key[$k],
            );
            foreach ($v as $vv) {
                $row_row['spec_id'] = $k;
                $row_row['spec_value_id'] = $vv;
                $row_row['spec_value_name'] = $spec_value_list_key[$vv];
                $row['spec_value'][] = $row_row;
            }
            $att[] = $row;
        }

        return $att;
    }

    /**
     * 根据商品规格获取货品
     *
     * @param $goods_id
     * @param $specArr
     * @return mixed
     */
    public function SpecByProduct($goods_id,$specArr)
    {
        $product_list = $this->ModelQueryAll(
            "SELECT product_id,spec_desc FROM {{b2c_products}} WHERE goods_id = {$goods_id}"
        );

        $product = array();
        foreach ($product_list as $v) {
            $spec_info = unserialize($v['spec_desc']);
            foreach ($spec_info['spec_value_id'] as $kk=>$vv) {
                $product[$v['product_id']][$kk] = $vv;
            }
        }

        foreach ($product as $k=>$v) {
            if ($specArr == $v) {
                $product_id = $k;
                continue;
            }
        }

        if (empty($product_id)) return array();
        $product_row = $this->ModelQueryRow(
            "SELECT product_id,bn,price,cost,mktprice,name FROM {{b2c_products}} WHERE product_id = $product_id"
        );

        return $product_row;
    }

    /**
     * @param string $spec_desc
     * @return array
     */
    public function unserializeSpec($spec_desc){
        if(empty($spec_desc)){
            return array();
        }
        $spec = unserialize($spec_desc);

        $i=0;
        foreach($spec['spec_value'] as $k=>$v){

            $sql = "select * from sdb_b2c_specification where spec_id = ".$k;
            $spec=  $this->ModelQueryRow($sql);
            $item[$i]['spec_name']  = $spec['spec_name'];
            $item[$i]['spec_value'] = $v;
            $i++;
        }
        return $item;
    }


    public static  function getInstance(){
        if(self::$_instance===null){
            self::$_instance = new self;
        }
        return self::$_instance;
    }
}
