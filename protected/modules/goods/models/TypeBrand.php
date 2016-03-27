<?php

/**
 * "car_b2c_type_brand" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class TypeBrand extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_type_brand}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('type_id, brand_id, brand_order', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('type_id, brand_id, brand_order', 'safe', 'on'=>'search'),
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
            'brand'=>array(self::HAS_ONE,'Brand','brand_id')
		);
	}

    /**
     * @return array 对模型的属性验证规则.
     */
	public function attributeLabels()
	{
		return array(
			'type_id' => 'Type',
			'brand_id' => 'Brand',
			'brand_order' => 'Brand Order',
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
     * 根据类型品牌关联获取品牌
     *
     * @param $type_id
     * @return mixed
     */
    public function type_brand($type_id = 0)
    {
        if ($type_id)
            $brand = $this->QueryAll("SELECT b.brand_id,b.brand_name FROM {{b2c_type_brand}} tb LEFT JOIN {{b2c_brand}} b
            ON tb.brand_id = b.brand_id WHERE tb.type_id = {$type_id}");
        else $brand = $this->QueryAll("SELECT brand_id,brand_name FROM {{b2c_brand}}");
        return $brand;
    }

    /**
     * 品牌类型更新
     *
     * @param $brand_id
     * @param $type_list
     * @return mixed
     */
    public function type_brand_update($brand_id,$type_list)
    {
        $type_old = self::model()->findAll('brand_id = :brand_id',array(':brand_id'=>$brand_id));

        $type_old_list = array();
        foreach ($type_old as $v) {
            $type_old_list[] = $v['type_id'];
        }

        $delete_id = array_diff($type_old_list,$type_list);
        $insert_id = array_diff($type_list,$type_old_list);

        $sql = '';
        foreach ($delete_id as $v) {
            $sql .= "DELETE FROM {{b2c_type_brand}} WHERE type_id = {$v};";
        }
        foreach ($insert_id as $v) {
            $sql .= "INSERT INTO {{b2c_type_brand}} (type_id,brand_id) VALUES ($v,{$brand_id});";
        }

        return $sql?$this->Execute($sql):true;
    }

    /**
     * 品牌类型创建
     *
     * @param $brand_id
     * @param $type_list
     * @return mixed
     */
    public function type_brand_insert($brand_id,$type_list)
    {
        $sql = '';
        foreach ($type_list as $v) {
            $sql .= "INSERT INTO {{b2c_type_brand}} (type_id,brand_id) VALUES ($v,{$brand_id});";
        }
        return $this->Execute($sql);
    }

    /**
     * 品牌类型更新
     *
     * @param $type_id
     * @param $brand_list
     * @return mixed
     */
    public function brand_type_update($type_id,$brand_list)
    {
        $brand_old = self::model()->findAll('type_id = :type_id',array(':type_id'=>$type_id));

        $brand_old_list = array();
        foreach ($brand_old as $v) {
            $brand_old_list[] = $v['brand_id'];
        }

        $delete_id = array_diff($brand_old_list,$brand_list);
        $insert_id = array_diff($brand_list,$brand_old_list);

        $sql = '';
        foreach ($delete_id as $v) {
            $sql .= "DELETE FROM {{b2c_type_brand}} WHERE type_id = $type_id AND brand_id = {$v};";
        }
        foreach ($insert_id as $v) {
            $sql .= "INSERT INTO {{b2c_type_brand}} (type_id,brand_id) VALUES ({$type_id},{$v});";
        }

        return $sql?$this->Execute($sql):true;
    }
}
