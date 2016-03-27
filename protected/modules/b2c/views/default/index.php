<div class="container">
    <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
    <div class="row margin-bottom-40">
        <!-- BEGIN SALE PRODUCT -->
        <div class="col-md-12 sale-product">
            <h2>最新上架</h2>
            <div class="bxslider-wrapper">
                <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="5" data-slide-margin="15">
                    <?php foreach ($model['new_list'] as $v):?>
                    <?php echo $this->renderPartial('/common/_detail',array('row'=>$v));?>
                    <?php endforeach;?>
                </ul>
            </div>
        </div>
        <!-- END SALE PRODUCT -->
    </div>
    <!-- END SALE PRODUCT & NEW ARRIVALS -->

    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40 ">
        <!-- BEGIN SIDEBAR -->
        <div class="sidebar col-md-3 col-sm-4">
            <ul class="list-group margin-bottom-25 sidebar-menu">
                <?php foreach ($model['cat_list'] as $k=>$v):?>
                <?php if (isset($v['cat_name']) && $v['cat_name']):?>
                <li class="list-group-item clearfix <?php if ($v['child']):?>dropdown<?php endif;?>">
                    <a href="<?php echo $v['child']?'javascript:void(0);':'/category.html?cid='.$v['cat_id'];?>" <?php if ($k==1):?>class="collapsed" <?php endif;?>>
                        <i class="fa fa-angle-right"></i>
                        <?php echo $v['cat_name'];?>
                        <i class="fa fa-angle-down"></i>
                    </a>
                    <?php if ($v['child']):?>
                    <ul class="dropdown-menu" <?php if ($k == 1):?>style="display: block;" <?php endif;?>>
                        <?php foreach ($v['child'] as $vv):?>
                        <li class="list-group-item">
                            <a href="/category.html?cid=<?php echo $vv['cat_id'];?>">
                                <i class="fa fa-circle"></i> <?php echo $vv['cat_name'];?> <i class="fa"></i>
                            </a>
                        </li>
                        <?php endforeach;?>
                    </ul>
                    <?php endif;?>
                </li>
                <?php endif;?>
                <?php endforeach;?>
            </ul>
        </div>
        <!-- END SIDEBAR -->
        <!-- BEGIN CONTENT -->
        <div class="col-md-9 col-sm-8">
            <h2>每日精选</h2>
            <div class="bxslider-wrapper">
                <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="3" data-slide-margin="15">
                    <?php foreach (Layouts::Recomman(10,3) as $v):?>
                        <?php echo $this->renderPartial('/common/_detail',array('row'=>$v));?>
                    <?php endforeach;?>
                </ul>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->

    <!-- BEGIN TWO PRODUCTS & PROMO -->
    <div class="row margin-bottom-35 ">
        <!-- BEGIN TWO PRODUCTS -->
        <div class="col-md-6 two-items-bottom-items">
            <h2>热卖商品</h2>
            <div class="bxslider-wrapper">
                <ul class="bxslider" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="2" data-slide-margin="15">
                    <?php foreach (Layouts::Recomman(11,2) as $v):?>
                        <?php echo $this->renderPartial('/common/_detail',array('row'=>$v));?>
                    <?php endforeach;?>
                </ul>
            </div>
        </div>
        <!-- END TWO PRODUCTS -->
        <!-- BEGIN PROMO -->
        <div class="col-md-6">
            <div class="content-slider">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="<?php echo Yii::app()->theme->baseUrl; ?>/temp/index-sliders/slide1.jpg" class="img-responsive" alt="Berry Lace Dress">
                        </div>
                        <div class="item">
                            <img src="<?php echo Yii::app()->theme->baseUrl; ?>/temp/index-sliders/slide2.jpg" class="img-responsive" alt="Berry Lace Dress">
                        </div>
                        <div class="item">
                            <img src="<?php echo Yii::app()->theme->baseUrl; ?>/temp/index-sliders/slide3.jpg" class="img-responsive" alt="Berry Lace Dress">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PROMO -->
    </div>
    <!-- END TWO PRODUCTS & PROMO -->
</div>

<!-- BEGIN BRANDS -->
<div class="brands">
    <div class="container">
        <div class="row">
            <div class="bxslider-wrapper">
                <ul class="bxslider" data-slides-phone="1" data-slides-tablet="3" data-slides-desktop="6" data-slide-margin="15">
                    <?php foreach (Layouts::brand() as $v):?>
                        <li>
                            <a href="product-list.html">
                                <img src="<?php echo $this->img.$v['brand_logo'];?>" style="width: 153px;height: 92px;" alt="<?php echo $v['brand_name'];?>" title="<?php echo $v['brand_name'];?>">
                            </a>
                        </li>
                    <?php endforeach;?>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- END BRANDS -->