<?php

/**
 * "car_b2c_goods_type_props_value" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class GoodsTypePropsValue extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return 'car_b2c_goods_type_props_value';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('props_id', 'required'),
			array('props_id, order_by', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>100),
			array('alias', 'length', 'max'=>255),
			array('lastmodify', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('props_value_id, props_id, name, order_by, alias, lastmodify', 'safe', 'on'=>'search'),
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
			'props_value_id' => 'Props Value',
			'props_id' => 'Props',
			'name' => 'Name',
			'order_by' => 'Order By',
			'alias' => 'Alias',
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
     * 规格值新增
     *
     * @param $props_id
     * @param $props_value_attributes
     * @return mixed
     */
    public function PropsValuesAdd($props_id,$props_value_attributes)
    {
        if (!$props_value_attributes) return true;
        $insert = array();
        foreach ($props_value_attributes['props_value_id'] as $k=>$v) {
            $item['props_value_id'] = $v;
            $item['name'] = $props_value_attributes['name'][$k];
            $item['alias'] = $props_value_attributes['alias'][$k];
            $item['p_order'] = $k+1;

            $insert[] = $item;
        }

        $sql = '';
        $time = time();
        foreach ($insert as $v) {
            $sql .= "INSERT INTO {{b2c_goods_type_props_value}} (props_id,name,order_by,alias,lastmodify)
            VALUES ({$props_id},'{$v['name']}','{$v['p_order']}','{$v['alias']}',{$time});";
        }

        return $this->Execute($sql);
    }

    /**
     * 扩展属性值编辑
     *
     * @param $props_id
     * @param $props_value_attributes
     * @param $props_value_list
     * @return mixed
     */
    public function PropsValuesEdit($props_id,$props_value_attributes,$props_value_list)
    {
        $list = $list_old = $list_new = $insert = $update_id = array();
        $sql = '';

        foreach ($props_value_list as $v) {
            $list_old[] = $v['props_value_id'];
        }

        //新增
        foreach ($props_value_attributes['props_value_id'] as $k=>$v) {
            $item['props_value_id'] = $v;
            $item['name'] = $props_value_attributes['name'][$k];
            $item['alias'] = $props_value_attributes['alias'][$k];
            $item['p_order'] = $k+1;


            if ($item['props_value_id']) $list[$props_value_attributes['props_value_id'][$k]] = $item;
            else $insert[] = $item;
        }

        //更新
        foreach ($list as $v) {
            $list_new[] = $v['props_value_id'];
            if ($v['props_value_id'] && in_array($v['props_value_id'],$list_old)) $update_id[] = $v['props_value_id'];
        }

        $delete_id = array_diff($list_old,$list_new);

        $time = time();
        foreach ($insert as $v) {
            $sql .= "INSERT INTO {{b2c_goods_type_props_value}} (props_id,name,order_by,alias,lastmodify)
            VALUES ({$props_id},'{$v['name']}','{$v['p_order']}','{$v['alias']}',{$time});";
        }

        foreach ($delete_id as $v) {
            $sql .= "DELETE FROM {{b2c_goods_type_props_value}} WHERE props_value_id = {$v};";
        }

        foreach ($update_id as $v) {
            $item = $list[$v];
            $sql .= "UPDATE {{b2c_goods_type_props_value}} SET name = '{$item['name']}',alias = '{$item['alias']}',
            order_by = {$item['p_order']},lastmodify = {$time} WHERE props_value_id = {$v};";
        }

        if (!$sql) return true;
        return $this->Execute($sql);
    }
}
