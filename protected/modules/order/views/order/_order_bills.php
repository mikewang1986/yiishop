<div class="row">
    <div class="span5">
        <p>收款单据列表</p>
        <table class="table">
            <tr>
                <td>单据日期</td>
                <td>支付金额</td>
                <td>支付方式</td>
                <td>状态</td>
            </tr>
            <?php if (!empty($payments_list)):?>
            <?php foreach ($payments_list as $v):?>
            <tr>
                <td><?php echo date('y-m-m',$v['t_begin'])?></td>
                <td><?php echo $v['cur_money'];?></td>
                <td><?php echo $v['pay_name'];?></td>
                <td><?php echo Params::PaymentStatus($v['status']);?></td>
            </tr>
            <?php endforeach;?>
            <?php endif;?>
        </table>
    </div>

    <div class="span5">
        <p>退款单据列表</p>
        <table class="table">
            <tr>
                <td>单据日期</td>
                <td>退款金额</td>
                <td>退款方式</td>
                <td>状态</td>
            </tr>
            <?php if (!empty($refunds_list)):?>
                <?php foreach ($refunds_list as $v):?>
                    <tr>
                        <td><?php echo date('y-m-m',$v['t_begin'])?></td>
                        <td><?php echo $v['cur_money'];?></td>
                        <td><?php echo $v['pay_name'];?></td>
                        <td><?php echo Params::PaymentStatus($v['status']);?></td>
                    </tr>
                <?php endforeach;?>
            <?php endif;?>
        </table>
    </div>
</div>