<div class="page-header">
    <h1>
        扩展属性
    </h1>
</div>

<div class="row">
    <div class="col-xs-12">
        <form class="form-horizontal" id="validation-form" novalidate="novalidate" action="?r=goods/props/<?php echo $action;?>" method="post">
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 名称 </label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-5" name="Props[name]" value="<?php echo isset($model['props_item'])?$model['props_item']['name']:'';?>">
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 属性别名(|分割) </label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-5" name="Props[alias]" value="<?php echo isset($model['props_item'])?$model['props_item']['alias']:'';?>">
                </div>
            </div>

            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 排序 </label>
                <div class="col-sm-8">
                    <input type="text" class="col-sm-2" name="Props[ordernum]" value="<?php echo isset($model['props_item'])?$model['props_item']['ordernum']:'';?>">
                </div>
            </div>

            <div class="billContainer no_spec ">
                <div class="row col-xs-8">
                    <div style="margin-bottom: 5px;">
                        <button class="btn btn-sm btn-primary spec_insert">添加值</button>
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
                            <?php if(isset($model['props_value_items']) && $model['props_value_items']):?>
                            <?php foreach($model['props_value_items'] as $v):?>
                                <tr>
                                    <td>
                                        <input type="text" name="PropsValue[name][]" value="<?php echo $v['name'];?>">
                                        <input type="hidden" name="PropsValue[props_value_id][]" value="<?php echo $v['props_value_id'];?>">
                                    </td>
                                    <td><input type="text" name="PropsValue[alias][]" value="<?php echo $v['alias'];?>"></td>
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