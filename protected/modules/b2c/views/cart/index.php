<div class="container">
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
        <!-- BEGIN CONTENT -->
        <div class="col-md-12 col-sm-12">
            <h1>购物车列表</h1>
            <div class="shopping-cart-page">
                <div class="shopping-cart-data clearfix">
                    <div class="table-wrapper-responsive">
                        <table summary="Shopping cart">
                            <tr>
                                <th class="shopping-cart-image">图片</th>
                                <th class="shopping-cart-description">详情</th>
                                <th class="shopping-cart-ref-no">规格</th>
                                <th class="shopping-cart-quantity">数量</th>
                                <th class="shopping-cart-price">单价</th>
                                <th class="shopping-cart-total" colspan="2">总价</th>
                            </tr>
                            <?php foreach ($item as $v):?>
                            <tr>
                                <td class="shopping-cart-image">
                                    <a href="/product.html?id=<?php echo $v['product_id'];?>" target="_blank">
                                        <img src="<?php echo $this->img.$v['image'];?>" alt="Berry Lace Dress">
                                    </a>
                                </td>
                                <td class="shopping-cart-description">
                                    <h3><a href="/product.html?id=<?php echo $v['product_id'];?>" target="_blank"><?php echo $v['product_name'];?></a></h3>
                                    <!--
                                    <p><strong>Item 1</strong> - Color: Green; Size: S</p>
                                    <em>More info is here</em>
                                    -->
                                </td>
                                <td class="shopping-cart-ref-no">

                                </td>
                                <td class="shopping-cart-quantity">
                                    <div class="product-quantity">
                                        <input id="product-quantity" type="text" value="<?php echo $v['quantity'];?>" data="<?php echo $v['product_id'];?>" readonly class="form-control input-sm">
                                    </div>
                                </td>
                                <td class="shopping-cart-price">
                                    <strong><span>￥</span><?php echo $v['price'];?></strong>
                                </td>
                                <td class="shopping-cart-total">
                                    <strong><span>￥</span><?php echo $v['price']*$v['quantity'];?></strong>
                                </td>
                                <td class="del-goods-col">
                                    <a class="del-goods" href="javascript:;" onclick="cart_del(<?php echo $v['product_id'];?>);"><i class="fa fa-times"></i></a>
                                </td>
                            </tr>
                            <?php endforeach;?>
                        </table>
                    </div>

                    <div class="shopping-total">
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
                </div>
                <a class="btn btn-default" href="/">继续购物 <i class="fa fa-shopping-cart"></i></a>
                <a class="btn btn-primary" href="/checkout/index.html">结算 <i class="fa fa-check"></i></a>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->

    <!-- BEGIN SIMILAR PRODUCTS -->
    <?php echo $this->renderPartial('/common/_foot_popular');?>
    <!-- END SIMILAR PRODUCTS -->
</div>