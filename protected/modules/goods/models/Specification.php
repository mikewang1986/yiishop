<?php

/**
 * "car_b2c_specification" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Specification extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_specification}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('p_order', 'numerical', 'integerOnly'=>true),
			array('spec_name, spec_memo', 'length', 'max'=>50),
			array('spec_show_type', 'length', 'max'=>6),
			array('spec_type, disabled', 'length', 'max'=>5),
			array('alias', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('spec_id, spec_name, spec_show_type, spec_type, spec_memo, p_order, disabled, alias', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return B2cSpecification the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

    /**
     * 规格列表
     *
     * @param $pageIndex
     * @param $pagesize
     * @return array
     */
    public function SpecList($pageIndex,$pagesize)
    {
        $criteria = new CDbCriteria();
        $criteria->select = '*';
        $criteria->order = 'spec_id DESC';

        // 求总的记录数
        $count = self::model()->count($criteria);
        $criteria->limit = $pagesize;
        $criteria->offset = ($pageIndex - 1) * $pagesize;

        $list = self::model()->findAll($criteria);

        return array('item'=>$list,'count'=>$count);
    }

}
