<table class="table">
    <tr>
        <td>序号</td>
        <td>时间</td>
        <td>操作人</td>
        <td>行为</td>
        <td>结果</td>
        <td>备注</td>
    </tr>
    <?php if ($item_list):?>
    <?php foreach ($item_list as $k=>$v):?>
    <tr>
        <td><?php echo $k+1;?></td>
        <td><?php echo date('Y-m-d',$v['alttime']);?></td>
        <td><?php echo $v['op_name'];?></td>
        <td><?php echo $v['behavior'];?></td>
        <td><?php echo $v['result'];?></td>
        <td><?php echo $v['txt_key'];?></td>
    </tr>
    <?php endforeach;?>
    <?php endif;?>
</table>