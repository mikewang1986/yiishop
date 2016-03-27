<div class="container">
<ul class="breadcrumb">
    <li><a href="/">首页</a></li>
    <?php if ($model['parent_cat']):?>
        <li><a href="/category.html?cid=<?php echo $model['cat']['parent_id'];?>"><?php echo $model['parent_cat']['cat_name'];?></a></li>
    <?php endif;?>
    <li><a href="/category.html?cid=<?php echo $model['cat']['cat_id'];?>"><?php echo $model['cat']['cat_name'];?></a></li>
    <li class="active"><?php echo $model['product']['row']['name'];?></li>
</ul>
<!-- BEGIN SIDEBAR & CONTENT -->
<div class="row margin-bottom-40">
<!-- BEGIN SIDEBAR -->
<div class="sidebar col-md-3 col-sm-5">
    <?php echo $this->renderPartial('/common/_left_category',array('cat_id'=>$model['cat']['cat_id'],'parent_id'=>$model['cat']['parent_id']));?>
    <?php echo $this->renderPartial('/common/_left_bestsellers');?>
</div>
<!-- END SIDEBAR -->

<!-- BEGIN CONTENT -->
<div class="col-md-9 col-sm-7">
    <div class="product-page">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <input type="hidden" id="product_id" value="<?php echo $row['product_id'];?>">
                <div class="product-main-image">
                    <img src="<?php echo $this->img.$image['m_image'][0];?>"
                         alt="Cool green dress with red bell" class="img-responsive"
                         data-BigImgSrc="<?php echo $this->img.$image['l_image'][0];?>"
                        >
                </div>
                <div class="product-other-images">
                    <?php if (isset($image['s_image'])):?>
                    <?php foreach ($image['s_image'] as $k=>$v):?>
                    <a href="#" class="album <?php if ($k == 0):?>active<?php endif;?>" b_img="<?php echo $this->img.$image['l_image'][$k];?>"
                       m_img="<?php echo $this->img.$image['m_image'][$k];?>">
                        <img alt="Berry Lace Dress" src="<?php echo $this->img.$v;?>">
                    </a>
                    <?php endforeach;?>
                    <?php endif;?>
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <h1><?php echo $row['name'];?></h1>
                <input type="hidden" value="<?php echo $row['product_id'];?>" id="product-id">
                <div class="price-availability-block clearfix">
                    <div class="price">
                        <strong><span>￥</span><?php echo $row['cost'];?></strong>
                        <em>￥<span><?php echo $row['price'];?></span></em>
                    </div>
                    <div class="availability">
                        库存: <strong><?php echo $row['store']?'有货':'无货';?></strong>
                    </div>
                </div>
                <div class="description">
                    <p><?php echo $row['brief'];?></p>
                </div>
                <div class="product-page-options">
                    <div class="pull-left">
                        <label class="control-label">尺码(暂无):</label>
                        <select class="form-control input-sm" disabled>
                            <option>L</option>
                            <option>M</option>
                            <option>XL</option>
                        </select>
                    </div>
                    <div class="pull-left">
                        <label class="control-label">颜色(暂无):</label>
                        <select class="form-control input-sm" disabled>
                            <option>Red</option>
                            <option>Blue</option>
                            <option>Black</option>
                        </select>
                    </div>
                </div>
                <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="text" value="1" readonly class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary" id="add-cart" type="button">加入购物车</button>
                </div>
                <div class="review">
                    <input type="range" value="4" step="0.25" id="backing4">
                    <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                    </div>
                    <a href="#">7 个评价</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">写个评价</a>
                </div>
                <ul class="social-icons">
                    <li><a class="facebook" data-original-title="facebook" href="#"></a></li>
                    <li><a class="twitter" data-original-title="twitter" href="#"></a></li>
                    <li><a class="googleplus" data-original-title="googleplus" href="#"></a></li>
                    <li><a class="evernote" data-original-title="evernote" href="#"></a></li>
                    <li><a class="tumblr" data-original-title="tumblr" href="#"></a></li>
                </ul>
            </div>

            <div class="product-page-content">
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active"><a href="#Description" data-toggle="tab">产品介绍</a></li>
                    <li><a href="#Information" data-toggle="tab">详细信息</a></li>
                    <li><a href="#Reviews" data-toggle="tab">商品咨询</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="Description">
                        <?php echo $row['intro'];?>
                    </div>
                    <div class="tab-pane fade" id="Information">
                        <table class="datasheet">
                            <tr>
                                <th colspan="2">详情参数表</th>
                            </tr>
                            <tr>
                                <td class="datasheet-features-type">品牌</td>
                                <td><?php echo $model['brand']['brand_name'];?></td>
                            </tr>
                            <tr>
                                <td class="datasheet-features-type">分类</td>
                                <td><?php echo $model['cat']['cat_name'];?></td>
                            </tr>
                            <tr>
                                <td class="datasheet-features-type">单位</td>
                                <td><?php echo $row['unit'];?></td>
                            </tr>
                            <tr>
                                <td class="datasheet-features-type">重量</td>
                                <td><?php echo $row['weight'];?></td>
                            </tr>
                        </table>
                    </div>
                    <div class="tab-pane fade " id="Reviews">
                        <!--<p>There are no reviews for this product.</p>-->
                        <!--
                        <div class="review-item clearfix">
                            <div class="review-item-submitted">
                                <strong>Bob</strong>
                                <em>30/12/2013 - 07:37</em>
                                <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                            </div>
                            <div class="review-item-content">
                                <p>Sed velit quam, auctor id semper a, hendrerit eget justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis vel arcu pulvinar dolor tempus feugiat id in orci. Phasellus sed erat leo. Donec luctus, justo eget ultricies tristique, enim mauris bibendum orci, a sodales lectus purus ut lorem.</p>
                            </div>
                        </div>
                        -->

                        <!-- BEGIN FORM-->
                        <form class="reviews-form">
                            <h2>我要咨询</h2>
                            <div class="form-group">
                                <label for="name">姓名 <span class="require">*</span></label>
                                <input type="text" class="form-control" id="name">
                            </div>
                            <div class="form-group">
                                <label for="email">邮箱</label>
                                <input type="text" class="form-control" id="email">
                            </div>
                            <div class="form-group">
                                <label for="review">内容 <span class="require">*</span></label>
                                <textarea class="form-control" rows="8" id="review"></textarea>
                            </div>
                            <div class="padding-top-20">
                                <button type="button" class="btn btn-primary" id="reviews-send">发送</button>
                            </div>
                        </form>
                        <!-- END FORM-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END CONTENT -->
</div>
<!-- END SIDEBAR & CONTENT -->

<!-- BEGIN SIMILAR PRODUCTS -->
<?php echo $this->renderPartial('/common/_foot_popular');?>
<!-- END SIMILAR PRODUCTS -->
</div>