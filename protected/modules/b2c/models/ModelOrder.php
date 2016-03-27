<?php
/**
 * 订单处理模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       yiishop.model
 * @license       http://www.yiitian.com/license
 * @version       v1.0.0
 */

class ModelOrder extends B2cModel
{
    /**
     * 查询订单列表
     * @param string $select
     * @param $condition
     * @param int $is_page
     * @param int $start
     * @param int $limit
     * @return mixed
     */
    public function items($select="*",$condition='',$is_page=0,$start=0,$limit=10)
    {
        $sql = "SELECT {$select} FROM {{b2c_orders}}";
        if ($condition) $sql .= ' WHERE '.$condition;
        $sql .= " ORDER BY createtime DESC";
        if ($is_page) $sql .= " LIMIT {$start},{$limit}";
        return $this->ModelQueryAll($sql);
    }

    /**
     * 订单确认
     *
     * @param $member_id
     * @return array
     */
    public function Confirm($member_id)
    {
        header("Pragma:no-cache");
        header("Cache-Control:no-cache,must-revalidate,no-store");
        header("Expires:-1");
        $order_info = Yii::app()->cache->get('b2c-cart-product-set-'.$member_id);
        if ($order_info) return $order_info;

        $Cart = new ModelCart();
        $Product = new ModelProduct();
        $Addr = new ModelAddr();

        $cart_list = $Cart->Rows($member_id);
        $cart_list_new = $Product->CartGoods($cart_list);

        $item = $cart_list_new['item'];
        $num = $Cart->CartProductSum($member_id);
        $amount = $Cart->CartProductAmount($member_id);

        //收货地址
        $addr_row = $Addr->AddrOrderDefault($member_id);

        return array('item'=>$item,'num'=>$num,'amount'=>$amount,'addr_row'=>$addr_row);
    }

    /**
     * 配送方式
     */
    public function DlyType()
    {
        $dly_sql = "SELECT dt_id,dt_name,firstprice,detail FROM {{b2c_dlytype}} WHERE dt_status = '1' AND disabled = 'false'";
        $dly_list = $this->ModelQueryAll($dly_sql);

        return $dly_list;
    }

    /**
     * 配送方式设置
     *
     * @param $member_id
     * @param $dt_id
     * @return array
     */
    public function DlyTypeSet($member_id,$dt_id)
    {
        $dly_sql = "SELECT dt_id,dt_name,firstprice FROM {{b2c_dlytype}} WHERE dt_id = $dt_id and disabled = 'false'";
        $dly_row = $this->ModelQueryRow($dly_sql);

        $order_info = Yii::app()->cache->get('b2c-cart-product-set-'.$member_id);
//        var_dump($order_info);
        $order_info['dly'] = $dly_row;
        $order_info['total'] = sprintf('%01.2f',$order_info['amount'] + $dly_row['firstprice']);

        $result = Yii::app()->cache->set('b2c-cart-product-set-'.$member_id,$order_info,$this->cart_expire);
//        var_dump( Yii::app()->cache->get('b2c-cart-product-set-'.$member_id));die();
        if (!$result) return false;
        return true;
    }



    /**
     * 支付方式列表
     *
     * @return array
     */
    public function PaymentList()
    {
        $payment_sql = "SELECT * FROM {{base_setting}} WHERE app = 'ectools'";
        $payment_list = $this->ModelQueryAll($payment_sql);

        $item_list = array();
        foreach ($payment_list as $v) {
            $value = unserialize(unserialize($v['value']));
            $keyArr = explode('_',$v['key']);
            $item = array();
            if ($value['status'] == 'true' && $value['pay_type'] == 'true') {
                $item['pay_name'] = $value['setting']['pay_name'];

                $item['pay_app_id'] = $keyArr[3];
            }
            if (!empty($item)){
                $item_list[] = $item;
            }
        }
        return $item_list;
    }

