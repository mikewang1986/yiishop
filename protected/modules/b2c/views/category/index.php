<div class="container">
    <ul class="breadcrumb">
        <li><a href="/">首页</a></li>
        <?php if ($model['parent_cat']):?>
        <li><a href="/category.html?cid=<?php echo $model['cat']['parent_id'];?>"><?php echo $model['parent_cat']['cat_name'];?></a></li>
        <?php endif;?>
        <li class="active"><?php echo $model['cat']['cat_name'];?></li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
        <!-- BEGIN SIDEBAR -->
        <div class="sidebar col-md-3 col-sm-5">
            <?php echo $this->renderPartial(
                '/common/_left_category',
                array('cat_id'=>$model['cat']['cat_id'],
                    'parent_id'=>$model['cat']['parent_id'])
            );
            ?>

            <div class="sidebar-filter margin-bottom-25">
                <h2>筛选</h2>
                <h3>容量</h3>
                <div class="checkbox-list">
                    <label><input type="checkbox"> 500ML</label>
                    <label><input type="checkbox"> 250ML</label>
                </div>

                <h3>价格区间</h3>
                <p>
                    <label>200~300</label>&nbsp;&nbsp;&nbsp;<label>200~300</label>&nbsp;&nbsp;<label>200~300</label>
                </p>
                <div id="slider-range"></div>
            </div>

            <?php echo $this->renderPartial('/common/_left_bestsellers');?>
        </div>
        <!-- END SIDEBAR -->
        <!-- BEGIN CONTENT -->
        <div class="col-md-9 col-sm-7">
            <div class="row list-view-sorting clearfix">
                <div class="col-md-2 col-sm-2 list-view">
                    <a href="#"><i class="fa fa-th-large"></i></a>
                    <a href="#"><i class="fa fa-th-list"></i></a>
                </div>
                <div class="col-md-10 col-sm-10">
                    <div class="pull-right">
                        <label class="control-label">显示数:</label>
                        <select class="form-control input-sm">
                            <option value="#?limit=24" selected="selected">24</option>
                            <option value="#?limit=25">25</option>
                        </select>
                    </div>
                    <div class="pull-right">
                        <label class="control-label">排&nbsp;序:</label>
                        <select class="form-control input-sm">
                            <option value="#?sort=p.sort_order&amp;order=ASC" selected="selected">默认</option>
                            <option value="#?sort=pd.name&amp;order=ASC">销量(高-低)</option>
                            <option value="#?sort=pd.name&amp;order=ASC">价格(高-低)</option>
                        </select>
                    </div>
                </div>
            </div>
            <?php if ($model['product_list']):?>
            <!-- BEGIN PRODUCT LIST -->
            <div class="row product-list">
                <?php foreach ($model['product_list'] as $v):?>
                <!-- PRODUCT ITEM START -->
                    <?php echo $this->renderPartial('/common/_detail_list',array('row'=>$v));?>
                <!-- PRODUCT ITEM END -->
                <?php endforeach;?>
            </div>
            <!-- END PRODUCT LIST -->
            <!-- BEGIN PAGINATOR -->
            <div class="row">
                <?php echo $mutli;?>
            </div>
            <!-- END PAGINATOR -->
            <?php else:?>
                <div class="col-md-12 col-sm-12">
                    <h1>搜索提示：</h1>
                    <div class="shopping-cart-page">
                        <div class="shopping-cart-data clearfix">
                            <p>您搜索的结果为空！</p>
                        </div>
                    </div>
                </div>
            <?php endif;?>
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>
