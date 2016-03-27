<?php

/**
 * "car_b2c_orders" 数据表模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://shop.feipin0512.com
 * @package       yiishop.model
 * @license       http://www.shop.feipin0512.com/license
 * @version       v1.0.0
 */
class Orders extends BaseModel
{
    public $pay_status_name;
    public $ship_status_name;
    public $member_name;
    /**
     * @return string 相关的数据库表的名称
     */
	public function tableName()
	{
		return '{{b2c_orders}}';
	}

    /**
     * @return string 相关的数据库表的名称
     */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('shipping_id, member_id, itemnum', 'numerical', 'integerOnly'=>true),
			array('order_id, total_amount, final_amount, weight, ship_zip, cost_item, cost_tax, cost_protect, cost_payment, score_u, score_g, discount, pmt_goods, pmt_order, payed, cost_freight, order_refer', 'length', 'max'=>20),
			array('pay_status, ship_status, is_delivery, confirm', 'length', 'max'=>1),
			array('createtime, last_modified, cur_rate', 'length', 'max'=>10),
			array('payment, shipping', 'length', 'max'=>100),
			array('status, source', 'length', 'max'=>6),
			array('ship_area, tax_content, tax_company, extend', 'length', 'max'=>255),
			array('ship_name, ship_tel, ship_time, ship_mobile', 'length', 'max'=>50),
			array('ip', 'length', 'max'=>15),
			array('ship_email', 'length', 'max'=>200),
			array('is_tax, is_protect, disabled', 'length', 'max'=>5),
			array('tax_type, currency', 'length', 'max'=>8),
			array('mark_type', 'length', 'max'=>2),
			array('tostr, ship_addr, memo, mark_text, addon', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('order_id, total_amount, final_amount, pay_status, ship_status, is_delivery, createtime, last_modified, payment, shipping_id, shipping, member_id, status, confirm, ship_area, ship_name, weight, tostr, itemnum, ip, ship_addr, ship_zip, ship_tel, ship_email, ship_time, ship_mobile, cost_item, is_tax, tax_type, tax_content, cost_tax, tax_company, is_protect, cost_protect, cost_payment, currency, cur_rate, score_u, score_g, discount, pmt_goods, pmt_order, payed, memo, disabled, mark_type, mark_text, cost_freight, extend, order_refer, addon, source', 'safe', 'on'=>'search'),
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
			'order_id' => 'Order',
			'total_amount' => 'Total Amount',
			'final_amount' => 'Final Amount',
			'pay_status' => 'Pay Status',
			'ship_status' => 'Ship Status',
			'is_delivery' => 'Is Delivery',
			'createtime' => 'Createtime',
			'last_modified' => 'Last Modified',
			'payment' => 'Payment',
			'shipping_id' => 'Shipping',
			'shipping' => 'Shipping',
			'member_id' => 'Member',
			'status' => 'Status',
			'confirm' => 'Confirm',
			'ship_area' => 'Ship Area',
			'ship_name' => 'Ship Name',
			'weight' => 'Weight',
			'tostr' => 'Tostr',
			'itemnum' => 'Itemnum',
			'ip' => 'Ip',
			'ship_addr' => 'Ship Addr',
			'ship_zip' => 'Ship Zip',
			'ship_tel' => 'Ship Tel',
			'ship_email' => 'Ship Email',
			'ship_time' => 'Ship Time',
			'ship_mobile' => 'Ship Mobile',
			'cost_item' => 'Cost Item',
			'is_tax' => 'Is Tax',
			'tax_type' => 'Tax Type',
			'tax_content' => 'Tax Content',
			'cost_tax' => 'Cost Tax',
			'tax_company' => 'Tax Company',
			'is_protect' => 'Is Protect',
			'cost_protect' => 'Cost Protect',
			'cost_payment' => 'Cost Payment',
			'currency' => 'Currency',
			'cur_rate' => 'Cur Rate',
			'score_u' => 'Score U',
			'score_g' => 'Score G',
			'discount' => 'Discount',
			'pmt_goods' => 'Pmt Goods',
			'pmt_order' => 'Pmt Order',
			'payed' => 'Payed',
			'memo' => 'Memo',
			'disabled' => 'Disabled',
			'mark_type' => 'Mark Type',
			'mark_text' => 'Mark Text',
			'cost_freight' => 'Cost Freight',
			'extend' => 'Extend',
			'order_refer' => 'Order Refer',
			'addon' => 'Addon',
			'source' => 'Source',
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
     * 订单记录
     *
     * @param $order_id
     * @return mixed
     */
    public function Item($order_id)
    {
        return $this->QueryRow("SELECT * FROM {{b2c_orders}} WHERE order_id = {$order_id}");
    }

    /**
     * 根据条件获取订单列表
     *
     * @param $data
     * @param $pageIndex
     * @param $pageSize
     * @return mixed
     */
    public function orderList($data,$pageIndex,$pageSize)
    {
        $condition = '';
        if (!empty($data)) {
            foreach ($data as $k=>$v) {
                $conditionArr[] = "$k = '$v'";
            }
            $condition = implode(' AND ',$conditionArr);
        }

        $select = '*';
        $sql = $this->items_sql($select,$condition);
        $start = ($pageIndex - 1)*$pageSize;
        $count = $this->RowCount($this->items_sql('count(*)',$condition));

        $sql .= " ORDER BY createtime DESC LIMIT {$start},{$pageSize}";

        return array('items'=>$this->QueryAll($sql),'count'=>$count);
    }

    /**
     * 商品列表
     *
     * @param $select
     * @param $condition
     * @return string
     */
    public function items_sql($select,$condition)
    {
        $sql = "SELECT {$select} FROM {{b2c_orders}}";

        if ($condition) $sql .= " WHERE $condition";

        return $sql;
    }
}
