<?php

/**
 * "car_b2c_goods_type" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class GoodsType extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_goods_type}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name', 'length', 'max'=>100),
			array('floatstore, is_physical, dly_func, ret_func', 'length', 'max'=>1),
			array('schema_id', 'length', 'max'=>30),
			array('reship', 'length', 'max'=>8),
			array('disabled, is_def', 'length', 'max'=>5),
			array('lastmodify', 'length', 'max'=>10),
			array('alias, setting, price, minfo, params, tab', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('type_id, name, floatstore, alias, is_physical, schema_id, setting, price, minfo, params, tab, dly_func, ret_func, reship, disabled, is_def, lastmodify', 'safe', 'on'=>'search'),
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
			'type_id' => 'Type',
			'name' => 'Name',
			'floatstore' => 'Floatstore',
			'alias' => 'Alias',
			'is_physical' => 'Is Physical',
			'schema_id' => 'Schema',
			'setting' => 'Setting',
			'price' => 'Price',
			'minfo' => 'Minfo',
			'params' => 'Params',
			'tab' => 'Tab',
			'dly_func' => 'Dly Func',
			'ret_func' => 'Ret Func',
			'reship' => 'Reship',
			'disabled' => 'Disabled',
			'is_def' => 'Is Def',
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
     * 根据spec_id 获取规格
     *
     * @param string $spec_id
     * @return mixed
     */
    public function SpecId($spec_id)
    {
        if (is_int($spec_id)) {
            $condition = "spec_id = $spec_id";
        } else {
            $condition = "spec_id IN ($spec_id)";
        }
        $sql = "SELECT spec_id,spec_name,spec_type FROM {{b2c_specification}} WHERE ".$condition;

        return $this->QueryAll($sql);
    }

    /**
     * 根据spec_id 获取规格值
     *
     * @param $spec_id
     * @return mixed
     */
    public function SpecValue($spec_id)
    {
        if (is_int($spec_id)) {
            $condition = "spec_id = $spec_id";
        } else {
            $condition = "spec_id IN ($spec_id)";
        }
        $sql = "SELECT spec_id,spec_value,spec_image FROM {{b2c_spec_values}} WHERE ".$condition;
        return $this->QueryAll($sql);
    }

    /**
     * 类型列表
     *
     * @param $pageIndex
     * @param $pagesize
     * @return array
     */
    public function TypeList($pageIndex,$pagesize)
    {
        $criteria = new CDbCriteria();
        $criteria->select = '*';
        $criteria->condition = "disabled = 'false'";
        $criteria->order = 'type_id ASC';

        //求总的记录数
        $count = self::model()->count($criteria);
        $criteria->limit = $pagesize;
        $criteria->offset = ($pageIndex - 1) * $pagesize;

        $list = self::model()->findAll($criteria);

        return array('item'=>$list,'count'=>$count);
    }
}
