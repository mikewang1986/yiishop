<div class="page-header">
    <h1>
        <?php echo $role_row['group_name'];?>
    </h1>
</div>
<?php $save = $param['save']=='update'?'更新':'添加';?>
<?php if (isset($param['result']) && $param['result'] == 'success'):?>
<?php echo TbHtml::alert(TbHtml::ALERT_COLOR_SUCCESS, '角色'.$save.'成功'); ?>
<?php endif;?>
<?php if (isset($param['result']) && $param['result'] == 'fail'):?>
<?php echo TbHtml::alert(TbHtml::ALERT_COLOR_DANGER, '角色'.$save.'失败,可能是添加数据错误或者没有更改操作'); ?>
<?php endif;?>


<div class="row">
    <div class="col-xs-12" style="margin-left: 10px;">
        <form class="form-horizontal" action="?r=desktop/role/update&role_id=<?php echo $role_row['role_id'];?>" method="post">
            <div class="form-group">
                <label for="form-field-8">角色名称</label>
                <div>
                    <input type="text" class="col-xs-10 col-sm-5" value="<?php echo $role_row['group_name'];?>" name="Role[group_name]" id="form-field-1">
                </div>
                <div style="height: 30px;"></div>
                <?php foreach ($role_list as $k=>$v):?>
                    <h3 style="color: #2679b5;"><?php echo $v['name'];?></h3>
                    <?php foreach ($v['ctl'] as $kk=>$vv):?>
                        <div>
                            <label class="control-label bolder blue"><?php echo $vv['name'];?></label>
                            <div class="checkbox">
                            <?php foreach ($vv['act'] as $kkk=>$vvv):?>
                                <?php foreach ($vvv['list_act'] as $kkkk=>$vvvv):?>
                                    <label>
                                        <input type="checkbox" <?php if (in_array($k.'_'.$kkk.'_'.$kkkk,$role_row['acl'])):?>checked<?php endif;?> class="ace" value="<?php echo $k.'_'.$kkk.'_'.$kkkk;?>" name="Role[acl][]">
                                        <span class="lbl"><?php echo $vvvv;?></span>
                                    </label>
                                <?php endforeach;?>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            <?php endforeach;?>
                            </div>
                        </div>
                    <?php endforeach;?>
                <?php endforeach;?>
            </div>

            <div class="col-md-offset-3 col-md-9">
                <button type="submit" class="btn btn-info">
                    <i class="icon-ok bigger-110"></i>
                    提交
                </button>
            </div>
        </form>
    </div>
</div>