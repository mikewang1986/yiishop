<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/datepicker.css" />
<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/daterangepicker.css" />
<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/colorpicker.css" />
<style>
    .form-group{margin-bottom: 5px;}
    .modal-dialog{width: 60%;}
    .billContainer2 {
        border: 1px solid #cfcfcf;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        margin-bottom: 5px;
        padding: 10px 20px 10px 20px;
    }
    .btn-sm {
        border-width: 4px;
        font-size: 13px;
        line-height: 1.39;
        padding: 1px 5px;
    }
    .dataTables_wrapper input[type=text], .dataTables_wrapper select{margin: 0px;}
</style>
<form action="" method="get" class="filter-form">
    <input type="hidden" name="r" value="order/default/index">
    <input type="hidden" name="view" value="<?php echo $view;?>">
    <div class="row">
        <div class="col-sm-2 form-group">
            <label class="control-label no-padding-right"> 订单号: <input type="text" name="Order[order_id]" value="<?php echo isset($params['order_id'])?$params['order_id']:'';?>"></label>
        </div>

        <div class="col-sm-8 form-group">
            <label class="col-sm-1 control-label no-padding-right"> 下单时间: </label>
            <div class="col-sm-5">
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="icon-calendar bigger-110"></i>
                    </span>
                    <input type="text" value="<?php echo isset($params['start_date'])&&$params['start_date']?date('Y-m-d',strtotime($params['start_date'])):'';?>" name="Order[start_date]" class="form-control date">
                    <span class="input-group-addon">
                        <i class="icon-time bigger-110"></i>
                    </span>
                    <div class="bootstrap-timepicker">
                        <input type="text" value="<?php echo isset($params['start_time'])&&$params['start_time']?date('H:i:s',strtotime($params['start_time'])):'00:00:00';?>" class="form-control time" id="timepicker_start" name="Order[start_time]">
                    </div>
                </div>
            </div>
            <label class="col-sm-1" style="width: 1%;padding-left:1px;">~</label>
            <div class="col-sm-5">
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="icon-calendar bigger-110"></i>
                    </span>
                    <input type="text" value="<?php echo isset($params['end_date'])&&$params['end_date']?date('Y-m-d',strtotime($params['end_date'])):'';?>" name="Order[end_date]" class="form-control date">
                    <span class="input-group-addon">
                        <i class="icon-time bigger-110"></i>
                    </span>
                    <div class="bootstrap-timepicker">
                        <input type="text" value="<?php echo isset($params['end_time'])&&$params['end_time']?date('H:i:s',strtotime($params['end_time'])):'23:59:59';?>" class="form-control time" id="timepicker_end" name="Order[end_time]">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-2 actionsBtn btn-group">
            <button type="submit" class="btn btn-sm btn-primary goods_filter">
                查询
            </button>
            <button type="reset" class="btn btn-sm btn-primary form-reset">
                清空
            </button>
        </div>
    </div>
</form>