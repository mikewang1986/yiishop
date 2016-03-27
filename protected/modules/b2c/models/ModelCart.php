<?php
/**
 * 购物车处理模型类.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       yiishop.model
 * @license       http://www.yiitian.com/license
 * @version       v1.0.0
 */
class ModelCart extends B2cModel
{
    /**
     * 购物车商品详情
     *
     * @param $product_id
     * @param $goods_id
     * @param $member_id
     * @return mixed
     */
    public function Row($product_id,$goods_id,$member_id)
    {
        $obj_ident = 'goods_'.$goods_id.'_'.$product_id;

        $cart_sql = "SELECT quantity,obj_ident FROM {{b2c_cart_objects}}
        WHERE obj_ident = '{$obj_ident}' AND member_id = $member_id AND obj_type='goods'";

        return $this->ModelQueryRow($cart_sql);
    }

    /**
     * 购物车商品列表
     *
     * @param $member_id
     * @param string $select
     * @param string $type
     * @param string $condition
     * @return array
     */
    public function Rows($member_id,$select='*',$type='goods',$condition = '')
    {
        $cart_sql = "SELECT {$select} FROM {{b2c_cart_objects}}
        WHERE member_id = $member_id AND obj_type = '{$type}'";
        if ($condition) $cart_sql .= $condition;
        $cart_list = $this->ModelQueryAll($cart_sql);

        return $cart_list;
    }

    /**
     * 添加购物车
     *
     * @param $member_id
     * @param $quantity
     * @param $product_id
     * @param $goods_id
     * @param $num
     * @param $store
     * @param $freez
     * @return array
     */
    public function Add($member_id,$quantity,$product_id,$goods_id,$num,$store,$freez)
    {
        if (($quantity+$freez) > $store) return array('code'=>400,'msg'=>'您的够买数量超过库存','cart_num'=>$num,'product_quantity'=>0);

        $member_ident = md5($member_id);
        $params = serialize(array(
            'goods_id'=>$goods_id,
            'product_id'=>$product_id,
            'adjunct'=>array(),
            'extends_params'=>'',
        ));
        $time = time();

        $obj_ident = 'goods_'.$goods_id.'_'.$product_id;

        $cart_sql = "INSERT INTO {{b2c_cart_objects}} VALUE
            ('$obj_ident','$member_ident',$member_id,'goods','$params',$quantity,'$time')";

        if ($this->ModelExecute($cart_sql)) {
            $amount = $this->CartProductAmount($member_id);
            $num += $quantity;
            //记录购物车商品总数到session
            Yii::app()->session['b2c_member_total_num'] = $num;
            return array('code'=>200,'msg'=>'购物车加入成功','cart_sum'=>$num,
                'product_quantity'=>$quantity,'cart_amount'=>$amount
            );
        }
        return array('code'=>400,'msg'=>'购物车加入失败','cart_sum'=>$num,
            'product_quantity'=>0,'cart_amount'=>0
        );
    }

    /**
     * 编辑购物车
     *
     * @param $member_id 会员id
     * @param $add_quantity   商品数量
     * @param $old_quantity 购物车中已存在数量
     * @param $product_id  货品id
     * @param $goods_id 商品id
     * @param $num  购物车商品总数
     * @param $store  商品总库存
     * @param $freez  商品冻结库存
     * @return array
     */
    public function Edit($member_id,$add_quantity,$old_quantity,$product_id,$goods_id,$num,$store,$freez)
    {
        if ($add_quantity > 0) $quantity = $old_quantity + $add_quantity;
        else $quantity = $old_quantity - abs($add_quantity);
        if (($quantity + $freez) > $store) return array('code'=>400,'msg'=>'您的够买数量超过库存','cart_num'=>$num,'product_quantity'=>$old_quantity);

        $obj_ident = 'goods_'.$goods_id.'_'.$product_id;

        $cart_sql = "UPDATE {{b2c_cart_objects}} SET quantity = $quantity
                    WHERE obj_ident = '{$obj_ident}' AND member_id = $member_id AND obj_type = 'goods'";
        $amount = $this->CartProductAmount($member_id);
        if ($this->ModelExecute($cart_sql)) {
            $amount = $this->CartProductAmount($member_id);
            $num += $add_quantity;
            //记录购物车商品总数到session
            Yii::app()->session['b2c_member_total_num'] = $num;
            return array('code'=>200,'msg'=>'购物车修改成功',
                'cart_sum'=>$num,'product_quantity'=>$quantity,'cart_amount'=>$amount
            );
        }

        return array('code'=>400,'msg'=>'购物车修改失败','cart_sum'=>$num,
            'product_quantity'=>$old_quantity,'cart_amount'=>$amount
        );
    }

