<?php

/**
 * This is the model class for table "{{b2c_cms_article}}".
 *
 * The followings are the available columns in table '{{b2c_cms_article}}':
 * @property string $id
 * @property integer $category
 * @property string $title
 * @property string $uid
 * @property string $keywords
 * @property string $description
 * @property string $content
 * @property string $copyfrom
 * @property string $fromlink
 * @property string $thumb
 * @property string $color
 * @property integer $isbold
 * @property string $tags
 * @property string $recommends
 * @property string $hits
 * @property string $realhits
 * @property string $createtime
 * @property string $updatetime
 * @property string $puttime
 * @property string $tpl
 * @property string $listorder
 * @property string $disabled
 */
class CmsArticle extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_cms_article}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('title', 'required'),
			array('category, isbold', 'numerical', 'integerOnly'=>true),
			array('title, keywords', 'length', 'max'=>120),
			array('uid, hits, realhits, createtime, updatetime, puttime, listorder', 'length', 'max'=>10),
			array('copyfrom, thumb', 'length', 'max'=>100),
			array('fromlink', 'length', 'max'=>200),
			array('color', 'length', 'max'=>7),
			array('tags', 'length', 'max'=>255),
			array('recommends', 'length', 'max'=>30),
			array('tpl', 'length', 'max'=>20),
			array('disabled', 'length', 'max'=>5),
			array('description, content', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, category, title, uid, keywords, description, content, copyfrom, fromlink, thumb, color, isbold, tags, recommends, hits, realhits, createtime, updatetime, puttime, tpl, listorder, disabled', 'safe', 'on'=>'search'),
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
			'category' => 'Category',
			'title' => 'Title',
			'uid' => 'Uid',
			'keywords' => 'Keywords',
			'description' => 'Description',
			'content' => 'Content',
			'copyfrom' => 'Copyfrom',
			'fromlink' => 'Fromlink',
			'thumb' => 'Thumb',
			'color' => 'Color',
			'isbold' => 'Isbold',
			'tags' => 'Tags',
			'recommends' => 'Recommends',
			'hits' => 'Hits',
			'realhits' => 'Realhits',
			'createtime' => 'Createtime',
			'updatetime' => 'Updatetime',
			'puttime' => 'Puttime',
			'tpl' => 'Tpl',
			'listorder' => 'Listorder',
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

		$criteria->compare('id',$this->id,true);
		$criteria->compare('category',$this->category);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('uid',$this->uid,true);
		$criteria->compare('keywords',$this->keywords,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('content',$this->content,true);
		$criteria->compare('copyfrom',$this->copyfrom,true);
		$criteria->compare('fromlink',$this->fromlink,true);
		$criteria->compare('thumb',$this->thumb,true);
		$criteria->compare('color',$this->color,true);
		$criteria->compare('isbold',$this->isbold);
		$criteria->compare('tags',$this->tags,true);
		$criteria->compare('recommends',$this->recommends,true);
		$criteria->compare('hits',$this->hits,true);
		$criteria->compare('realhits',$this->realhits,true);
		$criteria->compare('createtime',$this->createtime,true);
		$criteria->compare('updatetime',$this->updatetime,true);
		$criteria->compare('puttime',$this->puttime,true);
		$criteria->compare('tpl',$this->tpl,true);
		$criteria->compare('listorder',$this->listorder,true);
		$criteria->compare('disabled',$this->disabled,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CmsArticle the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
