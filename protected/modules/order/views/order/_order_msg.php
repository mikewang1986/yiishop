<div class="span6">
    <table class="table">
        <tr>
            <td>货品编号</td>
            <td>货品名称</td>
            <td>购买数量</td>
        </tr>
        <?php if (isset($product_list) && !empty($product_list)):?>
            <?php foreach ($product_list as $v):?>
                <tr>
                    <td><?php echo $v->bn;?></td>
                    <td><?php echo $v->name;?></td>
                    <td><?php echo $v->nums;?></td>
                </tr>
            <?php endforeach;?>
        <?php endif;?>
    </table>
</div>
<div class="span4">
    <table class="table">
        <tr>
            <td>标题</td>
            <td>时间</td>
            <td>留言人</td>
            <td>内容</td>
        </tr>
        <?php if ($comment):?>
        <?php foreach ($comment as $v):?>
        <tr>
            <td><?php echo $v->title;?></td>
            <td><?php echo date('Y-m-d',$v->time);?></td>
            <td><?php echo $v->author;?></td>
            <td><?php echo $v->comment;?></td>
        </tr>
        <?php endforeach;?>
        <?php endif;?>
    </table>
</div>