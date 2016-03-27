<ul class="list-group margin-bottom-25 sidebar-menu">
    <?php foreach (Layouts::category() as $k=>$v):?>
        <?php if (isset($v['cat_id']) && $v['cat_id']):?>
        <li class="list-group-item clearfix <?php if ($v['child']):?>dropdown<?php endif;?> <?php if ($parent_id==$v['cat_id']||$cat_id==$v['cat_id']):?>active<?php endif;?>">
            <a href="<?php echo $v['child']?'javascript:void(0);':'/category.html?cid='.$v['cat_id'];?>"
               <?php if ($parent_id==$v['cat_id']):?>class="collapsed" <?php endif;?>>
                <i class="fa fa-angle-right"></i>
                <?php echo $v['cat_name'];?>
                <i class="fa fa-angle-down"></i>
            </a>
            <?php if ($v['child']):?>
                <ul class="dropdown-menu" <?php if ($parent_id==$v['cat_id']):?>style="display: block;" <?php endif;?>>
                    <?php foreach ($v['child'] as $vv):?>
                        <li class="list-group-item <?php if ($cat_id == $vv['cat_id']):?>active<?php endif;?>">
                            <a href="/category.html?cid=<?php echo $vv['cat_id'];?>">
                                <i class="fa fa-circle"></i> <?php echo $vv['cat_name'];?> <i class="fa"></i>
                            </a>
                        </li>
                    <?php endforeach;?>
                </ul>
            <?php endif;?>
        </li>
        <?php endif;?>
    <?php endforeach;?>
</ul>