    /**
     * 支付方式写入
     *
     * @param $member_id
     * @param $payment
     * @return array
     */
    public function PaymentSet($member_id,$payment)
    {
        $order_info = Yii::app()->cache->get('b2c-cart-product-set-'.$member_id);

        $order_info['payment'] = $payment;

        $result = Yii::app()->cache->set('b2c-cart-product-set-'.$member_id,$order_info,$this->cart_expire);

        if (!$result) return false;
        var_dump(Yii::app()->cache->get('b2c-cart-product-set-'.$member_id));
        return true;
    }

    /**
     * 订单提交
     *
     * @param int $member_id
     * @return array
     */
    public function Create($member_id)
    {
        $cart = Yii::app()->cache->get('b2c-cart-product-set-'.$member_id);
        if (empty($cart)) return array('code'=>400,'msg'=>'购物车快饿瘪了');
        if (empty($cart['payment'])) return array('code'=>400,'msg'=>'请选择支付方式');
        if (empty($cart['addr'])) return array('code'=>400,'msg'=>'请选择收货地址');

        $dt_id =intval($cart['dly']['dt_id']);
        if (empty($dt_id))return array('code'=>400,'msg'=>'请选择配送方式');

        //配送方式
        $dly_sql = "SELECT dt_id,dt_name,firstprice FROM {{b2c_dlytype}} WHERE dt_id =".$dt_id;
        $dly_row = $this->ModelQueryRow($dly_sql);
        $cart['dly'] = $dly_row;
        //加上快递费
//        $dly_row['firstprice']=0.00;
        $cart['total'] = sprintf('%01.2f',$cart['amount'] + $dly_row['firstprice']);
        $cart['use_point'] = isset($cart['use_point'] )?$cart['use_point']:0;
        //订单信息
        $order_id = $this->build_order_no();    //生成订单号
        $order_info = array(
            'member_id'=>$member_id,
            'cost_item'=>$cart['amount'],
            'total'=>$cart['total'],
            'addr'=>$cart['addr'],
            'itemnum'=>$cart['quantity_sum'],
            'payment'=>$cart['payment'],
            'shipping_id'=>$cart['dly']['dt_id'],
            'shipping'=>$cart['dly']['dt_name'],
            'ship_addr'=>$cart['addr'],
            'cost_freight'=>$cart['dly']['firstprice'],
            'score_u'=>$cart['use_point'],
        );
        foreach($cart['cart_list'] as $v){
            $order_info['tostr'][] =  $v['product_name']."  ".number_format($v['price'],2).'*'.$v['quantity'];
        }

        $order_info['tostr'] =implode($order_info['tostr'],'||');

        $orderParams = $this->OrderParams($order_id,$order_info);
        //订单商品信息
        $order_item = $this->ItemParams($order_id,$cart['cart_list']);

        //订单日志信息
        $order_log = $this->LogParams($order_id,$cart['addr']);

        $transaction=Yii::app()->db->beginTransaction();
        try {
            //订单表 b2c_order
            $this->ModelInsert('{{b2c_orders}}',$orderParams);

            //订单明细表 b2c_order_items
            foreach ($order_item as $v) {
                $this->ModelInsert('{{b2c_order_objects}}',$v['object']);
                $v['item']['obj_id'] = Yii::app()->db->getLastInsertID();
                $this->ModelInsert('{{b2c_order_items}}',$v['item']);
            }
            //订单与商品促销规则的关联表 b2c_order_pmt

            //订单日志表 b2c_order_log
            $this->ModelInsert('{{b2c_order_log}}',$order_log);

            //订单冻结库存
            $freeze_flag = $this->orderFreeze($cart['cart_list']);

            if($freeze_flag!==true){
                $transaction->rollback();
                return array('code'=>400,'msg'=>$freeze_flag['name'].'库存不足');
            }

            //清除购物车
           $this->ModelExecute($this->DelCart($member_id,$cart['cart_list']));

            if (!$this->Sync($member_id)) {
                $transaction->rollBack();
                return array('code'=>400,'msg'=>'购物车缓存清空失败');
            }
            $transaction->commit();
            return array('code'=>200,'order_id'=>$order_id,'final_amount'=>$orderParams['final_amount']);
        } catch(Exception $e) {
            $transaction->rollBack();
            return array('code'=>400,'msg'=>'生成订单失败');
        }
    }

