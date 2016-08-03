<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <title>电子商城</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="yiishop专注于电子商务应用开发，为中小企业提供全面的电子商务解决方案" name="description">
    <meta content="php,php项目,php开源项目,php开源商城,yii,yii项目,yii开源项目,yii开源商城,yii商城系统,yiishop,yiishop开源商城" name="keywords">
    <meta content="tank" name="author">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="/favicon.ico" rel="SHORTCUT ICON" type="image/ico">
    <!-- Fonts START -->
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/font_1.css" rel="stylesheet" type="text/css">
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/font_2.css" rel="stylesheet" type="text/css">
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/font_3.css" rel="stylesheet" type="text/css">
    <!-- Fonts END -->
    <!-- Global styles START -->
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
    <!-- Global styles END -->

    <!-- Page level plugin styles START -->
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/layerslider/css/layerslider.css" type="text/css">
    <!-- Page level plugin styles END -->
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">

    <!-- Theme styles START -->
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/style-metronic.css" rel="stylesheet" type="text/css">
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/style.css" rel="stylesheet" type="text/css">
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/style-responsive.css" rel="stylesheet" type="text/css">
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/custom.css" rel="stylesheet" type="text/css">
    <!-- Theme styles END -->

</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body>
<!-- BEGIN TOP BAR -->
<div class="pre-header">
    <div class="container">
        <div class="row">
            <!-- BEGIN TOP BAR LEFT PART -->
            <div class="col-md-6 col-sm-6 additional-shop-info">
                <ul class="list-unstyled list-inline">
                    <li><i class="fa fa-phone"></i><span>+400-400000</span></li>
                </ul>
            </div>
            <!-- END TOP BAR LEFT PART -->
            <!-- BEGIN TOP BAR MENU -->
            <div class="col-md-6 col-sm-6 additional-nav">
                <?php if ($this->username):?>
                    <ul class="list-unstyled list-inline pull-right">
                        <li>您好：<?php echo $this->username;?></li>
                        <li><a href="/account/logout">[退出]</a></li>
                        <li><a href="/account/index.html">我的帐号</a></li>
                        <li><a href="/order/index.html">我的订单</a></li>
                    </ul>
                <?php endif;?>
                <?php if (!$this->username): ?>
                    <ul class="list-unstyled list-inline pull-right">
                        <li><a href="/account/index.html">我的帐号</a></li>
                        <li><a href="/order/index.html">我的订单</a></li>
                        <li><a href="/account/login">登录</a></li>
                    </ul>
                <?php endif;?>
            </div>
            <!-- END TOP BAR MENU -->
        </div>
    </div>
</div>
<!-- END TOP BAR -->

<!-- BEGIN HEADER -->
<div role="navigation" class="navbar header no-margin">
<div class="container">
<div class="navbar-header">
    <!-- BEGIN RESPONSIVE MENU TOGGLER -->
    <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <!-- END RESPONSIVE MENU TOGGLER -->
    <a href="/" class="navbar-brand"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/img/logo_red.png" alt="Metronic Shop UI"></a><!-- LOGO -->
</div>
<!-- BEGIN CART -->
<div class="cart-block">
    <div class="cart-info">
        <a href="/cart/index.html" class="cart-info-count"><?php echo $this->cart['num']?$this->cart['num']:0;?> 个商品</a>
        <?php if ($this->cart['amount']):?>
        <a href="/cart/index.html" class="cart-info-value">￥<?php echo $this->cart['amount']?$this->cart['amount']:0.00;?></a>
        <?php endif;?>
    </div>
    <i class="fa fa-shopping-cart"></i>
    <!-- BEGIN CART CONTENT -->
    <div class="cart-content-wrapper">
        <?php if (isset($this->cart['item']) && $this->cart['item']):?>
        <div class="cart-content">

            <ul class="scroller" style="height: 250px;">
                <?php foreach ($this->cart['item'] as $v):?>
                <li>
                    <a href="/product.html?id=<?php echo $v['product_id'];?>" target="_blank">
                        <img src="<?php echo $this->img.$v['image'];?>" alt="<?php echo $v['product_name'];?>"
                             width="37" height="34">
                    </a>
                    <span class="cart-content-count">x <?php echo $v['quantity'];?></span>
                    <strong><a href="/product.html?id=<?php echo $v['product_id'];?>" target="_blank"><?php echo $v['product_name'];?></a></strong>
                    <em>￥<?php echo $v['price']*$v['quantity'];?></em>
                    <a href="javascript:void(0);" class="del-goods" onclick="cart_del(<?php echo $v['product_id'];?>);"><i class="fa fa-times"></i></a>
                </li>
                <?php endforeach;?>
            </ul>
            <div class="text-right">
                <a href="/cart/index.html" class="btn btn-default">查看购物车</a>
                <a href="/checkout/index.html" class="btn btn-primary">结算</a>
            </div>

        </div>
        <?php endif;?>
    </div>
    <!-- END CART CONTENT -->
