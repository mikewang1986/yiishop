<table class="table" style="background-color: #ffffff;">
    <tr>
        <td>订单号</td>
        <td>订单状态</td>
        <td>支付状态</td>
        <td>发货状态</td>
        <td>总金额</td>
        <td>下单日期</td>
    </tr>

    <?php if ($order_list):?>
    <?php foreach ($order_list as $v):?>
    <tr>
        <td><?php echo $v['order_id'];?></td>
        <td><?php echo Yii::app()->params['order_status'][$v['status']];?></td>
        <td><?php echo Yii::app()->params['pay_status'][$v['pay_status']];?></td>
        <td><?php echo Yii::app()->params['ship_status'][$v['ship_status']];?></td>
        <td><?php echo $v['total_amount'];?></td>
        <td><?php echo date('Y-m-d H:i:s',$v['createtime']);?></td>
    </tr>
    <?php endforeach;?>
    <?php endif;?>
</table>