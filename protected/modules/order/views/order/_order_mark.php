<table class="table">
    <tr>
        <td>管理员</td>
        <td>内容</td>
        <td>时间</td>
    </tr>
    <?php if ($mark_text):?>
    <?php foreach ($mark_text as $v):?>
    <tr>
        <td><?php echo $v['op_name'];?></td>
        <td><?php echo $v['mark_text'];?></td>
        <td><?php echo date('Y-m-d',$v['add_time']);?></td>
    </tr>
    <?php endforeach;?>
    <?php endif;?>
</table>