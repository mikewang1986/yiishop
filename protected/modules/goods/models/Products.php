<?php

/**
 * "car_b2c_products" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Products extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_products}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
        return array(
            array('store, freez', 'numerical', 'integerOnly'=>true),
            array('goods_id, price, cost, mktprice, weight, unit', 'length', 'max'=>20),
            array('barcode', 'length', 'max'=>128),
            array('title, store_place', 'length', 'max'=>255),
            array('bn, spec_info, spec_desc', 'length', 'max'=>30),
            array('name', 'length', 'max'=>200),
            array('goods_type', 'length', 'max'=>6),
            array('is_default, disabled, marketable', 'length', 'max'=>5),
            array('qrcode_image_id', 'length', 'max'=>32),
            array('uptime, last_modify', 'length', 'max'=>10),
            // The following rule is used by search().
            // @todo Please remove those attributes that should not be searched.
            array('product_id, goods_id, barcode, title, bn, price, cost, mktprice, name, weight, unit, store, store_place, freez, goods_type, spec_info, spec_desc, is_default, qrcode_image_id, uptime, last_modify, disabled, marketable', 'safe', 'on'=>'search'),
        );
	}

    /**
     * 返回指定的AR类的静态模型.
     * Please note that you should have this exact method in all your CActiveRecord descendants!
     * @param string $className active record class name.
     * @return Admin the static model class
     */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
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
     * 货品生成
     *
     * @param $goods_id
     * @param $goods_row
     * @param $product_attributes
     * @return bool|mixed
     */
    public function createProduct($goods_id,$goods_row,$product_attributes)
    {
        $product_list = $this->QueryAll("SELECT product_id,spec_desc FROM {{b2c_products}} WHERE goods_id = {$goods_id}");
        $spec_desc_list = $update_arr = $insert_arr = array();
        $sql = '';
        $time = time();
        if ($product_list) {
            foreach ($product_list as $v) {
                $spec_desc_list[] = $v['spec_desc'];
                $update_arr[$v['spec_desc']] = $v['product_id'];
                if (!in_array($v['spec_desc'],$product_attributes['spec'])) {
                    $sql .= "UPDATE {{b2c_products}} SET disabled = 'true',last_modify = {$time} WHERE product_id = '{$v['product_id']}';";
                }
            }
        }

        $spec = $product_attributes['spec'];
        $spec_name = $product_attributes['spec_name'];
        $bn = $product_attributes['bn'];
        $marketable = $product_attributes['marketable'];
        $store = $product_attributes['store'];
        $price = $product_attributes['price'];
        $cost = $product_attributes['cost'];
        $mktprice = $product_attributes['mktprice'];
        $weight = $product_attributes['weight'];
        $is_default = $product_attributes['is_default'];

        foreach ($spec as $k=>$v) {
            $is_default_val = isset($is_default[$k])?'true':'false';
            $marketable_val = isset($marketable[$k])?'true':'false';
            //更新货品信息
            if (in_array($v,$spec_desc_list)) {
                $sql .= "UPDATE {{b2c_products}} SET marketable = '{$marketable_val}',store = '{$store[$k]}',price = '{$price[$k]}',
                cost = '{$cost[$k]}', mktprice = '{$mktprice[$k]}', weight = '{$weight[$k]}', is_default = '{$is_default_val}',last_modify = {$time},disabled = 'false'
                WHERE product_id = '{$update_arr[$v]}';";
                continue;
            }
            //新增货品信息
            $sql .= "INSERT INTO {{b2c_products}} (goods_id,bn,price,cost,mktprice,name,weight,unit,store,freez,goods_type,spec_info,spec_desc,is_default,uptime,marketable)
            VALUE ($goods_id,'{$bn[$k]}','{$price[$k]}','{$cost[$k]}','{$mktprice[$k]}','{$goods_row['name']}','{$weight[$k]}','{$goods_row['unit']}','{$store[$k]}',
            0,'normal','{$spec_name[$k]}','{$v}','{$is_default_val}',{$time},'{$marketable_val}');";
        }

        //清除单个货品
        if ($spec) {
            $sql .= "UPDATE {{b2c_products}} SET disabled = 'true' WHERE goods_id = {$goods_id} AND spec_desc = ''";
        }

        return $sql?$this->Execute($sql):true;
    }

    /**
     * 类型更改数据重置
     *
     * @param $goods_id
     * @param $params
     * @return mixed
     */
    public function typeProduct($goods_id,$params)
    {
        //没有规格的货品开启,有规格的货品关闭
        $updateSet = $this->ArrToSqlUpdate($params);
        $sql = '';
        $sql .= "UPDATE {{b2c_products}} SET disabled = 'true' WHERE goods_id = {$goods_id} AND spec_desc <> '';";
        $sql .= "UPDATE {{b2c_products}} SET {$updateSet} WHERE goods_id = {$goods_id} AND spec_desc = '';";
        $result = $this->Execute($sql);

        return $result;
    }
}
