<div class="page-header">
    <h1>
        编辑操作员
    </h1>

    <?php $save = $model['param']['save']=='update'?'更新':'添加';?>
    <?php if (isset($model['param']['result']) && $model['param']['result'] == 'success'):?>
        <?php echo TbHtml::alert(TbHtml::ALERT_COLOR_SUCCESS, '操作员'.$save.'成功'); ?>
    <?php endif;?>
    <?php if (isset($model['param']['result']) && $model['param']['result'] == 'fail'):?>
        <?php echo TbHtml::alert(TbHtml::ALERT_COLOR_DANGER, '操作员'.$save.'失败,可能是添加数据错误或者没有更改操作'); ?>
    <?php endif;?>

    <div class="row">
        <div class="col-xs-12">
            <form class="form-horizontal" action="?r=desktop/user/update&user_id=<?php echo $model['user_row']['user_id'];?>" method="post">
                <div class="form-group">
                    <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 姓名</label>

                    <div class="col-sm-9">
                        <input type="text" class="col-xs-10 col-sm-5" name="User[name]" value="<?php echo $model['user_row']['name'];?>" placeholder="姓名" id="form-field-1">
                    </div>

                    <div class="col-xs-12 col-sm-6">
                        <div class="control-group">
                            <label class="control-label bolder blue">角色</label>
                            <?php foreach ($model['role_list'] as $v):?>
                            <div class="radio">
                                <label>
                                    <input type="radio" <?php echo $v['role_id']==$model['user_row']['role']?'checked':'';?> value="<?php echo $v['role_id'];?>" class="ace" name="User[role]">
                                    <span class="lbl"><?php echo $v['group_name'];?></span>
                                </label>
                            </div>
                            <?php endforeach;?>
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
</div>