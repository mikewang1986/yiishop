<style>
    #pay-form td{border-top: none;}
    .table-pay-order{margin-bottom: 0px;margin-top: -12px;}
</style>
<div class="row">
    <h3 class="header smaller lighter green">支付订单：<?php echo $order_id;?></h3>
</div>

<form action="?r=order/pay/create" method="post" id="pay-form">
    <table class="table table-pay-order">
        <tr>
            <td class="td-pay-order">
                <p>订单号： 	<?php echo $order_id;?><input type="hidden" name="order_id" value="<?php echo $order_id;?>"></p>
                <p>订单总金额： 	￥<?php echo $order_info['final_amount'];?></p>
                <p>收款银行：<input type="text" name="Payments[bank]"></p>
                <p>收款帐号：<input type="text" name="Payments[account]"></p>
                <p>收款金额：￥<?php echo $order_info['final_amount'];?><input type="hidden" name="Payments[money]" value="<?php echo $order_info['final_amount'];?>"> </p>
                <p>付款类型：
                    <label>
                        <input type="radio" class="ace" value="online" name="Payments[pay_type]">
                        <span class="lbl"> 在线支付</span>
                    </label>
                    <label>
                        <input type="radio" class="ace" value="offline" name="Payments[pay_type]">
                        <span class="lbl"> 线下支付</span>
                    </label></p>
                <p>支付方式：
                <select name="Payments[pay_app_id]">
                    <option>&nbsp;</option>
                    <option value="1">支付宝支付</option>
                    <option value="2">网银支付</option>
                </select>
                </p>
                <p>是否开票：<?php echo $order_info['is_tax']=='true'?'是':'否';?></p>
                <p>当前状态：未支付</p>
                <p>发票抬头：<?php echo $order_info['tax_company'];?></p>
            </td>
            <td>
                <p>下单日期：<?php echo date('Y-m-d H:i:s',$order_info['createtime']);?></p>
                <p>已收金额：￥0.00</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>收款人：商城中心</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>客户支付货币：人民币 (￥<?php echo $order_info['final_amount'];?>)</p>
                <p>税金：￥0.00</p>
                <p>收取支付费用：￥0.00</p>
                <p>付款人：<input type="text" name="Payments[pay_account]"></p>
            </td>
        </tr>
    </table>

    <table class="table table-pay-order">
        <tr>
            <td>
                <p>收款单备注：</p>
                <textarea class="autosize-transition form-control" name="Payments[memo]" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 69px;"></textarea>
            </td>
        </tr>
    </table>
    <div class="clearfix form-actions">
        <div class="col-md-offset-3 col-md-9">
            <button class="btn btn-sm btn-success submit-pay" type="button">
                <i class="icon-ok"></i> 确定
            </button>
        </div>
    </div>
</form>