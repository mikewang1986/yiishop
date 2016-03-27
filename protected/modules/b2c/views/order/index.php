<div class="container">
    <ul class="breadcrumb">
        当前位置：
        <li><a href="/"> 首页</a></li>
        <li><a href="/account/index.html">会员中心</a></li>
        <?php if ($model['pay_status'] != 'false'):?>
        <li><a href="/order/index.html">我的订单</a></li>
        <?php else:?>
        <li class="active">我的订单</li>
        <?php endif;?>
        <?php if ($model['pay_status'] != 'false'):?>
            <li class="active"><?php echo Yii::app()->params['pay_status'][$model['pay_status']];?>订单</li>
        <?php endif;?>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row">
        <!-- BEGIN SIDEBAR -->
        <?php echo $this->renderPartial('/common/_left_profile');?>
        <!-- END SIDEBAR -->

        <!-- BEGIN CONTENT -->

        <div class="col-md-10">
            <div class="col-md-6">
                <h3>我的订单</h3>
            </div>
            <div class="col-md-12 portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-advance table-hover">
                        <thead>
                        <tr>
                            <th>订单号</th>
                            <th>商品</th>
                            <th>金额</th>
                            <th>下单时间</th>
                            <th>订单状态</th>
                            <th>支付方式</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if ($model['order_list']):?>
                        <?php foreach ($model['order_list'] as $v):?>
                            <tr>
                                <td>
                                    <a href="/order/detail.html?order_id=<?php echo $v['order_id'];?>">
                                        <?php echo $v['order_id'];?>
                                    </a>
                                </td>
                                <td>
                                    <?php foreach ($v['product'] as $vv):?>
                                        <a href="/product.html?id=<?php echo $vv['product_id'];?>" target="_blank">
                                            <img style="width: 50px;height: 50px;" src="<?php echo $this->img.$vv['image'];?>" alt="<?php echo $vv['name'];?>">
                                        </a>
                                    <?php endforeach;?>
                                </td>
                                <td>
                                    <?php echo $v['final_amount'];?>
                                </td>
                                <td>
                                    <?php echo $v['createtime'];?>
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
                        <?php endif;?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>