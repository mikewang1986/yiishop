<div class="container">
    <ul class="breadcrumb">
        <li><a href="/">首页</a></li>
        <li><a href="">购物流程</a></li>
        <li class="active">购物确认</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
        <!-- BEGIN CONTENT -->
        <div class="col-md-12 col-sm-12">
            <h1>填写核对订单</h1>
            <!-- 收货地址 -->
            <?php echo $this->renderPartial('checkout/_address',array('addr_row'=>$addr_row));?>

            <!-- 配送方式 -->
            <?php echo $this->renderPartial('checkout/_dlytype',array('dly'=>$dly));?>

            <!-- 支付方式 -->
            <?php echo $this->renderPartial('checkout/_payment');?>

            <!-- 商品列表 -->
            <?php echo $this->renderPartial('checkout/_goods_list',array(
                'item'=>$item,
                'num'=>$num,
                'amount'=>$amount,
            ));?>
        </div>
    <!-- END CHECKOUT PAGE -->
    </div>
<!-- END CONTENT -->
</div>