</div>
<!-- END CART -->
<!-- BEGIN NAVIGATION -->
<div class="collapse navbar-collapse mega-menu">
<ul class="nav navbar-nav">
<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="product-list.html" href="product-list.html">
        全部分类
        <i class="fa fa-angle-down"></i>
    </a>
    <!-- BEGIN DROPDOWN MENU -->
    <ul class="dropdown-menu" aria-labelledby="mega-menu">
        <li>
            <div class="nav-content">
                <!-- BEGIN DROPDOWN MENU - COLUMN -->
                <?php foreach (Layouts::category() as $v):?>
                <?php if (isset($v['cat_name']) && $v['cat_name']):?>
                <div class="nav-content-col">
                    <h3><?php echo $v['cat_name'];?></h3>
                    <?php if ($v['child']):?>
                    <ul>
                        <?php foreach ($v['child'] as $vv):?>
                        <li><a href="/category.html?cid=<?php echo $vv['cat_id'];?>"><?php echo $vv['cat_name'];?></a></li>
                        <?php endforeach;?>
                    </ul>
                    <?php endif;?>
                </div>
                <?php endif;?>
                <?php endforeach;?>
                <!-- END DROPDOWN MENU - COLUMN -->
            </div>
        </li>
    </ul>
    <!-- END DROPDOWN MENU -->
</li>
<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" data-delay="0" data-close-others="false" data-target="product-list.html" href="product-list.html">
        促销商品
        <i class="fa fa-angle-down"></i>
    </a>
    <!-- BEGIN DROPDOWN MENU -->
    <ul class="dropdown-menu" aria-labelledby="mega-menu-catalogue">

        <li>
            <div class="nav-content">
                <?php foreach (Layouts::Recomman(10,3) as $row):?>
                <div class="product-item">
                    <div class="pi-img-wrapper">
                        <a href="/product.html?id=<?php echo $row['product_id'];?>">
                            <img src="<?php echo $this->img.$row['s_url']?>" class="img-responsive" alt="<?php echo $row['name'];?>">
                        </a>
                    </div>
                    <h3><a href="/product?id=<?php echo $row['product_id'];?>" target="_blank"><?php echo GlobalFunc::globalSubstr($row['name'],10);?></a></h3>
                    <div class="pi-price">￥<?php echo $row['price']?></div>
                    <a href="/cart.html" class="btn btn-default add2cart">加入购物车</a>
                </div>
                <?php endforeach;?>
            </div>
        </li>

    </ul>
    <!-- END DROPDOWN MENU -->
</li>
<li><a href="/category.html?cid=1">进口食品</a></li>
<li><a href="/category.html?cid=11">进口酒类</a></li>
<li><a href="/page/about.html">关于商城</a></li>
<li><a href="/admin.php">商城后台</a></li>
<!-- BEGIN TOP SEARCH -->
<li class="menu-search">
    <span class="sep"></span>
    <i class="fa fa-search search-btn"></i>
    <div class="search-box">
        <form action="#">
            <div class="input-group">
                <input type="text" placeholder="搜索关键字" class="form-control">
                <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit">搜索</button>
                </span>
            </div>
        </form>
    </div>
</li>
<!-- END TOP SEARCH -->
</ul>
</div>
<!-- END NAVIGATION -->
</div>
</div>
<!-- END HEADER -->
<?php echo $content;?>
<!-- BEGIN STEPS -->

<div class="steps3 steps3red">
    <div class="container">
        <div class="row">
            <div class="col-md-4 steps3-col">
                <i class="fa fa-truck"></i>
                <div>
                    <h2>关于发货</h2>
                    <em>每日下午5:00以前的顾客，均<br/>可以当天发货，5:00以后的顾<br/>客，次日发货。</em>
                </div>
                <span>&nbsp;</span>
            </div>
            <div class="col-md-4 steps3-col">
                <i class="fa fa-gift"></i>
                <div>
                    <h2>关于快递</h2>
                    <em>我们默认使用普通快递，如<br/>发其它快递、EMS，请联系我<br/>们在线客服！</em>
                </div>
                <span>&nbsp;</span>
            </div>
            <div class="col-md-4 steps3-col">
                <i class="fa fa-phone"></i>
                <div>
                    <h2>购物保障</h2>
                    <em>非质量问题的退货，请在收到<br/>宝贝后七天内联系客服，如属质<br/>量问题本商城承担运费。</em>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END STEPS -->

