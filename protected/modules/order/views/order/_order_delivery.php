<div class="row">
    <div class="span5">
        <p>发货单据列表</p>
        <table class="table">
            <tr>
                <td>建立日期</td>
                <td>发货单号</td>
                <td>物流单号</td>
                <td>收件人</td>
                <td>配送方式</td>
            </tr>
            <?php if (isset($delivery_list) && !empty($delivery_list)):?>
                <?php foreach ($delivery_list as $v):?>
                <tr>
                    <td><?php echo date('y-m-d',$v['t_begin']);?></td>
                    <td><?php echo $v['delivery_id'];?></td>
                    <td><?php echo $v['logi_no'];?></td>
                    <td><?php echo $v['ship_name'];?></td>
                    <td><?php echo $v['delivery']=='1'?'快递':'货到付款';?></td>
                </tr>
                <?php endforeach;?>
            <?php endif;?>
        </table>
    </div>

    <div class="span5">
        <p>退货单据列表</p>
        <table class="table">
            <tr>
                <td>建立日期</td>
                <td>退货单号</td>
                <td>物流单号</td>
                <td>退货人</td>
                <td>配送方式</td>
            </tr>
            <?php if (isset($reship_list) && !empty($reship_list)):?>
                <?php foreach ($reship_list as $v):?>
                    <tr>
                        <td><?php echo date('y-m-d',$v['t_begin']);?></td>
                        <td><?php echo $v['reship_id'];?></td>
                        <td><?php echo $v['logi_no'];?></td>
                        <td><?php echo $v['ship_name'];?></td>
                        <td><?php echo $v['delivery']=='1'?'快递':'货到付款';?></td>
                    </tr>
                <?php endforeach;?>
            <?php endif;?>
        </table>
    </div>
</div>