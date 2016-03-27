<?php

/**
 * "b2c_goods_type_spec" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class GoodsTypeSpec extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_goods_type_spec}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('spec_id, type_id, ordernum', 'numerical', 'integerOnly'=>true),
			array('spec_style', 'length', 'max'=>8),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('spec_id, type_id, spec_style, ordernum', 'safe', 'on'=>'search'),
		);
	}

    /**
     * @return array 对模型的属性验证规则.
     */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

    /**
     * @return array 对模型的属性验证规则.
     */
	public function attributeLabels()
	{
		return array(
			'spec_id' => 'Spec',
			'type_id' => 'Type',
			'spec_style' => 'Spec Style',
			'ordernum' => 'Ordernum',
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
     * 商品规格信息
     *
     * @param $spec_desc
     * @return array
     */
    public function TypeSpecInfo($spec_desc)
    {
        $spec_arr = array();
        foreach ($spec_desc as $k=>$v) {
            $sql = "SELECT spec_name FROM {{b2c_specification}} WHERE spec_id = $k";
            $spec = $this->QueryRow($sql);
            $spec_arr[$k]['name'] = $spec['spec_name'];
            $spec_arr[$k]['count'] = count($v);
        }

        return $spec_arr;
    }

    /**
     * 类型规格详情
     *
     * @param $type_id
     * @return array
     */
    public function TypeSpecValue($type_id)
    {
        $sql = "SELECT sp.spec_id,sp.spec_name,sv.spec_value_id,sv.spec_value
        FROM car_b2c_goods_type_spec ts LEFT JOIN car_b2c_specification sp ON ts.spec_id = sp.spec_id
        LEFT JOIN car_b2c_spec_values sv ON ts.spec_id = sv.spec_id WHERE ts.type_id = {$type_id}";

        $list = $this->QueryAll($sql);
        $items = array();
        foreach ($list as $v) {
            $items[$v['spec_id']]['spec_name'] = $v['spec_name'];
            $items[$v['spec_id']]['spec_val'][] = array(
                'spec_value_id'=>$v['spec_value_id'],
                'spec_value'=>$v['spec_value']
            );
        }
        return $items;
    }

    /**
     * 商品规格
     *
     * @param $goods_id
     * @return array
     */
    public function ProductSpecList($goods_id)
    {
        $product_list = $this->QueryAll(
            "SELECT product_id,spec_desc FROM {{b2c_products}} WHERE goods_id = {$goods_id} AND spec_desc <> '' AND disabled = 'false'"
        );
        $att = $item = $spec = $spec_value = array();

        if (!$product_list) return $att;

        foreach ($product_list as $v) {
            $spec_info = explode('|',$v['spec_desc']);
            if ($spec_info) {
                foreach ($spec_info as $vv) {
                    $spec_v = explode(',',$vv);

                    if (!in_array($spec_v[0],$spec)) {
                        $spec[] = $spec_v[0];
                    }
                    if (!in_array($spec_v[1],$spec_value)) {
                        $spec_value[] = $spec_v[1];
                        $item[$spec_v[0]][] = $spec_v[1];
                    }
                }
            }
        }

        if (!$spec)  return array();
        if (!$spec_value) return array();

        $spec_str = implode(',',$spec);
        $spec_value_str = implode(',',$spec_value);

        //规格
        $spec_list = $this->QueryAll(
            "SELECT spec_id,spec_name FROM {{b2c_specification}} WHERE spec_id IN ($spec_str)"
        );
        foreach ($spec_list as $v) {
            $spec_list_key[$v['spec_id']] = $v['spec_name'];
        }

        //规格值
        $spec_value_list = $this->QueryAll(
            "SELECT spec_value_id,spec_value FROM {{b2c_spec_values}} WHERE spec_value_id IN ($spec_value_str)"
        );
        foreach ($spec_value_list as $v) {
            $spec_value_list_key[$v['spec_value_id']] = $v['spec_value'];
        }


        foreach ($item as $k=>$v) {
            $row = array(
                'spec_id'=>$k,
                'spec_name'=>$spec_list_key[$k],
            );
            foreach ($v as $vv) {
                $row_row['spec_id'] = $k;
                $row_row['spec_value_id'] = $vv;
                $row_row['spec_value_name'] = $spec_value_list_key[$vv];

                $row['spec_value_id_arr'][] = $vv;
                $row['spec_value'][] = $row_row;
            }
            $att[] = $row;
        }

        return $att;
    }

    /**
     * 类型获取规格
     *
     * @param $type_id
     * @return mixed
     */
    public function TypeSpec($type_id)
    {
        $sql = "SELECT spec_id FROM {{b2c_goods_type_spec}} WHERE type_id = {$type_id}";
        $list = $this->QueryAll($sql);

        return $list;
    }

    /**
     * 生成规格商品
     *
     * @param $spec
     * @param $goods_id
     * @return array
     */
    public function SpecValue($spec,$goods_id)
    {
        if (!$spec) return array();
        $sql = "SELECT s.spec_value_id,s.spec_value,p.spec_id,p.spec_name FROM {{b2c_spec_values}} s
        LEFT JOIN {{b2c_specification}} p ON s.spec_id = p.spec_id
        WHERE s.spec_value_id IN ({$spec})";
        $list = $this->QueryAll($sql);

        $goods_info = $this->QueryRow("SELECT * FROM {{b2c_goods}} WHERE goods_id = {$goods_id}");

        $items = array();
        foreach ($list as $v) {
            $count[$v['spec_id']] = $v;
        }
        if (count($count) == 1) {
            for ($i = 0;$i < count($list); $i++) {
                $item['val'] = $list[$i]['spec_id'].','.$list[$i]['spec_value_id'];
                $item['name'] = $list[$i]['spec_name'].':'.$list[$i]['spec_value'];
                //$item['class'] = $list[$i]['spec_id'].$list[$i]['spec_value_id'];
                $item['goods'] = $goods_info;
                $items[] = $item;
            }
        } elseif (count($count) == 2) {
            for ($i = 0;$i < count($list); $i++) {
                for ($j = $i + 1; $j < count($list); $j++) {
                    if ($list[$i]['spec_id'] != $list[$j]['spec_id']) {
                        $item['val'] = $list[$i]['spec_id'].','.$list[$i]['spec_value_id'].'|'.$list[$j]['spec_id'].','.$list[$j]['spec_value_id'];
                        $item['name'] = $list[$i]['spec_name'].':'.$list[$i]['spec_value'].','.$list[$j]['spec_name'].':'.$list[$j]['spec_value'];
                        //$item['class'] = $list[$i]['spec_id'].$list[$i]['spec_value_id'].$list[$j]['spec_id'].$list[$j]['spec_value_id'];
                        $item['goods'] = $goods_info;
                        $item['goods']['bn'] = $goods_info['bn'].$list[$i]['spec_value_id'].$list[$j]['spec_value_id'];
                        $items[] = $item;
                    }
                }
            }
        }

        return $items;
    }

    /**
     * 类型规格更新
     *
     * @param int $type_id
     * @param $spec_list
     * @return mixed
     */
    public function spec_update($type_id,$spec_list)
    {
        $type_spec_list = self::model()->findAll('type_id = :type_id',array(':type_id'=>$type_id));

        $old_list = array();
        foreach ($type_spec_list as $v) {
            $old_list[] = $v['spec_id'];
        }

        $delete_id = array_diff($old_list,$spec_list);
        $insert_id = array_diff($spec_list,$old_list);

        $sql = '';
        foreach ($delete_id as $v) {
            $sql .= "DELETE FROM {{b2c_goods_type_spec}} WHERE type_id = $type_id AND spec_id = {$v};";
        }
        foreach ($insert_id as $v) {
            $sql .= "INSERT INTO {{b2c_goods_type_spec}} (type_id,spec_id,spec_style,ordernum) VALUES ({$type_id},{$v},'flat',1);";
        }

        return $sql?$this->Execute($sql):true;
    }
}
