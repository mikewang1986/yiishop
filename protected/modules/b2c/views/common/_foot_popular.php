<div class="row margin-bottom-40">
    <div class="col-md-12 col-sm-12 bxslider-wrapper bxslider-wrapper-similar-products">
        <h2>最受欢迎商品</h2>
        <ul class="bxslider bxslider-similar-products" data-slides-phone="1"
            data-slides-tablet="2" data-slides-desktop="4" data-slide-margin="20">
            <?php foreach (Layouts::Popular() as $v):?>
                <!-- PRODUCT ITEM START -->
                <?php echo $this->renderPartial('/common/_detail_list',array('row'=>$v));?>
                <!-- PRODUCT ITEM END -->
            <?php endforeach;?>
        </ul>
    </div>
</div>