    /**
     * 冻结库存
     * @param $cart_list
     * @return bool
     */
    public function orderFreeze($cart_list){

        foreach($cart_list as $k=>$v){
            $sql =" select * from {{b2c_products}}  where product_id=".intval($v['product_id']);
            $product_info = $this->ModelQueryRow($sql);
            if(($product_info['freez']+$v['quantity'])>$product_info['store']) return $v;
            $sql = "update {{b2c_products}} set freez=freez+".intval($v['quantity'])." where product_id=".intval($v['product_id']);
            if(!$this->ModelExecute($sql)) return $v;
        }

        return true;
    }

    /**
     * 订单表提交数据
     *
     * @param $order_id
     * @param $order_info
     * @return array
     */
    public function OrderParams($order_id,$order_info)
    {
        $params = array(
            'order_id'=>$order_id,
            'total_amount'=>$order_info['total'],
            'final_amount'=>$order_info['total']-$order_info['score_u']/100,
            'pay_status'=>0,
            'ship_status'=>0,
            'is_delivery'=>'Y',
            'createtime'=>time(),
            'last_modified'=>time(),
            'payment'=>$order_info['payment'],
            'shipping_id'=>$order_info['shipping_id'],
            'shipping'=>$order_info['shipping'],
            'member_id'=>$order_info['member_id'],
            'status'=>'active',
            'confirm'=>'N',
            'ship_area'=>$order_info['addr']['def_area'],
            'ship_name'=>$order_info['addr']['name'],
            'weight'=>0,
            'tostr'=>$order_info['tostr'],
            'itemnum'=>$order_info['itemnum'],
            'ip'=>Yii::app()->request->userHostAddress,
            'ship_addr'=>$order_info['ship_addr']['area'].$order_info['ship_addr']['addr'],
            'ship_zip'=>$order_info['ship_addr']['zip'],
            'ship_tel'=>$order_info['ship_addr']['tel'],
            'ship_email'=>'',
            'ship_time'=>$order_info['ship_addr']['day'].','.$order_info['ship_addr']['time'],
            'ship_mobile'=>$order_info['addr']['mobile'],
            'cost_item'=>$order_info['cost_item'],
            'cost_tax'=>0,
            'is_protect'=>'false',
            'cost_protect'=>0,
            'cost_payment'=>0,
            'currency'=>'CNY',
            'cur_rate'=>1,
            'score_u'=>$order_info['score_u'],
            'score_g'=>0,
            'discount'=>0,
            'pmt_goods'=>0,
            'pmt_order'=>0,
            'payed'=>0,
            'memo'=>'',
            'disabled'=>'false',
            'mark_type'=>'b1',
            'cost_freight'=>$order_info['cost_freight'],
            'order_refer'=>'local',
            'source'=>'pc'
        );
        return $params;
    }

    /**
     * 订单商品表提交数据
     *
     * @param $order_id
     * @param $order_item
     * @return bool
     */
    public function ItemParams($order_id,$order_item)
    {
        $product_ids = Help::ArrayToString($order_item,'product_id');

        if (!$product_ids) return false;
        $Spec = new ModelSpec();
        $product_spec = $Spec->ProductSpec($product_ids);
        foreach ($order_item as $v) {
            $object = array(
                'order_id'=>$order_id,
                'obj_type'=>'goods',
                'obj_alias'=>'商品区块',
                'goods_id'=>$v['goods_id'],
                'bn'=>$v['bn'],
                'name'=>$v['name'],
                'price'=>$v['price'],
                'amount'=>0,
                'quantity'=>$v['quantity'],
                'weight'=>0,
                'score'=>0,
            );
            $params[$v['product_id']]['object'] = $object;
            $spec['product_attr'] = isset($product_spec[$v['product_id']])?$product_spec[$v['product_id']]:'';
            !empty( $spec['product_attr'])? $addon = serialize($spec):$addon='';


            $item = array(
                'order_id'=>$order_id,
                'obj_id'=>0,
                'product_id'=>$v['product_id'],
                'goods_id'=>$v['goods_id'],
                'type_id'=>$v['type_id'],
                'bn'=>$v['bn'],
                'name'=>$v['name'],
                'cost'=>$v['cost'],
                'price'=>$v['price'],
                'g_price'=>$v['price'],
                'amount'=>$v['price'] * $v['quantity'],
                'score'=>0,
                'weight'=>0,
                'nums'=>$v['quantity'],
                'sendnum'=>0,
                'addon'=>$addon,
                'item_type'=>'product',
            );
            $params[$v['product_id']]['item'] = $item;
        }

        return $params;
    }

