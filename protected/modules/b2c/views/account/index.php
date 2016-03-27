<div class="container">
    <ul class="breadcrumb">
        当前位置：
        <li><a href="/account/index.html">会员中心</a></li>
        <li class="active">我的账号</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
        <!-- BEGIN SIDEBAR -->
        <?php echo $this->renderPartial('/common/_left_profile');?>
        <!-- END SIDEBAR -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-collapse collapse  in">
                    <div class="form-info">
                        <h2>您好 <em >test123</em>，欢迎进入会员中心</h2>
                        <ul class="list-inline">
                            <li>
                                <i class="fa fa-map-marker"></i>
                                <a href="/order/index.html?pay_status=0">未付款订单</a>
                            </li>
                            <li>
                                <i class="fa fa-briefcase"></i> 到货通知
                            </li>
                            <li>
                                <i class="fa fa-star"></i> 评论回复
                            </li>
                            <li>
                                <i class="fa fa-heart"></i> 咨询回复
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="tabbable tabbable-custom tabbable-custom-profile">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab" href="#tab_1_11">
                            最近的订单
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab_1_11" class="tab-pane active">
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <thead>
                                    <tr>
                                        <th>订单号</th>
                                        <th>金额</th>
                                        <th>下单时间</th>
                                        <th>订单状态</th>
                                        <th>支付方式</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($model['order_list'] as $v):?>
                                <tr>
                                    <td>
                                        <a href="/order/detail.html?order_id=<?php echo $v['order_id'];?>">
                                            <?php echo $v['order_id'];?>
                                        </a>
                                    </td>
                                    <td>
                                        <?php echo $v['final_amount'];?>
                                    </td>
                                    <td>
                                        <?php echo date('Y-m-d H:i:s',$v['createtime']);;?>
                                    </td>
                                    <td>
                                        <?php echo Yii::app()->params['order_status'][$v['status']];?>
                                    </td>
                                    <td>
                                        <?php echo  Yii::app()->params['pay_status'][$v['pay_status']];?>
                                    </td>
                                    <td>
                                        <?php if ($v['status'] == 'active' && $v['pay_status'] == 0):?>
                                            <a href="">取消</a>
                                        <?php endif;?>
                                    </td>
                                </tr>
                                <?php endforeach;?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>