<div class="form-group">
    <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 类型名称</label>
    <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-5" placeholder="类型名称" name="Type[name]" value="<?php echo isset($model['type_item'])?$model['type_item']['name']:'';?>">
    </div>
</div>

<div class="form-group">
    <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 类型别名</label>
    <div class="col-sm-9">
        <input type="text" class="col-xs-10 col-sm-5" placeholder="类型别名" name="Type[alias]" value="<?php echo isset($model['type_item'])?$model['type_item']['alias']:'';?>">
        <label>（以"|"分隔，以"|"开头与结尾，如：“|T恤|T恤衫|”）</label>
    </div>
</div>

<div class="form-group">
    <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 关联品牌</label>
    <div class="col-sm-9">
        <?php foreach ($model['brand_list'] as $v):?>
        <label>
            <input type="checkbox" class="ace" name="TypeBrand[]" value="<?php echo $v['brand_id'];?>" <?php echo isset($model['type_brand_list'])&&$model['type_brand_list']&&in_array($v['brand_id'],$model['type_brand_list'])?'checked':'';?>>
            <span class="lbl"> <?php echo $v['brand_name'];?></span>
        </label>
        <?php endforeach;?>
    </div>
</div>