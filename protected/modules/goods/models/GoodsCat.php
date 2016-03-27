<?php

/**
 * "b2c_goods_cat" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class GoodsCat extends BaseModel
{
    public $type_name;
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_goods_cat}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('parent_id, type_id, p_order, goods_count, child_count', 'numerical', 'integerOnly'=>true),
			array('cat_path, cat_name', 'length', 'max'=>100),
			array('is_leaf, disabled', 'length', 'max'=>5),
			array('last_modify', 'length', 'max'=>10),
			array('gallery_setting, tabs, finder, addon', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('cat_id, parent_id, cat_path, is_leaf, type_id, cat_name, gallery_setting, disabled, p_order, goods_count, tabs, finder, addon, child_count, last_modify,img_url,image_default_id', 'safe', 'on'=>'search'),
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
			'cat_id' => 'Cat',
			'parent_id' => 'Parent',
			'cat_path' => 'Cat Path',
			'is_leaf' => 'Is Leaf',
			'type_id' => 'Type',
			'cat_name' => 'Cat Name',
			'gallery_setting' => 'Gallery Setting',
			'disabled' => 'Disabled',
			'p_order' => 'P Order',
			'goods_count' => 'Goods Count',
			'tabs' => 'Tabs',
			'finder' => 'Finder',
			'addon' => 'Addon',
			'child_count' => 'Child Count',
			'last_modify' => 'Last Modify',
            //add by wanglei
            'img_url' => 'Img_Url',
             'image_default_id'=>'Image_DefaultId',
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
     * 商品分类列表
     *
     * @param $pagesize
     * @param $pageIndex
     * @return array
     */
    public function CatList($pageIndex,$pagesize)
    {
        $criteria = new CDbCriteria();
        $criteria->select = '*,t2.name AS type_name';
        $criteria->join = 'left join {{b2c_goods_type}} t2 ON (t.type_id = t2.type_id)';
        $criteria->condition = "t.disabled = 'false'";
        $criteria->order = 'cat_path ASC';

        // 求总的记录数
        $count = GoodsCat::model()->count($criteria);
        $criteria->limit = $pagesize;
        $criteria->offset = ($pageIndex - 1) * $pagesize;

        $list = GoodsCat::model()->findAll($criteria);

        $item = array();
        foreach ($list as $v) {
            $str_count = substr_count($v['cat_path'],',');
            $cat_path_arr = explode(',',$v['cat_path']);
            $row['cat_id'] = $v['cat_id'];
            $row['cat_name'] = $v['cat_name'];
            $row['path'] = $str_count;
            $row['p_order'] = $v['p_order'];
            $row['img_url'] = $v['img_url'];
            $row['type_name'] = $v['type_name'];

            if ($str_count == 1) $item[$v['cat_id']][$v['cat_id']] = $row;
            elseif ($str_count == 2) $item[$v['parent_id']][$v['cat_id']] = $row;
            elseif ($str_count == 3) $item[$cat_path_arr[1]][$cat_path_arr[2]]['child'][] = $row;
        }

        $items = array();
        foreach ($item as $v) {
            foreach ($v as $vv) {
                $items[] = $vv;
                if (isset($vv['child']) && $vv['child']) {
                    foreach ($vv['child'] as $vvv) {
                        $items[] = $vvv;
                    }
                }
            }
        }

        return array('item'=>$items,'count'=>$count);
    }

    /**
     * 分类筛选
     * @param $cat_id
     * @param int $default
     * @return array
     */
    public function CatSelect($cat_id,$default = 0)
    {
        $cat_selected = self::model()->find('cat_id = :cat_id',array(':cat_id'=>$cat_id));

        if (empty($cat_selected)) {
            $items = $this->CatSelected(0,0);
            $item['one'] = $items['item'];
            return array('item'=>$item,'active'=>array());
        }

        $path = explode(',',trim($cat_selected->cat_path,','));
        $count = substr_count($cat_selected->cat_path,',');
        $item = array();
        $active = array();
        if ($default == 0) {
            $selected1 = $this->CatSelected($path[0],0);
            if ($count == 1) {
                $selected2 = $this->CatSelected(0,$cat_id);
            }
            else if ($count == 2) {
                $selected2 = $this->CatSelected($cat_id,$path[0]);
                $selected3 = $this->CatSelected($path[0],0);
            }
            else{
                $selected2 = $this->CatSelected($path[1],$path[0]);
                $selected3 = $this->CatSelected($cat_id,$cat_selected->parent_id);
            }
            $item['one'] = isset($selected1['item'])?$selected1['item']:'';
            $item['two'] = isset($selected2['item'])?$selected2['item']:'';
            $item['three'] = isset($selected3['item'])?$selected3['item']:'';

            $active['one'] = isset($selected1['active'])?$selected1['active']:'';
            $active['two'] = isset($selected2['active'])?$selected2['active']:'';
            $active['three'] = isset($selected3['active'])?$selected3['active']:'';
        }
        else if ($default == 1) {
            $selected2 = $this->CatSelected(0,$cat_id);
            $item['two'] = isset($selected2['item'])?$selected2['item']:'';
            $active['two'] = isset($selected2['active'])?$selected2['active']:'';
        }
        else if ($default == 2) {
            $selected3 = $this->CatSelected(0,$cat_id);
            $item['three'] = isset($selected3['item'])?$selected3['item']:'';
            $active['three'] = isset($selected3['active'])?$selected3['active']:'';
        }

        return array('item'=>$item,'active'=>$active);
    }

    /**
     * 分类筛选公共方法
     * @param $cat_id
     * @param $parent_id
     * @return array
     */
    public function CatSelected($cat_id,$parent_id)
    {
        $cat_list = self::model()->findAll(
            'parent_id = :parent_id AND disabled = :disabled',
            array(':parent_id'=>$parent_id,':disabled'=>'false')
        );

        $item = array();
        $active = array();
        foreach ($cat_list as $k=>$v) {
            $item[$k]['li-cat_id'] = $v->cat_id;
            $item[$k]['label'] = $v->cat_name;
            $item[$k]['url'] = '#';
            if ($cat_id == $v->cat_id) {
                $item[$k]['active'] = true;
                $active['name'] = $v['cat_name'];
                $active['cat_id'] = $v['cat_id'];
            }
        }

        return array('item'=>$item,'active'=>$active);
    }
}
