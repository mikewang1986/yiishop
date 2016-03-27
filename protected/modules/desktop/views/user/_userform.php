<div class="page-header">
    <h1>
        添加操作员
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
            <form class="form-horizontal" action="?r=desktop/user/insert" method="post">
                <div class="form-group">
                    <div class="col-xs-12">
                        <label for="form-field-1" class="control-label col-sm-3 bolder blue"> 姓名</label>

                        <div class="col-sm-9">
                            <input type="text" class="col-xs-10 col-sm-5" name="User[name]"
                                   alue="<?php echo !empty($model['user_row'])?$model['user_row']['name']:'';?>" placeholder="姓名" id="form-field-1">
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <label class="control-label  col-sm-3  bolder blue">角色</label>
                        <div class="col-sm-9">
                            <?php foreach ($model['role_list'] as $v):?>

                                <label>
                                    <input type="radio" <?php if(!empty($model['user_row'])){
                                        echo $v['role_id']==$model['user_row']['role']?'checked':''; } ?> value="<?php echo $v['role_id'];?>" class="ace   " name="User[role]">
                                    <span class="lbl"><?php echo $v['group_name'];?></span>
                                </label><br/>

                            <?php endforeach;?>
                        </div>
                    </div>

                    <div class="col-xs-12">
                        <div class="control-group" >
                            <label class="control-label  col-sm-3  bolder blue">密码</label>

                            <div class="col-sm-9">
                                <input type="text" class="col-xs-10 col-sm-5" name="User[password]"
                                       value="" placeholder="密码" id="form-field-1">
                            </div>

                        </div>
                    </div>


                    <div class="col-xs-12">
                        <div class="control-group" >
                            <label class="control-label  col-sm-3  bolder blue">状态</label>

                            <div class="col-sm-9">
                                <input type="radio"  value="1" class="ace   " name="User[status]">
                                <span class="lbl">可用</span>
                                <input type="radio"  value="0" class="ace   " name="User[status]" checked>
                                <span class="lbl">禁用</span>
                            </div>

                        </div>
                    </div>

                    <div class="col-xs-12">
                        <div class="control-group" >
                            <label class="control-label  col-sm-3  bolder blue">是否超级管理员</label>

                            <div class="col-sm-9">
                                <input type="radio"  value="1" class="ace   " name="User[super]">
                                <span class="lbl">是 &nbsp;&nbsp;&nbsp;</span>
                                <input type="radio"  value="0" class="ace   " name="User[super]" checked>
                                <span class="lbl">否  </span>
                            </div>

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