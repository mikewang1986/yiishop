<?php

/**
 * This is the model class for table "{{b2c_cms_category}}".
 *
 * The followings are the available columns in table '{{b2c_cms_category}}':
 * @property integer $id
 * @property integer $parent_id
 * @property string $name
 * @property string $title
 * @property string $keywords
 * @property string $description
 * @property string $dir
 * @property string $model
 * @property string $thumb
 * @property string $content
 * @property integer $pagesize
 * @property integer $listorder
 * @property integer $create_time
 * @property string $update_time
 * @property string $disabled
 */
class CmsCategory extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_cms_category}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, model', 'required'),
			array('parent_id, pagesize, listorder, create_time', 'numerical', 'integerOnly'=>true),
			array('name, model', 'length', 'max'=>20),
			array('title, keywords, dir, thumb', 'length', 'max'=>100),
			array('description', 'length', 'max'=>255),
			array('update_time', 'length', 'max'=>10),
			array('disabled', 'length', 'max'=>5),
			array('content', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, parent_id, name, title, keywords, description, dir, model, thumb, content, pagesize, listorder, create_time, update_time, disabled', 'safe', 'on'=>'search'),
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
			'id' => 'ID',
			'parent_id' => 'Parent',
			'name' => 'Name',
			'title' => 'Title',
			'keywords' => 'Keywords',
			'description' => 'Description',
			'dir' => 'Dir',
			'model' => 'Model',
			'thumb' => 'Thumb',
			'content' => 'Content',
			'pagesize' => 'Pagesize',
			'listorder' => 'Listorder',
			'create_time' => 'Create Time',
			'update_time' => 'Update Time',
			'disabled' => 'Disabled',
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

		$criteria->compare('id',$this->id);
		$criteria->compare('parent_id',$this->parent_id);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('keywords',$this->keywords,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('dir',$this->dir,true);
		$criteria->compare('model',$this->model,true);
		$criteria->compare('thumb',$this->thumb,true);
		$criteria->compare('content',$this->content,true);
		$criteria->compare('pagesize',$this->pagesize);
		$criteria->compare('listorder',$this->listorder);
		$criteria->compare('create_time',$this->create_time);
		$criteria->compare('update_time',$this->update_time,true);
		$criteria->compare('disabled',$this->disabled,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CmsCategory the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

    /**
     * 栏目列表
     *
     * @return array
     */
    public function CategoryList()
    {
        $criteria = new CDbCriteria();
        $criteria->condition = "t.disabled = 'false'";
        $criteria->order = 'parent_id ASC';

        $list = $this->QueryAll("SELECT * FROM {{b2c_cms_category}} WHERE disabled = 'false' ORDER BY parent_id ASC");
        $items = array();
        foreach ($list as $v) {
            if ($v['parent_id'] == 0) $items[$v['id']] = $v;
            else {
                $items[$v['parent_id']]['child'][$v['id']] = $v;
            }
        }

        return $items;
    }
}
