<style>
    .well {float: left;margin-left: 35px;}
</style>

<div class="well goods-cat-select1 col-sm-3" >
    <?php echo TbHtml::navList($cat_one); ?>
</div>
<div class="well goods-cat-select2 col-sm-3" style="<?php echo empty($cat_two)?'display:none;':''?>">
    <?php echo TbHtml::navList($cat_two); ?>
</div>
<div class="well goods-cat-select3 col-sm-3" style="<?php echo empty($cat_three)?'display:none;':''?>">
    <?php echo TbHtml::navList($cat_three); ?>
</div>

<div class="well well-lg col-sm-10">
    <h4 class="blue">您当前选择的类目是:</h4>
    <span class="label label-lg label-pink arrowed-right select_1"><?php echo isset($active['one']) && $active['one']?$active['one']['name']:'';?></span>
    <span class="label label-lg label-primary arrowed-right select_2"><?php echo isset($active['two']) && $active['two']?$active['two']['name']:'';?></span>
    <span class="label label-lg label-danger arrowed-right select_3"><?php echo isset($active['three']) && $active['three']?$active['three']['name']:'';?></span>
    <input type="hidden" id="select_cat_id" value="<?php echo $cat_id;?>">
</div>