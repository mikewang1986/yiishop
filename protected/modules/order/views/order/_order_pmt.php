<table class="table">
    <tr>
        <td>优惠方案</td>
        <td>优惠金额</td>
    </tr>
    <?php if ($pmt_list):?>
    <?php foreach ($pmt_list as $v):?>
    <tr>
        <td><?php echo $v->pmt_describe;?></td>
        <td><?php echo $v->pmt_amount;?></td>
    </tr>
    <?php endforeach;?>
    <?php endif;?>
</table>