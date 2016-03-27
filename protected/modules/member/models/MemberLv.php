<?php

/**
 * "b2c_member_lv" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class MemberLv extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_member_lv}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('pre_id, deposit_freeze_time, deposit, more_point, point, order_limit, experience, expiretime', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>100),
			array('lv_logo', 'length', 'max'=>255),
			array('dis_count, disabled, show_other_price', 'length', 'max'=>5),
			array('default_lv', 'length', 'max'=>1),
			array('lv_type', 'length', 'max'=>9),
			array('order_limit_price', 'length', 'max'=>20),
			array('lv_remark', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('member_lv_id, name, lv_logo, dis_count, pre_id, default_lv, deposit_freeze_time, deposit, more_point, lv_type, point, disabled, show_other_price, order_limit, order_limit_price, lv_remark, experience, expiretime', 'safe', 'on'=>'search'),
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
			'member_lv_id' => 'Member Lv',
			'name' => 'Name',
			'lv_logo' => 'Lv Logo',
			'dis_count' => 'Dis Count',
			'pre_id' => 'Pre',
			'default_lv' => 'Default Lv',
			'deposit_freeze_time' => 'Deposit Freeze Time',
			'deposit' => 'Deposit',
			'more_point' => 'More Point',
			'lv_type' => 'Lv Type',
			'point' => 'Point',
			'disabled' => 'Disabled',
			'show_other_price' => 'Show Other Price',
			'order_limit' => 'Order Limit',
			'order_limit_price' => 'Order Limit Price',
			'lv_remark' => 'Lv Remark',
			'experience' => 'Experience',
			'expiretime' => 'Expiretime',
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
     * @return mixed
     */
    public function MemberGoodsLvPrice($goods_id)
    {
        $sql = "SELECT l.name,l.dis_count,p.price FROM {{b2c_member_lv}} AS l LEFT JOIN {{b2c_goods_lv_price}} AS p"
        ." ON l.member_lv_id = p.level_id WHERE p.goods_id = $goods_id ";
        return $this->QueryAll($sql);
    }
}
