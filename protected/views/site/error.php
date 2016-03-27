<?php
$this->breadcrumbs=array(
    '提示页',
    '错误'
);
?>
<h2>Error <?php echo $code; ?></h2>

<div class="error">
    <?php echo CHtml::encode($message); ?>
</div>