<!-- BEGIN PRE-FOOTER -->
<div class="pre-footer">
    <div class="container">
        <div class="row">
            <!-- BEGIN BOTTOM ABOUT BLOCK -->
            <div class="col-md-3 col-sm-6 pre-footer-col">
                <h2>关于我们</h2>
                <p>我们是一家拥有长期经营零售业务经验的网站；
                    我们将给您带来优质的商品及更优惠的价格；
                    多种付款方式以及快速的全国配送；
                    人性化的退换货事宜；
                    体贴入微的会员积分计划；
                    所有产品为原厂正规包装；</p>
            </div>
            <!-- END BOTTOM ABOUT BLOCK -->
            <!-- BEGIN BOTTOM INFO BLOCK -->
            <div class="col-md-3 col-sm-6 pre-footer-col">
                <h2>购物保障</h2>
                <ul class="list-unstyled">
                    <li><i class="fa fa-angle-right"></i> <a href="#">条款承诺</a></li>
                    <li><i class="fa fa-angle-right"></i> <a href="#">退换货政策</a></li>
                    <li><i class="fa fa-angle-right"></i> <a href="#">商品退换货流程</a></li>
                </ul>
            </div>
            <!-- END INFO BLOCK -->
            <!-- BEGIN TWITTER BLOCK -->
            <div class="col-md-3 col-sm-6 pre-footer-col">
                <h2>物流配送</h2>
                <ul class="list-unstyled">
                    <li><i class="fa fa-angle-right"></i> <a href="#">配送标准</a></li>
                    <li><i class="fa fa-angle-right"></i> <a href="#">包裹查询</a></li>
                    <li><i class="fa fa-angle-right"></i> <a href="#">送货方式</a></li>
                </ul>
            </div>
            <!-- END TWITTER BLOCK -->
            <!-- BEGIN BOTTOM CONTACTS -->
            <div class="col-md-3 col-sm-6 pre-footer-col">
                <h2>新手上路</h2>
                <ul class="list-unstyled">
                    <li><i class="fa fa-angle-right"></i> <a href="#">新用户注册</a></li>
                    <li><i class="fa fa-angle-right"></i> <a href="#">用户登录</a></li>
                    <li><i class="fa fa-angle-right"></i> <a href="#">找回密码</a></li>
                </ul>
            </div>
            <!-- END BOTTOM CONTACTS -->
        </div>
    </div>
</div>
<!-- END PRE-FOOTER -->

<!-- BEGIN FOOTER -->
<div class="footer padding-top-15">
    <div class="container">
        <div class="row">
            <!-- BEGIN COPYRIGHT -->
            <div class="col-md-6 col-sm-6 padding-top-10">
                2015 © 版权所有，并保留所有权利.
            </div>
            <!-- END COPYRIGHT -->
            <!-- BEGIN PAYMENTS -->
            <div class="col-md-6 col-sm-6">
                <ul class="list-unstyled list-inline pull-right margin-bottom-15">
                    <li><img src="<?php echo Yii::app()->theme->baseUrl; ?>/img/payments/western-union.jpg" alt="We accept Western Union" title="We accept Western Union"></li>
                </ul>
            </div>
            <!-- END PAYMENTS -->
        </div>
    </div>
</div>
<!-- END FOOTER -->
<!--[if lt IE 9]>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/respond.min.js"></script>
<![endif]-->
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/back-to-top.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
<!-- END CORE PLUGINS -->
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>

<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
<script type="text/javascript" src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/fancybox/source/jquery.fancybox.pack.js"></script><!-- pop up -->
<script type="text/javascript" src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/bxslider/jquery.bxslider.min.js"></script><!-- slider for products -->
<script type="text/javascript" src='<?php echo Yii::app()->theme->baseUrl; ?>/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->

<!-- BEGIN LayerSlider -->
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/layerslider/jQuery/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/layerslider/jQuery/jquery-transit-modified.js" type="text/javascript"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/layerslider/js/layerslider.transitions.js" type="text/javascript"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/layerslider/js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>
<!-- END LayerSlider -->

<!-- BEGIN layer -->
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/layer/layer.min.js" type="text/javascript"></script>
<!-- END layer -->
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>

<script type="text/javascript" src="<?php echo Yii::app()->theme->baseUrl; ?>/scripts/app.js"></script>
<script type="text/javascript" src="<?php echo Yii::app()->theme->baseUrl; ?>/scripts/index.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        App.init();
        App.initBxSlider();
        Index.initLayerSlider();
        App.initImageZoom();
        App.initTouchspin();
        App.initUniform();
    });
</script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>