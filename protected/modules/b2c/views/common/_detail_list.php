<div class="col-md-4 col-sm-6 col-xs-12">
    <div class="product-item">
        <div class="pi-img-wrapper">
            <img src="<?php echo $this->img.$row['s_url']?>" style="width: 192px;height: 256px;" class="img-responsive" alt="<?php echo $row['name'];?>">
            <div>
                <a href="<?php echo $this->img.$row['l_url']?>"
                   class="btn btn-default fancybox-button">大图</a>
                <a href="/product/detail?&id=<?php echo $row['product_id'];?>" data-fancybox-type="ajax" class="btn btn-default fancybox-fast-view">预览</a>
            </div>
        </div>
        <h3><a href="/product.html?id=<?php echo $row['product_id'];?>" target="_blank"><?php echo GlobalFunc::globalSubstr($row['name'],10);?></a></h3>
        <div class="pi-price">￥<?php echo $row['price']?></div>
        <a href="#"  id="add-cart" class="btn btn-default add2cart">加入购物车</a>
        <input type="hidden" value="<?php echo $row['product_id'];?>" id="product-id">
        <input id="product-quantity" type="hidden" value="1"   >

    </div>
</div>