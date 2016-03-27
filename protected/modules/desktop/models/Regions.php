<?php

/**
 * "ectools_regions" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 yiitian. All rights reserved.
 * @link          http://mall.yiitian.com
 * @package       mall.model
 * @license       http://www.yiitian.com/license
 * @version       v1.0.0
 */
class Regions extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{ectools_regions}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('region_grade, ordernum', 'numerical', 'integerOnly'=>true),
			array('local_name, p_1, p_2', 'length', 'max'=>50),
			array('package', 'length', 'max'=>20),
			array('p_region_id', 'length', 'max'=>10),
			array('region_path', 'length', 'max'=>255),
			array('disabled', 'length', 'max'=>5),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('region_id, local_name, package, p_region_id, region_path, region_grade, p_1, p_2, ordernum, disabled', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'region_id' => '区域序号',
			'local_name' => '地区名称',
			'package' => '地区包的类别, 中国/外国等. 中国大陆的编号目前为mainland',
			'p_region_id' => '上一级地区的序号',
			'region_path' => '序号层级排列结构',
			'region_grade' => '地区层级',
			'p_1' => '额外参数1',
			'p_2' => '额外参数2',
			'ordernum' => '排序',
			'disabled' => 'Disabled',
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
     * 返回地区列表
     *
     * @return mixed
     */
    public static function RegionsList()
    {
        $list = self::model()->findAll(array('order'=>'region_grade ASC,region_id ASC'));

        foreach ($list as $v) {
            $path = explode(',',trim($v->region_path,','));

            if ($v->region_grade == 1) {
                $item[$v->region_id]['region_id'] = $v->region_id;
                $item[$v->region_id]['local_name'] = $v->local_name;
            }
            if ($v->region_grade == 2) {
                $item[$path[0]]['child'][$path[1]]['region_id'] = $v->region_id;
                $item[$path[0]]['child'][$path[1]]['local_name'] = $v->local_name;
            }

            if ($v->region_grade == 3) {
                $item[$path[0]]['child'][$path[1]]['child'][$path[2]]['region_id'] = $v->region_id;
                $item[$path[0]]['child'][$path[1]]['child'][$path[2]]['local_name'] = $v->local_name;
            }

            unset($path);
        }

        return $item;
    }
    /**
     * 获取会员地区
     *
     * @param $region_id
     * @return array
     */
    public function getregion_id($area){
        $areaarray=explode(":",$area);
        $area_id=$areaarray[count($areaarray)-1];
        if(empty($area_id)){
            $area_id=0;
        }
        return $area_id;
       // $area_array=preg_match_all('/[0-9]/',$area);
        //exit;
    }
    /**
     * 获取会员地区
     *
     * @param $region_id
     * @return array
     */
    public static function RegionsChild($region_id)
    {
        $region_info = self::model()->find('region_id = :region_id',array(':region_id'=>$region_id));

        $list = self::RegionsList();

        foreach ($list as $k=>$v) {
            $region['region_id'] = $v['region_id'];
            $region['local_name'] = $v['local_name'];
            $province[$k] = $region;
        }

        $region = array();
        if ($region_info->region_grade == 1) {
            $region['province'] = $province;
            $region['city'] = $list[$region_id]['child'];
            $region['select']['province'] = $region_id;
        } else if ($region_info->region_grade == 2) {
            $region['province'] = $province;
            $region['city'] = $list[$region_info['p_region_id']]['child'];
            $region['down'] = $list[$region_info['p_region_id']]['child'][$region_id]['child'];
            $region['select']['province'] = $region_info['p_region_id'];
            $region['select']['province'] = $region_id;
        } else if ($region_info->region_grade == 3) {
            $path = explode(',',trim($region_info['region_path'],','));
            $region['province'] = $province;
            $region['city'] = $list[$path[0]]['child'];
            $region['down'] = $list[$path[0]]['child'][$path[1]]['child'];
            $region['select']['province'] = $path[0];
            $region['select']['city'] = $path[1];
            $region['select']['down'] = $region_id;
        } else {
            $region['province'] = $province;
            $region['select']['province'] = 0;
        }

        return $region;
    }
}
