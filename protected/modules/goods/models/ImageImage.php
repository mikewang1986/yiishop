<?php

/**
 * "car_image_image" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class ImageImage extends BaseModel
{
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{image_image}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('image_id, ident, url', 'required'),
			array('width, height', 'numerical', 'integerOnly'=>true),
			array('image_id', 'length', 'max'=>32),
			array('storage, image_name', 'length', 'max'=>50),
			array('ident, url, l_ident, l_url, m_ident, m_url, s_ident, s_url', 'length', 'max'=>200),
			array('watermark', 'length', 'max'=>5),
			array('last_modified', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('image_id, storage, image_name, ident, url, l_ident, l_url, m_ident, m_url, s_ident, s_url, width, height, watermark, last_modified', 'safe', 'on'=>'search'),
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
			'image_id' => 'Image',
			'storage' => 'Storage',
			'image_name' => 'Image Name',
			'ident' => 'Ident',
			'url' => 'Url',
			'l_ident' => 'L Ident',
			'l_url' => 'L Url',
			'm_ident' => 'M Ident',
			'm_url' => 'M Url',
			's_ident' => 'S Ident',
			's_url' => 'S Url',
			'width' => 'Width',
			'height' => 'Height',
			'watermark' => 'Watermark',
			'last_modified' => 'Last Modified',
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
     * 根据ImageID获取图片信息
     *
     * @param $image_id
     * @return mixed
     */
    public function ImageUrl($image_id)
    {
        $row = self::model()->find('image_id = :image_id',array(':image_id'=>$image_id));

        return $row;
    }

    /**
     * 获取商品图片
     *
     * @param $goods_id
     * @return mixed
     */
    public function goods_image($goods_id)
    {
        $attach = ImageImageAttach::model()->findAll('target_id = :target_id',array(':target_id'=>$goods_id));

        $image_id = array();
        foreach ($attach as $v) {
            $image_id[] = "'".$v->image_id."'";
        }
        $image_ids = implode(',',$image_id);

        $image = array();
        if (!empty($image_ids))
            $image = ImageImage::model()->findAll('image_id IN ('.$image_ids.')');

        return $image;
    }

    /**
     * 新增图片
     *
     * @param $images
     * @param $image_attach
     * @param $image_ids
     * @param int $goods_id
     * @return bool|mixed
     */
    public function imageList($images,$image_attach,$image_ids,$goods_id=0)
    {
        $flods = 'images';
        $sql = '';
        $time = time();
        $insert_data = $insert_attach_data = array();
        if ($images) {
            foreach ($images as $k=>$v) {
                if (isset($image_attach[$k])) continue;
                $larger = Image::prep_filename($v,'_l');
                $middle = Image::prep_filename($v,'_m');
                $small = Image::prep_filename($v,'_s');

                $image_id = $image_ids[$k];

                $insert_data[] = "('{$image_id}','{$v}','{$flods}/{$v}','{$larger}','{$flods}/{$larger}','{$middle}','{$flods}/{$middle}',
                '{$small}','{$flods}/{$small}',{$time})";
                $insert_attach_data[] = "({$goods_id},'goods','{$image_id}',{$time})";
            }
            if ($insert_data) {
                $sql .= 'INSERT INTO {{image_image_attach}} (target_id,target_type,image_id,last_modified) VALUES '.implode(',',$insert_attach_data).';';
                $sql .= 'INSERT INTO {{image_image}} (image_id,ident,url,l_ident,l_url,m_ident,m_url,s_ident,s_url,last_modified) VALUES '.implode(',',$insert_data).';';
            }
        }

        if ($image_attach) {
            foreach ($image_attach as $k=>$v) {
                if (isset($images[$k])) continue;
                $sql .= "DELETE FROM {{image_image_attach}} WHERE image_id = '{$v}';";
                $sql .= "DELETE FROM {{image_image}} WHERE image_id = '{$v};'";
            }
        }

        return $sql?$this->Execute($sql):true;
    }

    /**
     * 新增分类图片
     *
     * @param $images
     * @param $image_attach
     * @param $image_ids
     * @param int $goods_id
     * @return bool|mixed
     */
    public function imagecatList($images,$image_attach,$image_ids,$cat_id=0,$type="")
    {
        $flods = 'images';
        $sql = '';
        $time = time();
        $insert_data = $insert_attach_data = array();
        if ($images) {
            foreach ($images as $k=>$v) {
                if (isset($image_attach[$k])) continue;
                $larger = Image::prep_filename($v,'_l');
                $middle = Image::prep_filename($v,'_m');
                $small = Image::prep_filename($v,'_s');

                $image_id = $image_ids[$k];

                $insert_data[] = "('{$image_id}','{$v}','{$flods}/{$v}','{$larger}','{$flods}/{$larger}','{$middle}','{$flods}/{$middle}',
                '{$small}','{$flods}/{$small}',{$time})";
                $insert_attach_data[] = "({$cat_id},'{$type}','{$image_id}',{$time})";
            }
            if ($insert_data) {
                $sql .= 'INSERT INTO {{image_image_attach}} (target_id,target_type,image_id,last_modified) VALUES '.implode(',',$insert_attach_data).';';
                $sql .= 'INSERT INTO {{image_image}} (image_id,ident,url,l_ident,l_url,m_ident,m_url,s_ident,s_url,last_modified) VALUES '.implode(',',$insert_data).';';
            }
        }

        if ($image_attach) {
            foreach ($image_attach as $k=>$v) {
                if (isset($images[$k])) continue;
                $sql .= "DELETE FROM {{image_image_attach}} WHERE image_id = '{$v}';";
                $sql .= "DELETE FROM {{image_image}} WHERE image_id = '{$v};'";
            }
        }

        return $sql?$this->Execute($sql):true;
    }
    //获取分类图片信息
    public function goods_cat_image($cat_id)
    {
        $attach = ImageImageAttach::model()->findAll('target_id = :target_id and target_type=:target_type',array(':target_id'=>$cat_id,':target_type'=>'goods_cat'));
        $image_id = array();
        foreach ($attach as $v) {
            $image_id[] = "'".$v->image_id."'";
        }
        $image_ids = implode(',',$image_id);
        $image = array();
        if (!empty($image_ids))
            $image = ImageImage::model()->findAll('image_id IN ('.$image_ids.')');

        return $image;
    }
}
