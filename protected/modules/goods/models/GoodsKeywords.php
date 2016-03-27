<?php

/**
 * "b2c_goods_keywords" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class GoodsKeywords extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_goods_keywords}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('goods_id', 'length', 'max'=>20),
			array('keyword', 'length', 'max'=>40),
			array('refer', 'length', 'max'=>255),
			array('res_type', 'length', 'max'=>7),
			array('last_modify', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('goods_id, keyword, refer, res_type, last_modify', 'safe', 'on'=>'search'),
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
			'keyword' => 'Keyword',
			'refer' => 'Refer',
			'res_type' => 'Res Type',
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
     * 关键字合并
     * @param $goods_id
     * @return string
     */
    public function merge($goods_id)
    {
        $list = self::model()->findAll('goods_id = :goods_id',array(':goods_id'=>$goods_id));

        $item = array();
        foreach ($list as $v) {
            $item[] = $v->keyword;
        }
        return implode('|',$item);
    }
}
