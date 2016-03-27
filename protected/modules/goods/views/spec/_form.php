<div class="page-header">
    <h1>
        规格
    </h1>
</div>

<div class="row">
    <div class="col-xs-12">
        <form class="form-horizontal" id="validation-form" novalidate="novalidate" action="?r=goods/spec/<?php echo $action;?>" method="post">
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 标题 </label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-5" name="Spec[spec_name]" value="<?php echo isset($model['spec_item'])?$model['spec_item']['spec_name']:'';?>">
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 规格备注 </label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-5" name="Spec[spec_memo]" value="<?php echo isset($model['spec_item'])?$model['spec_item']['spec_memo']:'';?>">
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 规格别名 </label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-5" name="Spec[alias]" value="<?php echo isset($model['spec_item'])?$model['spec_item']['alias']:'';?>">
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 显示类型 </label>
                <div class="col-sm-9">
                    <?php foreach ($this->spec_type as $k=>$v):?>
                    <label>
                        <input type="radio" value="<?php echo $k;?>" class="ace" name="Spec[spec_type]" <?php echo isset($model['spec_item'])&&$model['spec_item']['spec_type']==$k?'checked':'';?>>
                        <span class="lbl"> <?php echo $v;?></span>
                    </label>
                    <?php endforeach;?>
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 显示方式 </label>
                <div class="col-sm-9">
                    <?php foreach ($this->spec_show_type as $k=>$v):?>
                        <label>
                            <input type="radio" value="<?php echo $k;?>" class="ace" name="Spec[spec_show_type]" <?php echo isset($model['spec_item'])&&$model['spec_item']['spec_show_type']==$k?'checked':'';?>>
                            <span class="lbl"> <?php echo $v;?></span>
                        </label>
                    <?php endforeach;?>
                </div>
            </div>

            <div class="billContainer no_spec ">
                <div class="row col-xs-8">
                    <div style="margin-bottom: 5px;">
                        <button class="btn btn-sm btn-primary spec_insert">添加规格值</button>
                    </div>
                    <div class="table-responsive center">
                        <table id="spec-table" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">规格值名称</th>
                                <th class="center">规格值别名</th>
                                <th class="center">操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <?php if(isset($model['spec_value_list']) && $model['spec_value_list']):?>
                            <?php foreach($model['spec_value_list'] as $v):?>
                                <tr>
                                    <td>
                                        <input type="text" name="SpecValue[spec_value][]" value="<?php echo $v['spec_value'];?>">
                                        <input type="hidden" name="SpecValue[spec_value_id][]" value="<?php echo $v['spec_value_id'];?>">
                                    </td>
                                    <td><input type="text" name="SpecValue[alias][]" value="<?php echo $v['alias'];?>"></td>
                                    <td>
                                        <button class="btn btn-xs btn-success spec_up">
                                            <i class="fa fa-arrow-up bigger-120"></i>
                                        </button>
                                        <button class="btn btn-xs btn-success spec_down">
                                            <i class="fa fa-arrow-down bigger-120"></i>
                                        </button>
                                        <button class="btn btn-xs btn-danger spec_del">
                                            <i class="fa icon-trash bigger-120"></i>
                                        </button>
                                    </td>
                                </tr>
                            <?php endforeach;?>
                            <?php endif;?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <button type="submit" class="btn btn-info">
                        <i class="icon-ok bigger-110"></i>
                        提交
                    </button>

                    &nbsp; &nbsp; &nbsp;
                    <button type="reset" class="btn">
                        <i class="icon-undo bigger-110"></i>
                        重置
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>