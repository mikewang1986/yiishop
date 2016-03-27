<?php
$this->breadcrumbs=array(
    '会员管理'=>array('/user/member'),
    '商品列表'=>array('/user/member'),
    '编辑-'.$member_info['name']
);
?>
<div class="page-header">
    <h1>
        编辑会员
    </h1>
</div>
<div class="row">
    <div class="col-xs-12">
        <form id="validation-form" action="?r=user/member/update" class="form-horizontal" method="post" novalidate="novalidate">
            <div class="billContainer">
                <div class="form-group">
                    <label for="name" class="control-label col-xs-12 col-sm-3 no-padding-right">用户名</label>
                    <div class="col-sm-9">
                        <input type="text" class="col-xs-12 col-sm-5" value="<?php echo isset($member_info['login_account'])?$member_info['login_account']:'';?>" name="Members[login_account]" id="login_account">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="control-label col-xs-12 col-sm-3 no-padding-right">邮箱</label>
                    <div class="col-sm-9">
                        <input type="text" class="col-xs-12 col-sm-5" value="<?php echo isset($member_info['email'])?$member_info['email']:'';?>" name="Members[email]" id="email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="control-label col-xs-12 col-sm-3 no-padding-right">手机号码</label>
                    <div class="col-sm-9">
                        <input type="text" class="col-xs-12 col-sm-5" value="<?php echo isset($member_info['mobile'])?$member_info['mobile']:'';?>" name="Members[mobile]" id="mobile">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="control-label col-xs-12 col-sm-3 no-padding-right">会员等级</label>
                    <div class="col-sm-3">
                        <select id="goods_type" class="form-control" name="Members[member_lv_id]">
                            <option value="">请选择</option>
                            <?php if (isset($member_info['member_lv_id']) && $member_info['member_lv_id']):?>
                                <?php foreach ($member_lv_list as $k=>$v):?>
                                    <option value="<?php echo $v['member_lv_id'];?>" <?php echo isset($member_info['member_lv_id'])&&$member_info['member_lv_id']==$k?'selected':'';?>><?php echo $v['name'];?></option>
                                <?php endforeach;?>
                            <?php endif;?>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="control-label col-xs-12 col-sm-3 no-padding-right">姓名</label>
                    <div class="col-sm-9">
                        <input type="text" class="col-xs-12 col-sm-5" value="<?php echo isset($member_info['name'])?$member_info['name']:'';?>" name="Members[name]" id="name">
                    </div>
                </div>
                <div class="form-group" id="area">
                    <label for="name" class="control-label col-xs-12 col-sm-3 no-padding-right">地区</label>
                    <div class="col-sm-3">
                        <select style="width: 100px;inline-block;" id="consigneePr" name="consigneePr">
                            <?php foreach ($area_list['province'] as $v):?>
                                <option value="<?php echo $v['region_id'];?>" <?php if (isset($area_list['province_id']) && $v['region_id'] == $area_list['province_id']):?>selected="selected" <?php endif;?>>
                                    <?php echo $v['local_name'];?>
                                </option>
                            <?php endforeach;?>
                        </select>
                        <?php if(isset($area_list['city'])):?>
                            <select style="width: 100px;inline-block;" id="consigneeCity" name="consigneeCity" >
                                <option value="">请选择城市</option>
                                <?php foreach ($area_list['city'] as $v):?>
                                    <option value="<?php echo $v['region_id'];?>" <?php if ($v['region_id'] == $area_list['city']):?>selected="selected" <?php endif;?>>
                                        <?php echo $v['local_name'];?>
                                    </option>
                                <?php endforeach;?>

                            </select>
                        <?php endif;?>
                        <?php if (isset($area_list['down'])):?>
                            <select style="width: 100px;;inline-block;" id="consigneeArea" name="consigneeArea" style="inline-block;">
                                <?php foreach ($area_list['down'] as $v):?>
                                    <option value="<?php echo $v['region_id']?>" <?php if ($v['region_id'] == $area_list['down']):?>selected="selected" <?php endif;?>>
                                        <?php echo $v['local_name'];?>
                                    </option>
                                <?php endforeach;?>
                            </select>
                        <?php endif;?>
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="control-label col-xs-12 col-sm-3 no-padding-right">联系地址</label>
                    <div class="col-sm-9">
                        <input type="text" class="col-xs-12 col-sm-5" value="<?php echo isset($member_info['addr'])?$member_info['addr']:'';?>" name="Members[addr]" id="addr">
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="control-label col-xs-12 col-sm-3 no-padding-right">性别</label>
                    <div class="col-sm-3">
                            <label>
                        <input type="radio" class="ace" name="Members[sex]" value="1" <?php if ($member_info['sex'] == 1):?>checked<?php endif;?>>
                                <span class="lbl">男 </span>
                                </label>
                        <label>
                        <input type="radio" class="ace" name="Members[sex]" value="0" <?php if ($member_info['sex'] == 0):?>checked<?php endif;?>>
                            <span class="lbl">女 </span>
                        </label>
                    </div>
                </div>
                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-info">
                            <i class="icon-ok bigger-110"></i>
                            提交
                        </button>

                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="<?php echo Yii::app()->theme->baseUrl; ?>/scripts/index.js"></script>