    /**
     * 订单日志表提交数据
     *
     * @param $order_id
     * @param $order_log
     * @return array
     */
    public function LogParams($order_id,$order_log)
    {
        $param = array(
            'rel_id'=>$order_id,
            'op_id'=>$order_log['member_id'],
            'op_name'=>$order_log['name'],
            'alttime'=>time(),
            'bill_type'=>'order',
            'behavior'=>'creates',
            'result'=>'SUCCESS',
            'log_text'=>serialize(array(0=>array('txt_key'=>'订单创建成功！','data'=>array()))),
        );

        return $param;
    }

    /**
     * 删除已购买商品在购物车情况
     *
     * @param $member_id
     * @param $order_cart
     * @return string
     */
    public function DelCart($member_id,$order_cart)
    {
        foreach ($order_cart as $v) {
            $obj_ident[] = "'".'goods_'.$v['goods_id'].'_'.$v['product_id']."'";
        }
        $obj_idents = implode(',',$obj_ident);
        $sql = "DELETE FROM {{b2c_cart_objects}}
        WHERE obj_ident IN ({$obj_idents}) AND member_id = $member_id AND obj_type ='goods'";

        return $sql;
    }

    /**
     * 购物车同步及清空缓存
     *
     * @param $member_id
     * @return mixed
     */
    public function Sync($member_id)
    {
        return Yii::app()->cache->delete('b2c-cart-product-set-'.$member_id);
    }

    /**
     * 订单号生成
     */
    public function build_order_no()
    {
        return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
    }

    /**
     * 生成支付单号
     *
     * @return string
     */
    public function payment_no()
    {
        return time().substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
    }


