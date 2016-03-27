<style>
    #refund-form td{border-top: none;}
    .table-pay-order{margin-bottom: 0px;margin-top: -12px;}
</style>
<div class="row">
    <h3 class="header smaller lighter green">订单退款：<?php echo $order_id;?></h3>
</div>

<form action="?r=order/pay/refundcreate" method="post" id="refund-form">
    <table class="table table-pay-order">
        <tr>
            <td class="td-pay-order">
                <p>订单号： 	<?php echo $order_id;?><input type="hidden" name="order_id" value="<?php echo $order_id;?>"></p>
                <p>订单总金额： 	￥<?php echo $order_info['final_amount'];?></p>
                <p>退款银行：<input type="text" name="Refunds[bank]"></p>
                <p>退款帐号：<input type="text" name="Refunds[account]"></p>
                <p>退款金额：￥<?php echo $order_info['final_amount'];?><input type="hidden" name="Refunds[money]" value="<?php echo $order_info['final_amount'];?>"> </p>
                <p>退款类型：
                    <label>
                        <input type="radio" class="ace" value="online" name="Refunds[pay_type]">
                        <span class="lbl"> 在线支付</span>
                    </label>
                    <label>
                        <input type="radio" class="ace" value="offline" name="Refunds[pay_type]">
                        <span class="lbl"> 线下支付</span>
                    </label></p>
                <p>退款方式：
                <select name="Refunds[pay_app_id]">
                    <option>&nbsp;</option>
                    <option value="1">支付宝支付</option>
                    <option value="2">网银支付</option>
                </select>
                </p>
            </td>
            <td>
                <p>下单日期：<?php echo date('Y-m-d H:i:s',$order_info['createtime']);?></p>
                <p>已收金额：￥<?php echo $order_info['payed'];?></p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>退款人：商城中心</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>退款人：<input type="text" name="Refunds[pay_account]"></p>
            </td>
        </tr>
    </table>

    <table class="table table-pay-order">
        <tr>
            <td>
                <p>退款单备注：</p>
                <textarea class="autosize-transition form-control" name="Refunds[memo]" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 69px;"></textarea>
            </td>
        </tr>
    </table>
    <div class="clearfix form-actions">
        <div class="col-md-offset-3 col-md-9">
            <button class="btn btn-sm btn-success submit-refunds" type="button">
                <i class="icon-ok"></i> 确定
            </button>
        </div>
    </div>
</form>