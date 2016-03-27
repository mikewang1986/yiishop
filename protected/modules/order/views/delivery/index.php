<style>
    #delivery-form td{border-top: none;}
    .table-pay-order{margin-bottom: 0px;margin-top: -12px;}
</style>
<div class="row">
    <h3 class="header smaller lighter green">订单发货：<?php echo $order_id;?></h3>
</div>
<form action="?r=order/delivery/create" method="post" id="delivery-form">
    <table class="table table-pay-order">
        <tr>
            <td class="td-pay-order">
                <p>&nbsp;&nbsp;&nbsp;&nbsp;订单号：
                    <?php echo $order_id;?><input type="hidden" name="order_id" value="<?php echo $order_id;?>"></p>
                <p>配送方式：
                    <select name="Delivery[shipping_id]">
                        <option>&nbsp;</option>
                        <option value="1" <?php if ($order_info['shipping_id'] == 1):?>selected="true" <?php endif;?>>快递</option>
                        <option value="2" <?php if ($order_info['shipping_id'] == 2):?>selected="true" <?php endif;?>>货到付款</option>
                    </select>
                </p>
                <p>物流公司：
                    <select name="Delivery[logi_id]">
                        <?php foreach ($dlycorp_list as $v):?>
                        <option value="<?php echo $v['corp_id'];?>"><?php echo $v['name'];?></option>
                        <?php endforeach;?>
                    </select>
                </p>
                <p>物流费用：￥<input type="text" value="<?php echo $order_info['cost_freight'];?>" name="Delivery[cost_freight]"></p>
                <p>收货人姓名：<input type="text" value="<?php echo $order_info['ship_name'];?>" name="Params[ship_name]"></p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;手机：<input type="text" value="<?php echo $order_info['ship_mobile'];?>" name="Params[ship_mobile]"></p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;地区：
                    <select id="consigneePr" name="Area[province]">
                        <?php foreach ($addr_info['province'] as $v):?>
                            <option value="<?php echo $v['region_id'];?>" <?php if (isset($addr_info['province_id']) && $addr_info['province_id'] == $v['region_id']):?>selected="true" <?php endif;?>><?php echo $v['local_name'];?></option>
                        <?php endforeach;?>
                    </select>
                    <select id="consigneeCity" name="Area[city]">
                        <?php if (isset($addr_info['city'])):?>
                        <?php foreach ($addr_info['city'] as $v):?>
                            <option value="<?php echo $v['region_id'];?>" <?php if (isset($addr_info['city_id']) && $addr_info['city_id'] == $v['region_id']):?>selected="true" <?php endif;?>><?php echo $v['local_name'];?></option>
                        <?php endforeach;?>
                        <?php endif;?>
                    </select>
                    <select id="consigneeArea" name="Area[town]">
                        <?php if (isset($addr_info['town'])):?>
                        <?php foreach ($addr_info['town'] as $v):?>
                            <option value="<?php echo $v['region_id'];?>" <?php if (isset($addr_info['town_id']) && $addr_info['town_id'] == $v['region_id']):?>selected="true" <?php endif;?>><?php echo $v['local_name'];?></option>
                        <?php endforeach;?>
                        <?php endif;?>
                    </select>
                </p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;地址：<input type="text" value="<?php echo $order_info['ship_addr'];?>" name="Params[ship_addr]" style="width: 50%;"></p>
            </td>
            <td>
                <p>下单日期：<?php echo date('Y-m-d H:i:s',$order_info['createtime']);?></p>
                <p>配送费用：￥<?php echo $order_info['cost_freight'];?></p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>物流单号：<input type="text" value="" name="Delivery[logi_no]"</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>电话：<input type="text" value="<?php echo $order_info['ship_tel'];?>" name="Params[ship_tel]"></p>
                <p>邮政编码：<input type="text" value="<?php echo $order_info['ship_zip'];?>" name="Params[ship_zip]"></p>
            </td>
        </tr>
    </table>

    <table class="table table-pay-order">
        <tr>
            <td>
                <p>发货单备注：</p>
                <textarea class="autosize-transition form-control" name="Delivery[memo]" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 69px;"></textarea>
            </td>
        </tr>
    </table>
    <div class="clearfix form-actions">
        <div class="col-md-offset-3 col-md-9">
            <button class="btn btn-sm btn-success submit-delivery" type="button">
                <i class="icon-ok"></i> 确定
            </button>
        </div>
    </div>
</form>