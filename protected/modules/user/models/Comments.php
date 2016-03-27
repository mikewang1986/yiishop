<?php

/**
 * "b2c_member_comments" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Comments extends BaseModel
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{b2c_member_comments}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('for_comment_id, product_id, author_id, to_id, p_index', 'numerical', 'integerOnly'=>true),
			array('type_id, order_id', 'length', 'max'=>20),
			array('object_type', 'length', 'max'=>7),
			array('author, reply_name, to_uname', 'length', 'max'=>100),
			array('contact, title', 'length', 'max'=>255),
			array('mem_read_status, adm_read_status, inbox, track, has_sent, display, disabled', 'length', 'max'=>5),
			array('time, lastreply', 'length', 'max'=>10),
			array('ip', 'length', 'max'=>15),
			array('gask_type', 'length', 'max'=>50),
			array('comment, addon', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('comment_id, for_comment_id, type_id, product_id, order_id, object_type, author_id, author, contact, mem_read_status, adm_read_status, time, lastreply, reply_name, inbox, track, has_sent, to_id, to_uname, title, comment, ip, display, gask_type, addon, p_index, disabled', 'safe', 'on'=>'search'),
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
			'comment_id' => '评论ID',
			'for_comment_id' => '对m的回复',
			'type_id' => '名称',
			'product_id' => '货品ID',
			'order_id' => '订单编号',
			'object_type' => '类型',
			'author_id' => '作者ID',
			'author' => '发表人',
			'contact' => '联系方式',
			'mem_read_status' => '会员阅读标识',
			'adm_read_status' => '管理员阅读标识',
			'time' => '时间',
			'lastreply' => '最后回复时间',
			'reply_name' => '最后回复人',
			'inbox' => '收件箱',
			'track' => '发件箱',
			'has_sent' => '是否发送',
			'to_id' => '目标会员序号ID',
			'to_uname' => '目标会员姓名',
			'title' => '标题',
			'comment' => '内容',
			'ip' => 'ip地址',
			'display' => '前台是否显示',
			'gask_type' => '留言类型 针对订单留言',
			'addon' => '序列化',
			'p_index' => '弃用',
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
}
