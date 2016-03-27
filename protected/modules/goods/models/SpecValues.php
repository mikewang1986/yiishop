<?php

/**
 * This is the model class for table "{{b2c_spec_values}}".
 *
 * The followings are the available columns in table '{{b2c_spec_values}}':
 * @property integer $spec_value_id
 * @property integer $spec_id
 * @property string $spec_value
 * @property string $alias
 * @property string $spec_image
 * @property integer $p_order
 */
class SpecValues extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_spec_values}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('spec_id, p_order', 'numerical', 'integerOnly'=>true),
			array('spec_value', 'length', 'max'=>100),
			array('alias', 'length', 'max'=>255),
			array('spec_image', 'length', 'max'=>32),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('spec_value_id, spec_id, spec_value, alias, spec_image, p_order', 'safe', 'on'=>'search'),
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
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return SpecValues the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

    /**
     * 规格值新增
     *
     * @param $spec_id
     * @param $spec_value_attributes
     * @return mixed
     */
    public function SpecValuesAdd($spec_id,$spec_value_attributes)
    {
        if (!$spec_value_attributes) return true;
        $insert = array();
        foreach ($spec_value_attributes['spec_value'] as $k=>$v) {
            $item['spec_value_id'] = $spec_value_attributes['spec_value_id'][$k];
            $item['spec_value'] = $spec_value_attributes['spec_value'][$k];
            $item['alias'] = $spec_value_attributes['alias'][$k];
            $item['p_order'] = $k+1;

            $insert[] = $item;
        }

        $sql = '';
        foreach ($insert as $v) {
            $sql .= "INSERT INTO {{b2c_spec_values}} (spec_id,spec_value,alias,spec_image,p_order)
            VALUES ($spec_id,'{$v['spec_value']}','{$v['alias']}','',{$v['p_order']});";
        }

        return $this->Execute($sql);
    }

    /**
     * 规格值编辑
     *
     * @param $spec_id
     * @param $spec_value_attributes
     * @param $spec_value_list
     * @return mixed
     */
    public function SpecValuesEdit($spec_id,$spec_value_attributes,$spec_value_list)
    {
        $list_old = $list_new = $insert = array();
        $sql = '';
        foreach ($spec_value_list as $v) {
            $list_old[] = $v['spec_value_id'];
        }

        foreach ($spec_value_attributes['spec_value'] as $k=>$v) {
            $item['spec_value_id'] = $spec_value_attributes['spec_value_id'][$k];
            $item['spec_value'] = $spec_value_attributes['spec_value'][$k];
            $item['alias'] = $spec_value_attributes['alias'][$k];
            $item['p_order'] = $k+1;


            if ($item['spec_value_id']) $list[$spec_value_attributes['spec_value_id'][$k]] = $item;
            else $insert[] = $item;
        }


        foreach ($list as $v) {
            $list_new[] = $v['spec_value_id'];
            if ($v['spec_value_id'] && in_array($v['spec_value_id'],$list_old)) $update_id[] = $v['spec_value_id'];
        }

        $delete_id = array_diff($list_old,$list_new);

        foreach ($insert as $v) {
            $sql .= "INSERT INTO {{b2c_spec_values}} (spec_id,spec_value,alias,spec_image,p_order)
            VALUES ($spec_id,'{$v['spec_value']}','{$v['alias']}','',{$v['p_order']});";
        }

        foreach ($delete_id as $v) {
            $sql .= "DELETE FROM {{b2c_spec_values}} WHERE spec_value_id = {$v};";
        }

        foreach ($update_id as $v) {
            $item = $list[$v];
            $sql .= "UPDATE {{b2c_spec_values}} SET spec_value = '{$item['spec_value']}',alias = '{$item['alias']}',
            spec_image = '',p_order = {$item['p_order']} WHERE spec_value_id = {$v};";
        }

        return $this->Execute($sql);
    }
}
