<div class="billContainer has_spec" <?php if ($model['spec']['product_num'] <= 0):?>style="display: none;"<?php endif;?>>
    <h3 class="header smaller lighter green">
        <i class="icon-bullhorn"></i>
        规格
    </h3>
    <button class="btn btn-sm btn-success goods_spec">
        编辑
    </button>
    <button class="btn btn-sm btn-danger">
        关闭
    </button>
    <h4 class="smaller lighter purple">
        已经启动的规格项:
        <?php if ($model['spec']['spec_info']):?>
            <?php foreach ($model['spec']['spec_info'] as $v):?>
                <button class="btn btn-white"><?php echo $v['spec_name'];?>(<?php echo count($v['spec_value']);?>)</button>
            <?php endforeach;?>
        <?php endif;?>
    </h4>
    <h4 class="smaller ligeter purple">
        已生成货品(<?php echo $model['spec']['product_num'];?>)
    </h4>
</div>