    /**
     * 删除购物车商品
     *
     * @param $member_id
     * @param $obj_ident
     * @return array
     */
    public function del($member_id,$obj_ident)
    {
        $cart_sql = "DELETE FROM {{b2c_cart_objects}}
        WHERE obj_ident = '{$obj_ident}' AND obj_type ='goods'";
        if ($this->ModelExecute($cart_sql)) {
            $num = $this->CartProductSum($member_id);
            $amount = $this->CartProductAmount($member_id);
            //记录购物车商品总数到session
            Yii::app()->session['b2c_member_total_num'] = $num;
            return array('code'=>200,'msg'=>'购物车删除成功','cart_sum'=>$num,'cart_amount'=>$amount);
        } else {
            $amount = $this->CartProductAmount($member_id);
            $num = $this->CartProductSum($member_id);
            return array('code'=>400,'msg'=>'购物车删除失败','cart_sum'=>$num,'cart_amount'=>$amount);
        }
    }

    /**
     * 添加购物车（商品详情点击添加）
     *
     * @param $member_id
     * @param $quantity
     * @param $product_id
     * @param $goods_id
     * @param $num
     * @param $store
     * @param $freez
     * @param string $quantity_type
     * @return array|void
     */
    public function CartInsert($member_id,$quantity,$product_id,$goods_id,$num,$store,$freez,$quantity_type='1')
    {
        $row = $this->row($product_id,$goods_id,$member_id);
        if ($row) {
            if ($quantity_type == '1') $add_quantity = $quantity - $row['quantity'];
            else $add_quantity = $quantity;

            return $this->edit($member_id,$add_quantity,$row['quantity'],$product_id,$goods_id,$num,$store,$freez);
        }
        return $this->add($member_id,$quantity,$product_id,$goods_id,$num,$store,$freez);
    }

    /**
     * 临时购物车加入数据库
     *
     * @param $member_id
     * @param $num
     * @return array|bool|void
     */
    public function CartCacheInsert($member_id,$num)
    {
        if (!Yii::app()->session['b2c_cart']['items']) return false;
        $Product = new ModelProduct();
        foreach (Yii::app()->session['b2c_cart']['items'] as $v) {
            $product_info = $Product->row($v['product_id'],'goods_id,store,freez');
            $result = $this->CartInsert($member_id,$v['quantity'],$v['product_id'],
                $v['goods_id'],$num,$product_info['store'],$product_info['freez'],'add');
        }
        Yii::app()->session['b2c_member_total_num'] = $this->CartProductSum($member_id);
        if ($result) {
            unset(Yii::app()->session['b2c_cart']);
        }

        return $result;
    }

    /**
     * 删除购物车（购物车列表页删除）
     *
     * @param $member_id
     * @param $product_id
     * @param $goods_id
     * @return array
     */
    public function CartDelete($member_id,$product_id,$goods_id)
    {
        $obj_ident = 'goods_'.$goods_id.'_'.$product_id;
        return $this->del($member_id,$obj_ident);
    }

    /**
     * 清空购物车
     *
     * @param $member_id
     * @return array
     */
    public function CartDelAll($member_id)
    {
        $cart_sql = "DELETE FROM {{b2c_cart_objects}}
        WHERE member_id = $member_id AND obj_type ='goods'";
        if ($this->ModelExecute($cart_sql)) {
            //记录购物车商品总数到session
            Yii::app()->session['b2c_member_total_num'] = 0;
            return array('code'=>200,'msg'=>'删除成功');
        } else {
            return array('code'=>400,'msg'=>'删除失败');
        }
    }

    /**
     * 购物车商品总数
     *
     * @param $member_id
     * @param string $type
     * @return int
     */
    public function CartProductSum($member_id,$type='goods')
    {
        $cart_sql = "SELECT SUM(quantity) AS num FROM {{b2c_cart_objects}}
        WHERE member_id = $member_id AND obj_type ='{$type}'";
        $cart_info = $this->ModelQueryRow($cart_sql);

        if (empty($cart_info['num'])) $cart_info['num'] = 0;
        Yii::app()->session['b2c_member_total_num'] = $cart_info['num'];
        return $cart_info['num'];
    }

