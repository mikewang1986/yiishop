<div class="container">
    <ul class="breadcrumb">
        当前位置：
        <li><a href="/">首页</a></li>
        <li><a href="/account/index.html">会员中心</a></li>
        <li><a href="/order/index.html">我的订单</a></li>
        <li class="active">订单详情-<?php echo $model['order_info']['order_id'];?></li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
        <!-- BEGIN SIDEBAR -->
        <?php echo $this->renderPartial('/common/_left_profile');?>
        <!-- END SIDEBAR -->

        <!-- BEGIN 订单状态 -->
        <div class="col-md-9">
            <div class="tabbable tabbable-custom tabbable-custom-profile">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab">
                            订单状态
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab_1_11" class="tab-pane active">
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <tbody>
                                    <tr>
                                        <td class="col-sm-3 text-align-right">订单号：</td>
                                        <td><?php echo $model['order_info']['order_id'];?></td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-3 text-align-right">订单状态：</td>
                                        <td><?php echo Yii::app()->params['order_status'][$model['order_info']['status']];?></td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-3 text-align-right">付款状态：</td>
                                        <td><?php echo Yii::app()->params['pay_status'][$model['order_info']['pay_status']];?></td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-3 text-align-right">配送状态：</td>
                                        <td><?php echo Yii::app()->params['ship_status'][$model['order_info']['ship_status']];?></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END 订单状态 -->

        <!-- BEGIN 订单商品 -->
        <div class="col-md-2"></div>
        <div class="col-md-9">
            <div class="tabbable tabbable-custom tabbable-custom-profile">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab">
                            商品列表
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab_1_11" class="tab-pane active">
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <thead>
                                    <tr>
                                        <th class="checkout-image">图片</th>
                                        <th class="checkout-description">详情</th>
                                        <th class="checkout-model">规格</th>
                                        <th class="checkout-quantity">数量</th>
                                        <th class="checkout-price">单价</th>
                                        <th class="checkout-total">总价</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($model['order_product'] as $v):?>
                                    <tr>
                                        <td>
                                            <a href="/product.html?id=<?php echo $v['product_id'];?>" target="_blank">
                                                <img style="width: 50px;height: 50px;" src="<?php echo $this->img.$v['image'];?>" alt="Berry Lace Dress">
                                            </a>
                                        </td>
                                        <td>
                                            <a href="/product.html?id=<?php echo $v['product_id'];?>" target="_blank"><?php echo $v['name'];?></a>
                                            <!--
                                            <p><strong>Item 1</strong> - Color: Green; Size: S</p>
                                            <em>More info is here</em>
                                            -->
                                        </td>
                                        <td></td>
                                        <td>
                                            <?php echo $v['nums'];?>
                                        </td>
                                        <td>
                                            <strong><span>￥</span><?php echo $v['price'];?></strong>
                                        </td>
                                        <td>
                                            <strong><span>￥</span><?php echo $v['price']*$v['nums'];?></strong>
                                        </td>
                                    </tr>
                                <?php endforeach;?>
                                    <tr>
                                        <td colspan="6" class="text-align-right">
                                            <em>商品总计</em>
                                            <strong class="price"><span>￥</span><?php echo $model['order_info']['cost_item'];?></strong>
                                            <em>物流费用</em>
                                            <strong class="price"><span>￥</span><?php echo $model['order_info']['cost_freight'];?></strong>
                                            <em>总价</em>
                                            <strong class="price"><span>￥</span><?php echo $model['order_info']['final_amount'];?></strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END 订单商品 -->

        <!-- BEGIN 收货人信息 -->
        <div class="col-md-2"></div>
        <div class="col-md-9">
            <div class="tabbable tabbable-custom tabbable-custom-profile">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab">
                            收货人信息
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab_1_11" class="tab-pane active">
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <tbody>
                                <tr>
                                    <td class="col-sm-3 text-align-right">收货人姓名：</td>
                                    <td><?php echo $model['order_info']['ship_name'];?></td>
                                </tr>
                                <tr>
                                    <td class="col-sm-3 text-align-right">详细地址：</td>
                                    <td><?php echo $model['order_info']['ship_addr'];?></td>
                                </tr>
                                <tr>
                                    <td class="col-sm-3 text-align-right">手机：</td>
                                    <td><?php echo $model['order_info']['ship_mobile'];?></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END   收货人信息 -->

        <!-- BEGIN 其他信息 -->
        <div class="col-md-2"></div>
        <div class="col-md-9">
            <div class="tabbable tabbable-custom tabbable-custom-profile">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-toggle="tab">
                            其他信息
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab_1_11" class="tab-pane active">
                        <div class="portlet-body">
                            <table class="table table-striped table-bordered table-advance table-hover">
                                <tbody>
                                <tr>
                                    <td class="col-sm-3 text-align-right">支付方式：</td>
                                    <td><?php echo Yii::app()->params['payment_name'][$model['order_info']['payment']];?></td>
                                </tr>
                                <tr>
                                    <td class="col-sm-3 text-align-right">配送方式：</td>
                                    <td><?php echo $model['order_info']['shipping'];?></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END   其他信息 -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>