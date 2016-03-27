<p>当前预存款： 	<b style="color: red;font-size: 20px;">￥100.00</b></p>
<form>
    <fieldset>
        <p>&nbsp;&nbsp;&nbsp;
            充值金额：<input type="text" ></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            备注：<input type="text" ></p>
        <button type="submit" class="btn btn-white" style="margin-left: 120px;">保存</button>
    </fieldset>
</form>
<div style="height: 10px;"></div>
<div >
<table class="col-xs-9">
    <tr>
        <td>交易时间</td>
        <td>业务摘要</td>
        <td>存入金额</td>
        <td>支出金额</td>
        <td>当前余额</td>
        <td>支付方式</td>
        <td>支付单号</td>
        <td>订单号</td>
        <td>管理备注</td>
    </tr>
    <?php foreach ($advance_list as $v):?>
    <tr>
        <td><?php echo date('Y-m-d H:i:s',$v->mtime);?></td>
        <td><?php echo $v->memo;?></td>
        <td><?php echo $v->import_money;?></td>
        <td><?php echo $v->explode_money;?></td>
        <td><?php echo $v->member_advance;?></td>
        <td><?php echo $v->paymethod;?></td>
        <td><?php echo $v->payment_id;?></td>
        <td><?php echo $v->order_id;?></td>
        <td><?php echo $v->message;?></td>
    </tr>
    <?php endforeach;?>
</table>
</div>