    /**
     * 购物车商品总价
     *
     * @param $member_id
     * @param string $type
     * @param string $condition
     * @return int
     */
    public function CartProductAmount($member_id,$type='goods',$condition='')
    {
        $cart_list = $this->Rows($member_id,'quantity,params',$type,$condition);

        $productArr = array();
        foreach ($cart_list as $v) {
            $params = unserialize($v['params']);
            $productArr[] = $params['product_id'];
            $quantityArr[$params['product_id']] = $v['quantity'];
        }

        if (!$productArr) return 0;
        $products = implode(',',$productArr);

        $amount = 0;
        if ($products) {
            $sql = "SELECT product_id,price FROM {{b2c_products}} WHERE product_id IN ($products)";
            $product_list = $this->ModelQueryAll($sql);

            foreach ($product_list as $v) {
                if (isset($quantityArr[$v['product_id']]) && $quantityArr[$v['product_id']] > 0)
                    $amount += $v['price'] * $quantityArr[$v['product_id']];
            }
        }

        return sprintf('%01.2f',$amount);
    }

    /**
     * 购物车订单信息
     *
     * @param $member_id
     * @return array
     */
    public function CardIdentProduct($member_id)
    {
        $Product = new ModelProduct();
        $cart_list = $Product->CartGoods($this->Rows($member_id));
        if(empty($cart_list['item'])){
            return false;
        }
        $product_list = $cart_list['item'];
        $quantity_sum = 0;
        foreach ($product_list as $k=> $v) {
            $ident[] = "'".'goods_'.$v['goods_id'].'_'.$v['product_id']."'";
            $quantity_sum += $v['quantity'];
            $sql = "SELECT p.product_id,p.goods_id,p.bn,p.price,p.cost,p.mktprice,p.name,p.store,p.spec_info,g.type_id
        FROM {{b2c_products}} p LEFT JOIN {{b2c_goods}} g ON p.goods_id = g.goods_id
        WHERE p.product_id =".$v['product_id'];
            $product_info = $this->ModelQueryRow($sql);
            $product_list[$k]['name'] = $product_info['name'];
            $product_list[$k]['bn'] = $product_info['bn'];
            $product_list[$k]['price'] = number_format($product_info['price'],'2','.', '') ;
            $product_list[$k]['cost'] = number_format($product_info['cost'],'2','.', '');
            $product_list[$k]['mktprice'] = number_format( $product_info['mktprice'],'2','.', '');
            $product_list[$k]['store'] = $product_info['store'];
            $product_list[$k]['spec_info'] = $product_info['spec_info'];
            $product_list[$k]['type_id'] = $product_info['type_id'];
        }

        $identStr = implode(',',$ident);

        $condition = '';
        $condition .= " AND obj_ident IN ($identStr)";

        //商品总额
        $amount = $this->CartProductAmount($member_id,'goods',$condition);

        $id = 'b2c-cart-product-set-'.$member_id;
        $cart_cache = Yii::app()->cache->get($id);

        if(empty($cart_cache['addr'])){
            //收货地址
            $Addr = new ModelAddr();
            $member_addr = $Addr->AddrOrderDefault($member_id);
            $addr = $member_addr ? $member_addr:array();
            $cart_cache['addr'] = $addr;
        }


        if(empty($cart_cache['dly'])){
            //配送方式
            $dly_sql = "SELECT dt_id,dt_name,firstprice FROM {{b2c_dlytype}}  limit 1";
            $cart_cache['dly'] = $this->ModelQueryRow($dly_sql);
            $cart_cache['dly']['firstprice'] = 5.00;
        }
        if(empty($cart_cache['payment'])){
            //支付方式
            $cart_cache['payment'] = 'alipay';
        }

        //订单总额
        $total = $amount + $cart_cache['dly']['firstprice']; //快递费用


        $result['cache_id'] = $id;
        $result['ident'] = $identStr;
        $result['amount'] = $amount;
        $result['total'] = $total;
        $result['quantity_sum'] = $quantity_sum;
        $result['cart_list'] = $product_list;
        $result['dly']  = $cart_cache['dly'];
        $result['addr'] = $cart_cache['addr'];
        $result['payment'] = $cart_cache['payment'];

        if (Yii::app()->cache->set($id,$result,$this->cart_expire)) return array('code'=>200,'data'=>$result);
        return array('code'=>400,'msg'=>'生成失败');
    }

    //检测商品库存
    /**
     * @param int $product_id 商品id
     * @param int $quantity  商品数量
     * @return bool
     */
    public function productStore($product_id,$quantity){

        $sql = "select product_id,goods_id,store,freez from {{b2c_products}} where product_id=".intval($product_id);
        $product = $this->ModelQueryRow($sql);
        if(!$product) return false;
        if(($product['freez']+intval($quantity))>$product['store']){
            return false;
        }
        return true;
    }
}