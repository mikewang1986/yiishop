<!-- BEGIN fast view of a product -->
<div id="product-pop-up" style="width: 700px;">
    <div class="product-page product-pop-up">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-3">
                <div class="product-main-image">
                    <img src="<?php echo $this->img.$image['m_image'][0];?>"
                         alt="Cool green dress with red bell" class="img-responsive"
                         data-BigImgSrc="<?php echo $this->img.$image['l_image'][0];?>"
                        >                </div>
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
            <div class="col-md-6 col-sm-6 col-xs-9">
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
                        <label class="control-label">Size:</label>
                        <select class="form-control input-sm" disabled>
                            <option>L</option>
                            <option>M</option>
                            <option>XL</option>
                        </select>
                    </div>
                    <div class="pull-left">
                        <label class="control-label">Color:</label>
                        <select class="form-control input-sm" disabled>
                            <option>Red</option>
                            <option>Blue</option>
                            <option>Black</option>
                        </select>
                    </div>
                </div>
                <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="text" value="1" readonly name="product-quantity" class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary" id="add-cart" type="button">加入购物车</button>
                    <button class="btn btn-default" type="button">更多详情</button>
                </div>
            </div>

            <div class="sticker sticker-sale"></div>
        </div>
    </div>
</div>
<!-- END fast view of a product -->