    /**
     * 订单支付
     *
     * @param $order_id
     * @param string $buyer_email
     * @param string $payment_no
     * @param int $pay_status
     * @return array
     */
    public function OrderPayment($order_id,$buyer_email='',$payment_no='',$pay_status=1)
    {
        //订单信息
        $sql = "SELECT order_id,member_id,final_amount,member_id,payment,pay_status FROM {{b2c_orders}} WHERE order_id = $order_id";
        $order_row = $this->ModelQueryRow($sql);

        //订单状态已经操作过返回
        if ($order_row['pay_status'] == 1) return true;

        //会员信息
        $member_sql = "SELECT member_id,name FROM {{b2c_members}} WHERE member_id = {$order_row['member_id']}";
        $member_row = $this->ModelQueryRow($member_sql);

        $paymentName = array(
            'alipay'=>'支付宝',
        );
        $paymentNo = $this->payment_no();

        $order_product_list = $this->ModelQueryAll("SELECT product_id,goods_id,nums FROM {{b2c_order_items}} WHERE order_id = $order_id");

        $transaction = Yii::app()->db->beginTransaction();
        try {
            //订单支付状态更新
            $this->ModelEdit('{{b2c_orders}}',array('order_id'=>$order_id),array('pay_status'=>$pay_status,'score_g'=>ceil($order_row['final_amount'])));

            //商品库存变更
            $this->orderStoreMinus($order_product_list);

            //生成支付单
            $this->ModelInsert(
                '{{ectools_payments}}',
                array(
                    'payment_id'=>$paymentNo,
                    'money'=>$order_row['final_amount'],
                    'cur_money'=>$order_row['final_amount'],
                    'member_id'=>$order_row['member_id'],
                    'status'=>'succ',
                    'pay_name'=>$paymentName[$order_row['payment']],
                    'pay_type'=>'online',
                    't_payed'=>time(),
                    'op_id'=>$order_row['member_id'],
                    'payment_bn'=>$payment_no,
                    'account'=>'yiishop官方商城',
                    'bank'=>$paymentName[$order_row['payment']],
                    'pay_account'=>$buyer_email,
                    'currency'=>'CNY',
                    'paycost'=>'',
                    'pay_app_id'=>'1.0',
                    'ip'=>'',
                    't_begin'=>time(),
                    't_confirm'=>time(),
                    'memo'=>'PC支付',
                    'return_url'=>'',
                    'disabled'=>'false',
                    'trade_no'=>$order_id,
                    'thirdparty_account'=>'',
                )
            );
            //订单钱款单据
            $this->ModelInsert(
                '{{ectools_order_bills}}',
                array(
                    'rel_id'=>$order_id,
                    'bill_type'=>'payments',
                    'pay_object'=>'order',
                    'bill_id'=>$paymentNo,
                    'money'=>$order_row['final_amount']
                )
            );

            //订单支付日志
            $this->ModelInsert(
                '{{b2c_order_log}}',
                array(
                    'rel_id'=>$order_id,
                    'op_id'=>$order_row['member_id'],
                    'op_name'=>$member_row['name'],
                    'alttime'=>time(),
                    'bill_type'=>'order',
                    'behavior'=>'payments',
                    'result'=>'SUCCESS',
                    'log_text'=>serialize(
                        array(
                            array(
                                'txt_key'=>'订单已付款，订单号'.$order_id.'付款'.$order_row['final_amount'].'元',
                                'data'=>array(
                                    $order_id,$order_row['final_amount']
                                )
                            )
                        )
                    ),
                )
            );

            //花生经验值变化
            $this->MemberPoint($order_row['member_id'],$order_id,ceil($order_row['final_amount']));

            $transaction->commit();
            return array('code'=>200,'msg'=>'订单支付成功','order_id'=>$order_id,'total_amount'=>$order_row['final_amount']);
        } catch(Exception $e) {
            $transaction->rollback();
            return array('code'=>400,'msg'=>'订单支付失败');
        }
    }

    /**
     * 订单支付减去商品表  货品表库存
     * @param $order_product_list
     */
    public function orderStoreMinus($order_product_list){

        foreach ($order_product_list as $v) {

            //减去商品表库存
            $set_str = "store = store - {$v['nums']} , freez=freez-{$v['nums']}";
            $condition = "product_id = {$v['product_id']}";
            $this->ModelExecute("UPDATE {{b2c_products}} SET $set_str WHERE $condition");

            //减去货品表库存
            $set_str =" store = store-{$v['nums']}";
            $condition = "goods_id = {$v['goods_id']}";
            $this->ModelExecute("UPDATE {{b2c_goods}} SET $set_str WHERE $condition");
        }
    }

    /**
     * 取消解冻库存
     * @param array $order_product_list
     */
    public function orderFreezeCancel($order_product_list){
        foreach ($order_product_list as $v) {
            //减去商品表库存
            $set_str = " freez=freez-{$v['nums']}";
            $condition = "product_id = {$v['product_id']}";
            $this->ModelExecute("UPDATE {{b2c_products}} SET $set_str WHERE $condition");
        }
    }

