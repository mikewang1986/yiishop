<div id="checkout-page" class="panel-group checkout-page accordion scrollable">
    <!-- BEGIN CONFIRM -->
    <div class="panel panel-default" id="confirm">
        <div class="panel-heading">
            <h2 class="panel-title">
                <a class="accordion-toggle" href="#confirm-content" data-parent="#checkout-page" data-toggle="collapse">
                    商品列表
                </a>
            </h2>
        </div>
        <div class="panel-collapse collapse in" id="confirm-content" style="height: auto;">
            <div class="panel-body row">
                <div class="col-md-12 clearfix">
                    <div class="table-wrapper-responsive">
                        <table>
                            <tbody><tr>
                                <th class="checkout-image">图片</th>
                                <th class="checkout-description">详情</th>
                                <th class="checkout-model">规格</th>
                                <th class="checkout-quantity">数量</th>
                                <th class="checkout-price">单价</th>
                                <th class="checkout-total">总价</th>
                            </tr>
                            <?php foreach ($item as $v):?>
                                <tr>
                                    <td class="shopping-image">
                                        <a href="/product.html?id=<?php echo $v['product_id'];?>" target="_blank">
                                            <img style="width: 100px;height: 100px;" src="<?php echo $this->img.$v['image'];?>" alt="Berry Lace Dress">
                                        </a>
                                    </td>
                                    <td class="checkout-description">
                                        <h3><a href="/product.html?id=<?php echo $v['product_id'];?>" target="_blank"><?php echo $v['product_name'];?></a></h3>
                                        <!--
                                        <p><strong>Item 1</strong> - Color: Green; Size: S</p>
                                        <em>More info is here</em>
                                        -->
                                    </td>
                                    <td class="checkout-model"></td>
                                    <td class="checkout-quantity">
                                        <?php echo $v['quantity'];?>
                                    </td>
                                    <td class="checkout-price">
                                        <strong><span>￥</span><?php echo $v['price'];?></strong>
                                    </td>
                                    <td class="checkout-total">
                                        <strong><span>￥</span><?php echo $v['price']*$v['quantity'];?></strong>
                                    </td>
                                </tr>
                            <?php endforeach;?>
                            </tbody>
                        </table>
                    </div>
                    <div class="checkout-total-block">
                        <ul>
                            <li>
                                <em>商品总计</em>
                                <strong class="price"><span>￥</span><?php echo $amount;?></strong>
                            </li>
                            <li>
                                <em>物流费</em>
                                <strong class="price"><span>￥</span>5.00</strong>
                            </li>
                            <li class="shopping-total-price">
                                <em>总价</em>
                                <strong class="price"><span>￥</span><?php echo $amount+5.00;?></strong>
                            </li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                    <button id="button-confirm" type="submit" class="btn btn-primary pull-right" onclick="location.href='/checkout/submit'">提交订单</button>
                    <button class="btn btn-default pull-right margin-right-20" type="button" onclick="location.href='/'">继续购物</button>
                </div>
            </div>
        </div>
    </div>
    <!-- END CONFIRM -->
</div>