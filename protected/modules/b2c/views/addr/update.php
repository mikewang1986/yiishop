<div class="container">
    <ul class="breadcrumb">
        当前位置：
        <li><a href="/">首页</a></li>
        <li><a href="/account/index.html">会员中心</a></li>
        <li><a href="/addr/index.html">收货地址</a></li>
        <li class="active">修改收货地址</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row">
        <!-- BEGIN SIDEBAR -->
        <?php echo $this->renderPartial('/common/_left_profile');?>
        <!-- END SIDEBAR -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-6">
            <div class="panel panel-warning">
                <div class="panel-heading"><h3 class="panel-title">收货地址</h3></div>
                <div class="panel-body">
                    <form class="form-horizontal form-addr" method="post" action="/addr/update?addr_id=<?php echo $model['addr_id'];?>">
                        <div class="form-body">
                            <div class="form-group" id="area">
                                <label class="col-md-3 control-label">收货地区</label>
                                <div class="col-md-3">
                                    <select class="form-control input-sm" id="consigneePr">
                                        <option value="0">--请选择省--</option>
                                        <?php foreach ($model['area']['province'] as $v):?>
                                            <option value="<?php echo $v['region_id'];?>"
                                                <?php echo $v['region_id']==$model['area']['province_id']?'selected':'';?>
                                                >
                                                <?php echo $v['local_name'];?>
                                            </option>
                                        <?php endforeach;?>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-control input-sm" id="consigneeCity">
                                        <option value="0">--请选择市--</option>
                                        <?php foreach ($model['area']['city'] as $v):?>
                                            <option value="<?php echo $v['region_id'];?>"
                                                <?php echo $v['region_id']==$model['area']['city_id']?'selected':'';?>
                                                >
                                                <?php echo $v['local_name'];?>
                                            </option>
                                        <?php endforeach;?>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-control input-sm" id="consigneeArea" name="consigneeArea">
                                        <option value="0">请选择县</option>
                                        <?php foreach ($model['area']['town'] as $v):?>
                                            <option value="<?php echo $v['region_id'];?>"
                                                <?php echo $v['region_id']==$model['area']['town_id']?'selected':'';?>
                                                >
                                                <?php echo $v['local_name'];?>
                                            </option>
                                        <?php endforeach;?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">详细地址</label>
                                <div class="col-md-9">
                                    <input type="text" placeholder="详细地址" id="consigneeAd" class="form-control input-sm" value="<?php echo $model['addr'];?>" name="consigneeAd">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">邮编</label>
                                <div class="col-md-3">
                                    <input type="text" placeholder="邮编" id="consigneePD" class="form-control input-sm" value="<?php echo $model['zip'];?>" name="consigneePD">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">收货人姓名</label>
                                <div class="col-md-3">
                                    <input type="text" placeholder="收货人姓名" id="consignee" class="form-control input-sm" value="<?php echo $model['name'];?>" name="consignee">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">手机</label>
                                <div class="col-md-3">
                                    <input type="text" placeholder="手机" id="consigneeNo" class="form-control input-sm" value="<?php echo $model['mobile'];?>" name="consigneeNo">
                                </div>
                            </div>

                        </div>
                        <div class="col-md-offset-4 col-md-8">
                            <button class="btn default" type="button">重置</button>
                            <button class="btn blue" type="submit">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>