<?php
$this->breadcrumbs=array(
    '商品管理'=>array('/goods/default'),
    '商品列表'=>array('/goods/default'),
    '扩展属性-'.$model['goods_row']['name']
);
?>
<div class="page-header">
    <h1>
        编辑扩展属性
    </h1>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-4">
        <form action="?r=goods/default/props&goods_id=<?php echo $model['goods_row']['goods_id'];?>" method="post">
            <div class="form-group">
                <?php if (isset($model['type_props']['item']) && $model['type_props']['item']):?>
                <?php foreach ($model['type_props']['item'] as $v):?>
                <label for="form-field-select-1"><?php echo $v['name'];?></label>
                <input type="hidden" name="Props[props_id][]" value="<?php echo $v['props_id'];?>">
                <select class="form-control" name="Props[props_value_id][<?php echo $v['props_id'];?>]">
                    <option value="">&nbsp;</option>
                    <?php if (isset($model['type_props']['propsValue'][$v['props_id']])):?>
                    <?php foreach ($model['type_props']['propsValue'][$v['props_id']] as $kk=>$vv):?>
                    <option value="<?php echo $kk;?>" <?php if (isset($model['type_goods_value'][$v['props_id']]) && $model['type_goods_value'][$v['props_id']] == $kk):?>selected="true" <?php endif;?>><?php echo $vv;?></option>
                    <?php endforeach;?>
                    <?php endif;?>
                </select>
                <?php endforeach;?>
                <?php endif;?>
            </div>
            <div class="col-md-offset-3 col-md-9">
                <button type="submit" class="btn btn-info">
                    <i class="icon-ok bigger-110"></i>
                    提交
                </button>
                <button type="reset" class="btn">
                    <i class="icon-undo bigger-110"></i>
                    重置
                </button>
            </div>
        </form>
    </div>
</div>