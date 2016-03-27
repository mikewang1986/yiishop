<style>
    .modal-dialog{width: 60%;}
</style>

<b>订单操作</b>
<?php if ($order_info['status'] == 'active' && $order_info['pay_status'] == 0):?>
<button type="button" class="btn btn-xs btn-info order_pay" data="<?php echo $order_id;?>">支付</button>
<?php else:?>
<button type="button" class="btn btn-xs">支付</button>
<?php endif;?>
<?php if ($order_info['status'] == 'active' && $order_info['ship_status'] == 0):?>
<button type="button" class="btn btn-xs btn-info order_delivery" data="<?php echo $order_id;?>">发货</button>
<?php else:?>
<button type="button" class="btn btn-xs">发货</button>
<?php endif;?>
<?php if ($order_info['status'] == 'active'):?>
<button type="button" class="btn btn-xs btn-info" data="<?php echo $order_id;?>">完成</button>
<?php else:?>
<button type="button" class="btn btn-xs">完成</button>
<?php endif;?>
<b style="padding-left: 30px;">退单操作</b>
<?php if ($order_info['pay_status'] == 1):?>
<button type="button" class="btn btn-xs btn-info order_refund" data="<?php echo $order_id;?>">退款</button>
<?php else:?>
<button type="button" class="btn btn-xs">退款</button>
<?php endif;?>
<?php if ($order_info['ship_status'] == 1):?>
<button type="button" class="btn btn-xs btn-info order_reship" data="<?php echo $order_id;?>">退货</button>
<?php else:?>
<button type="button" class="btn btn-xs">退货</button>
<?php endif;?>
<?php if ($order_info['status'] == 'active' && $order_info['pay_status'] == 0 && $order_info['ship_status'] == 0):?>
<button type="button" class="btn btn-xs btn-info" data="<?php echo $order_id;?>">作废</button>
<?php else:?>
<button type="button" class="btn btn-xs">作废</button>
<?php endif;?>
<table class="table order-table-info">
    <tr>
        <td>商品价格</td>
        <td>订单其他信息</td>
        <td>购买人信息</td>
        <td>收货人信息</td>
    </tr>
    <tr>
        <td>
            <p>商品总额： 	￥<?php echo $order_info->total_amount;?></p>
            <p>配送费用： 	￥<?php echo $order_info->cost_freight;?></p>
            <p>订单总额： 	￥<?php echo $order_info->final_amount;?></p>
            <p>已支付金额：￥<?php echo $order_info->payed;?></p>
        </td>
        <td>
            <p>配送方式： 	<?php echo $order_info->shipping;?></p>
            <p>配送保价： 	<?php echo $order_info->is_protect=='false'?'否':'是';?></p>
            <p>商品重量： 	<?php echo $order_info->weight;?> g</p>
            <p>支付方式： 	<?php echo $payment_info['pay_name'];?></p>
            <p>可得积分： 	<?php echo $order_info->score_g;?></p>
        </td>
        <td>
            <p>用户名： 	<?php echo $user_name;?></p>
            <p>姓名： 	<?php echo $user_info['name'];?></p>
            <p>电话：     <?php echo $user_info['mobile'];?></p>
            <p>地区： 	<?php echo Params::AreaMainLand($user_info['area']);?></p>
            <p>Email：   <?php echo $user_info['email'];?></p>
        </td>
        <td>
            <p>发货日期： 	<?php echo isset($user_info_addon['day'])?$user_info_addon['day'].','.$user_info_addon['time']:'';?></p>
            <p>姓名： 	<?php echo isset($user_info_addon['name'])?$user_info_addon['name']:'';?></p>
            <p>电话： 	<?php echo isset($user_info_addon['tel'])?$user_info_addon['tel']:'';?></p>
            <p>手机： 	<?php echo isset($user_info_addon['mobile'])?$user_info_addon['mobile']:'';?></p>
            <p>地区： 	<?php echo isset($user_info_addon['area'])?Params::AreaMainLand($user_info_addon['area']):'';?></p>
            <p>地址： 	<?php echo isset($user_info_addon['addr'])?$user_info_addon['addr']:'';?></p>
            <p>邮编： 	<?php echo isset($user_info_addon['zip'])?$user_info_addon['zip']:'';?></p>
        </td>
    </tr>
</table>
<p>商品信息</p>
<table class="table">
    <tr>
        <td>货品编号</td>
        <td>货品名称</td>
        <td>已发货量</td>
        <td>单价</td>
        <td>合计金额</td>
        <td>购买数量</td>
    </tr>
    <?php if (isset($product_list) && !empty($product_list)):?>
        <?php foreach ($product_list as $v):?>
            <tr>
                <td><?php echo $v->bn;?></td>
                <td><?php echo $v->name;?></td>
                <td><?php echo $v->sendnum;?></td>
                <td>￥<?php echo $v->price;?></td>
                <td>￥<?php echo $v->amount;?></td>
                <td><?php echo $v->nums;?></td>
            </tr>
        <?php endforeach;?>
    <?php endif;?>
</table>