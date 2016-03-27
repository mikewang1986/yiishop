<div id="checkout-page" class="panel-group checkout-page accordion scrollable">
    <div class="panel panel-default" id="payment-address">
        <div class="panel-heading">
            <h2 class="panel-title">
                <a class="accordion-toggle" href="#payment-address-content" data-parent="#checkout-page" data-toggle="collapse">
                    收货人信息
                </a>

            </h2>
        </div>
        <div class="panel-collapse collapse in" id="payment-address-content" style="height: auto;">
            <div class="panel-body row form-horizontal">
                <div>
                    <div class="form-group">
                        <div class="col-md-5 control-label">
                            <label class="">收货人姓名：</label><?php echo $addr_row['name'];?>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-5 control-label">
                            <label class="">详细地址：</label><?php echo $addr_row['area'].$addr_row['addr'];?>
                        </div>
                        <div class="col-md-4 control-label">
                            <label class="">邮政编码：<?php echo $addr_row['zip'];?></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-5 control-label">
                            <label class="">电话：<?php echo $addr_row['tel'];?></label>
                        </div>
                        <div class="col-md-4 control-label">
                            <label class="">手机：<?php echo $addr_row['mobile'];?></label>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary collapsed" onclick="location.href='/addr/update.html?addr_id=<?php echo $addr_row['addr_id'];?>&f=1'">
                    修改
                </button>
            </div>
        </div>
    </div>
</div>