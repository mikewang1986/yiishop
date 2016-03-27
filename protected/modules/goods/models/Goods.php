<?php

/**
 * "car_b2c_goods" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Goods extends BaseModel
{
    public $type_name;
    public $brand_name;
    public $cat_name;
    public $type;
    public $brand;
    public $keywords;
    public $image;

    public $pagesize = 10;
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_goods}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
        return array(
            array('type_id, cat_id, brand_id, store, p_order', 'numerical', 'integerOnly'=>true),
            array('bn, name', 'length', 'max'=>200),
            array('price, cost, mktprice, weight, unit', 'length', 'max'=>20),
            array('goods_type', 'length', 'max'=>6),
            array('image_default_id', 'length', 'max'=>32),
            array('brief', 'length', 'max'=>255),
            array('is_spec, marketable, disabled', 'length', 'max'=>5),
            array('create_time, update_time', 'length', 'max'=>10),
            array('intro, goods_setting, spec_desc, params', 'safe'),
            array('totalcnf,issendfree,istime,timestart,timeend,credit', 'length', 'max'=>11),
            // The following rule is used by search().
            // @todo Please remove those attributes that should not be searched.
            array('goods_id, bn, name, type_id, cat_id, brand_id, store, price, cost, mktprice, weight, unit, goods_type, image_default_id, brief, intro, goods_setting, is_spec, spec_desc, params, marketable, p_order, create_time, update_time, disabled,totalcnf,issendfree,istime,timestart,timeend,credit', 'safe', 'on'=>'search'),
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
            'goods_id' => 'Goods',
            'bn' => 'Bn',
            'name' => 'Name',
            'type_id' => 'Type',
            'cat_id' => 'Cat',
            'brand_id' => 'Brand',
            'store' => 'Store',
            'price' => 'Price',
            'cost' => 'Cost',
            'mktprice' => 'Mktprice',
            'weight' => 'Weight',
            'unit' => 'Unit',
            'goods_type' => 'Goods Type',
            'image_default_id' => 'Image Default',
            'brief' => 'Brief',
            'intro' => 'Intro',
            'goods_setting' => 'Goods Setting',
            'is_spec' => 'Is Spec',
            'spec_desc' => 'Spec Desc',
            'params' => 'Params',
            'marketable' => 'Marketable',
            'p_order' => 'P Order',
            'create_time' => 'Create Time',
            'update_time' => 'Update Time',
            'disabled' => 'Disabled',
            'totalcnf' => 'Total Cnf',
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
     *列表
     *
     * @param $condition
     * @param $pageIndex
     * @param $pageSize
     * @return mixed
     */
    public function items($condition,$pageIndex,$pageSize)
    {
        $select = 'g.goods_id,g.name,g.cost,g.is_spec,g.is_props,b.brand_name,a.cat_name,t.name AS type_name';
        $sql = $this->items_sql($select,$condition);

        $count = $this->RowCount($this->items_sql('count(*)',$condition));
        $start = ($pageIndex - 1)*$pageSize;
        $sql .= " ORDER BY g.goods_id DESC LIMIT $start,$pageSize";

        return array('items'=>$this->QueryAll($sql),'count'=>$count);
    }

    /**
     * 商品列表
     *
     * @param $select
     * @param $condition
     * @return string
     */
    public function items_sql($select,$condition)
    {
        $sql = "SELECT {$select}
        FROM car_b2c_goods g LEFT JOIN car_b2c_brand b ON g.brand_id = b.brand_id
        LEFT JOIN car_b2c_goods_cat a ON g.cat_id = a.cat_id LEFT JOIN car_b2c_goods_type t
        ON g.type_id = t.type_id";

        if ($condition) $sql .= " WHERE $condition";

        return $sql;
    }
}
