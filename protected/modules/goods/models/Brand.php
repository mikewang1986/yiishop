<?php

/**
 * "car_b2c_brand" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Brand extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_brand}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('brand_name', 'required'),
			array('ordernum', 'numerical', 'integerOnly'=>true),
			array('brand_name', 'length', 'max'=>50),
			array('brand_url, brand_logo', 'length', 'max'=>255),
			array('disabled', 'length', 'max'=>5),
			array('last_modify', 'length', 'max'=>10),
			array('brand_desc, brand_keywords, brand_setting', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('brand_id, brand_name, brand_url, brand_desc, brand_logo, brand_keywords, brand_setting, disabled, ordernum, last_modify', 'safe', 'on'=>'search'),
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
			'brand_id' => 'Brand',
			'brand_name' => 'Brand Name',
			'brand_url' => 'Brand Url',
			'brand_desc' => 'Brand Desc',
			'brand_logo' => 'Brand Logo',
			'brand_keywords' => 'Brand Keywords',
			'brand_setting' => 'Brand Setting',
			'disabled' => 'Disabled',
			'ordernum' => 'Ordernum',
			'last_modify' => 'Last Modify',
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
     * 品牌列表
     *
     * @param $pageIndex
     * @param $pagesize
     * @return array
     */
    public function BrandList($pageIndex,$pagesize)
    {
        $criteria = new CDbCriteria();
        $criteria->select = '*';
        $criteria->condition = "disabled = 'false'";
        $criteria->order = 'ordernum DESC,brand_id ASC';

        // 求总的记录数
        $count = self::model()->count($criteria);
        $criteria->limit = $pagesize;
        $criteria->offset = ($pageIndex - 1) * $pagesize;

        $list = self::model()->findAll($criteria);

        return array('item'=>$list,'count'=>$count);
    }
}
