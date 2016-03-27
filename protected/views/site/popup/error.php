<div class="alert alert-danger">
    <button data-dismiss="alert" class="close" type="button">
        <i class="icon-remove"></i>
    </button>

    <strong>
        <?php if ($content) echo $content;?>
        <i class="icon-remove"></i>操作失败，未完成！
    </strong>

    系统自动跳转在 <span id="num"><?php echo $timeout;?></span>
    如果不想等待,<a href="<?php echo $redirect;?>">
        <button class="btn btn-purple">点击这里跳转</button></a>
    <br>
</div>