<?php

/**
 * This is the model class for table "{{b2c_goods_type_props_relation}}".
 *
 * The followings are the available columns in table '{{b2c_goods_type_props_relation}}':
 * @property integer $relation_id
 * @property integer $type_id
 * @property integer $props_id
 * @property string $last_modified
 */
class GoodsTypePropsRelation extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_goods_type_props_relation}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('type_id, props_id', 'required'),
			array('type_id, props_id', 'numerical', 'integerOnly'=>true),
			array('last_modified', 'length', 'max'=>10),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('relation_id, type_id, props_id, last_modified', 'safe', 'on'=>'search'),
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
			'relation_id' => 'Relation',
			'type_id' => 'Type',
			'props_id' => 'Props',
			'last_modified' => 'Last Modified',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('relation_id',$this->relation_id);
		$criteria->compare('type_id',$this->type_id);
		$criteria->compare('props_id',$this->props_id);
		$criteria->compare('last_modified',$this->last_modified,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return GoodsTypePropsRelation the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

    /**
     * 扩展属性更新
     *
     * @param int $type_id
     * @param $props_list
     * @return mixed
     */
    public function props_update($type_id=0,$props_list)
    {
        $type_props_list = self::model()->findAll('type_id = :type_id',array(':type_id'=>$type_id));

        $old_list = array();
        foreach ($type_props_list as $v) {
            $old_list[] = $v['props_id'];
        }

        $delete_id = array_diff($old_list,$props_list);
        $insert_id = array_diff($props_list,$old_list);

        $sql = '';
        $time = time();
        foreach ($delete_id as $v) {
            $sql .= "DELETE FROM {{b2c_goods_type_props_relation}} WHERE type_id = $type_id AND props_id = {$v};";
        }
        foreach ($insert_id as $v) {
            $sql .= "INSERT INTO {{b2c_goods_type_props_relation}} (type_id,props_id,last_modified) VALUES ({$type_id},{$v},{$time});";
        }

        return $sql?$this->Execute($sql):true;
    }
}
