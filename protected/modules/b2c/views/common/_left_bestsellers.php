<div class="sidebar-products clearfix">
    <h2>畅销</h2>
    <?php foreach (Layouts::Recomman(10,3) as $v):?>
        <div class="item">
            <a href="item.html">
                <img src="<?php echo $this->img.$v['s_url']?>" class="img-responsive" alt="<?php echo $v['name'];?>">
            </a>
            <h3><a href="/product.html?id=<?php echo $v['product_id'];?>" target="_blank"><?php echo $v['name'];?></a></h3>
            <div class="price">￥<?php echo $v['price'];?></div>
        </div>
    <?php endforeach;?>
</div>