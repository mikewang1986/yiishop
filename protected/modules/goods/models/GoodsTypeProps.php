<?php

/**
 * "car_b2c_goods_type_props" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class GoodsTypeProps extends BaseModel
{
    public $props_value;
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_goods_type_props}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('type', 'required'),
			array('goods_p, ordernum', 'numerical', 'integerOnly'=>true),
			array('type, search', 'length', 'max'=>20),
			array('show, lastmodify', 'length', 'max'=>10),
			array('name', 'length', 'max'=>100),
			array('alias', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('props_id, type, search, show, name, alias, goods_p, ordernum, lastmodify', 'safe', 'on'=>'search'),
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
			'props_id' => 'Props',
			'type' => 'Type',
			'search' => 'Search',
			'show' => 'Show',
			'name' => 'Name',
			'alias' => 'Alias',
			'goods_p' => 'Goods P',
			'ordernum' => 'Ordernum',
			'lastmodify' => 'Lastmodify',
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
     * 根据类型获取扩展属性
     *
     * @param $page
     * @param $pagesize
     * @param $condition
     * @return mixed
     */
    public function PropsValueList($page,$pagesize,$condition='')
    {
        $sql = "SELECT * FROM {{b2c_goods_type_props}} ";
        $count = $this->RowCount($sql);

        //筛选条件
        if ($condition) {
            $sql .= " WHERE {$condition}";
        }

        //分页
        if ($page) {
            $start = ($page - 1) * $pagesize;
            $sql .= " LIMIT {$start},{$pagesize}";
        }

        $list = $this->QueryAll($sql);

        //扩展属性值
        $props_value = array();
        foreach ($list as $v) {
            $props_value[] = $v['props_id'];
        }
        if ($props_value) {
            $props_value_str = implode(',',$props_value);
            $propsValueList = $this->QueryAll("SELECT props_value_id,name,props_id FROM {{b2c_goods_type_props_value}} WHERE props_id IN ($props_value_str)");
            foreach ($propsValueList as $v) {
                $propsValue[$v['props_id']][$v['props_value_id']] = $v['name'];
            }
        }
        else $propsValue = array();

        return array('count'=>$count,'item'=>$list,'propsValue'=>$propsValue);
    }

    /**
     * 类型规格、规格值
     *
     * @param $type_id
     * @return array|mixed
     */
    public function TypeProps($type_id)
    {
        $type_list = $this->QueryAll("SELECT props_id FROM {{b2c_goods_type_props_relation}} WHERE type_id = {$type_id}");

        if (!$type_list) return array();
        foreach ($type_list as $v) {
            $type_list_new[] = $v['props_id'];
        }
        $props_ids = implode(',',$type_list_new);
        $condtion = "props_id IN ($props_ids)";

        return $this->PropsValueList(0,0,$condtion);
    }

    /**
     * 扩展属性
     *
     * @param $type_id
     * @return mixed
     */
    public function TypePropsRelation($type_id)
    {
        return $this->QueryAll("SELECT props_id FROM {{b2c_goods_type_props_relation}} WHERE type_id = {$type_id}");
    }

    /**
     * 商品属性更新
     *
     * @param $goods_id
     * @param $type_id
     * @param $props_ids
     * @param $props_value_ids
     * @return bool|mixed
     */
    public function TypeGoodsValue($goods_id,$type_id,$props_ids,$props_value_ids)
    {
        $props_id_o = $this->QueryAll("SELECT DISTINCT(props_id) AS props_id FROM {{b2c_goods_props_index}} WHERE type_id = {$type_id} AND goods_id = {$goods_id}");
        $sql = '';
        $props_id_o_arr = array();
        foreach ($props_id_o as $v) {
            $props_id_o_arr[] = $v['props_id'];
            if (isset($props_value_ids[$v['props_id']]) && $props_value_ids[$v['props_id']]) continue;
            $sql .= "DELETE FROM {{b2c_goods_props_index}} WHERE type_id = {$type_id} AND goods_id = {$goods_id} AND props_id = {$v['props_id']};";
        }
        $time = time();
        foreach ($props_ids as $v) {
            if (in_array($v,$props_id_o_arr) && isset($props_value_ids[$v]) && $props_value_ids[$v])
                $sql .= "UPDATE {{b2c_goods_props_index}} SET props_value_id = {$props_value_ids[$v]},last_modify = {$time}
                WHERE type_id = {$type_id} AND goods_id = {$goods_id} AND props_id = {$v['props_id']};";

            if (!in_array($v,$props_id_o_arr) && $props_value_ids[$v])
                $sql .= "INSERT INTO {{b2c_goods_props_index}} (type_id,props_id,props_value_id,goods_id,last_modify)
                VALUE ({$type_id},{$v},{$props_value_ids[$v]},{$goods_id},{$time});";
        }

        return $sql?$this->Execute($sql):true;
    }

    /**
     * 商品属性列表
     *
     * @param $goods_id
     * @param $type_id
     * @return array
     */
    public function TypeGoodsValueList($goods_id,$type_id)
    {
        $props_id_o = $this->QueryAll("SELECT props_id,props_value_id FROM {{b2c_goods_props_index}} WHERE type_id = {$type_id} AND goods_id = {$goods_id}");
        $props_id_o_arr = array();
        foreach ($props_id_o as $v) {
            $props_id_o_arr[$v['props_id']] = $v['props_value_id'];
        }

        return $props_id_o_arr;
    }
}
