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