    /**
     * 会员订单
     *
     * @param $member_id
     * @param int $start
     * @param int $pageSize
     * @param bool|string $status
     * @param bool|string $pay_status
     * @param bool|string $ship_status
     * @return mixed
     */
    public function OrderList($member_id,$start=0,$pageSize=15,$status='',$pay_status='false',$ship_status='false')
    {
        $condition = "member_id = $member_id";

        if ($status) $condition .= " AND status = '$status'";
        if ($pay_status != 'false') $condition .= " AND pay_status = '$pay_status'";
        if ($ship_status != 'false') $condition .= " AND ship_status = '$ship_status'";

        $list = $this->items('order_id,createtime,payment,total_amount,final_amount,status,pay_status,ship_status',$condition,1,$start,$pageSize);
        if (!$list) return false;

        foreach ($list as $v) $order_idArr[] = $v['order_id'];

        $order_product = $this->OrderProduct($order_idArr);
        foreach ($list as $k=>$v) {
            $list[$k]['createtime'] = date('Y-m-d H:i',$list[$k]['createtime']);
            $list[$k]['product'] = $order_product[$v['order_id']];

            $sql = "select sum(nums) as sum  from {{b2c_order_items}}  where order_id = '".$v['order_id']."'";
            $product_sum = $this->ModelQueryRow($sql);
            $list[$k]['product_sum'] = $product_sum['sum'];
            $list[$k]['total_amount'] =number_format($v['total_amount'],2,'.', '') ;
            $list[$k]['final_amount'] =number_format($v['final_amount'],2,'.', '') ;
        }
        return $list;
    }

    /**
     * 订单商品
     *
     * @param $order_idArr
     * @return array|bool|string
     */
    public function OrderProduct($order_idArr)
    {
        if (!$order_idArr) return '';
        $item_sql = "SELECT i.order_id,i.product_id,i.goods_id,i.bn,i.name,i.price,i.nums,i.addon,i.cost,p.mktprice
                        FROM {{b2c_order_items}} as i left join {{b2c_products}}
                        as p on p.product_id = i.product_id";
        if (is_array($order_idArr)) {
            $order_ids = implode(',',$order_idArr);
            $item_sql .= " WHERE order_id IN ({$order_ids})";
        } else $item_sql .= " WHERE order_id = {$order_idArr}";

        $items = $this->ModelQueryAll($item_sql);
        $itemsOrder = $goods_ids = $goods_image = array();
        foreach ($items as $k=>$v) {
            $goods_ids[] = $v['goods_id'];
            $items[$k]['price'] = number_format($v['price'],'2','.', '');
            $items[$k]['cost'] = number_format($v['cost'],'2','.', '');
            $items[$k]['mktprice'] = number_format($v['mktprice'],'2','.', '');
        }

        $itemProduct = Help::ArrayListByKey($items,'goods_id');
        if (!$goods_ids) return $itemsOrder;
        $goods_str = implode(',',$goods_ids);
        $Product = new ModelProduct();
        $goods_image = $Product->GoodsDefaultImage($goods_str);

        foreach ($goods_image as $k=>$v) {
            $itemProduct[$k]['image'] = $this->img_url.$v['s_url'];
        }

        foreach ($items as $v) {
            $item = $v;
            $item['image'] = isset($itemProduct[$v['goods_id']]['image'])?$itemProduct[$v['goods_id']]['image']:'';
            $itemsOrder[$v['order_id']][] = $item;
        }

        if (!is_array($order_idArr)) return $itemsOrder[$order_idArr];

        return $itemsOrder;
    }

    /**
     * 订单详情
     *
     * @param $order_id
     * @return mixed
     */
    public function orderDetail($order_id){
        $sql = "select order_id,createtime,total_amount,final_amount,status,ship_status,pay_status,payment,order_refer,ship_addr,
        ship_zip,ship_tel,ship_time,shipping,ship_mobile,ship_name,cost_item,cost_freight,is_tax,tax_type,tax_company,tax_content,source,
        score_u,score_g
        from {{b2c_orders}} where order_id = {$order_id}";
        return $this->ModelQueryRow($sql);
    }

    /**
     * 更改订单状态
     * @param $order_id
     * @param $member_id
     * @param $status
     * @return mixed
     */
    public function changeOrderStatus($order_id,$member_id,$status){
        $sql = " update {{b2c_orders}} set status = '".$status."' where order_id = '".$order_id."' and member_id = '".$member_id."' ";
        return $this->ModelExecute($sql);
    }
} 