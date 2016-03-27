<form action="" method="get">
    <input type="hidden" name="r" value="user/member/index">
    <div class="row">
        <div class="col-sm-2 form-group">
            <label class="control-label no-padding-right"> 用户名: <input type="text" class="goods_bn" name="Members[name]" value="<?php echo isset($params['name'])?$params['name']:'';?>"></label>
        </div>
        <div class="col-sm-3 form-group">
            <label class="control-label no-padding-right"> 手机号码: <input type="text" class="goods_name" name="Members[mobile]" value="<?php echo isset($params['mobile'])?$params['mobile']:'';?>"></label>
        </div>
        <div class="col-sm-2 form-group">
            <label class="control-label no-padding-right"> 状态:
                <select class="sales_price" name="Members[disabled]">
                    <option value="0">全部会员</option>
                    <?php foreach ($this->filter['disabled'] as $k=>$v):?>
                        <option value="<?php echo $k;?>" <?php echo isset($params['disabled'])&&$params['disabled']==$k?'selected':'';?>><?php echo $v;?></option>
                    <?php endforeach;?>
                </select>
            </label>
        </div>
        <div class="col-sm-2 form-group">
            <label class="control-label no-padding-right"> 会员等级:

                <select class="sales_price" name="Members[member_lv_id]">
                    <option value="0">全部等级</option>
                    <?php foreach ($this->filter['member_lv_id'] as $k=>$v):?>
                        <option value="<?php echo $k;?>" <?php echo isset($params['member_lv_id'])&&$params['member_lv_id']==$k?'selected':'';?>><?php echo $v;?></option>
                    <?php endforeach;?>
                </select>
            </label>
        </div>
        <div class="col-sm-2 actionsBtn btn-group">
            <button type="submit" class="btn btn-sm btn-primary goods_filter">
                查询
            </button>
        </div>
    </div>
</form>