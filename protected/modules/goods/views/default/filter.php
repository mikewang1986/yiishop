<form action="" method="get">
    <input type="hidden" name="r" value="goods/default/index">
    <div class="row">
        <div class="col-sm-2 form-group">
            <label class="control-label no-padding-right"> 编号: <input type="text" class="goods_bn" name="Goods[bn]" value="<?php echo isset($params['bn'])?$params['bn']:'';?>"></label>
        </div>
        <div class="col-sm-2 form-group">
            <label class="control-label no-padding-right"> 名称: <input type="text" class="goods_name" name="Goods[name]" value="<?php echo isset($params['goods_name'])?$params['goods_name']:'';?>"></label>
        </div>
        <div class="col-sm-3 form-group">
            <label class="control-label no-padding-right"> 销售价:
                <select class="sales_price" name="Goods[sales_price]">
                    <?php foreach ($this->filter['compare'] as $k=>$v):?>
                    <option value="<?php echo $k;?>" <?php echo isset($params['sales_price'])&&$params['sales_price']==$k?'selected':'';?>><?php echo $v;?></option>
                    <?php endforeach;?>
                </select>
            </label>
            <input type="text" class="sales_price_val" name="Goods[sales_price_val]" value="<?php echo isset($params['sales_price_val'])?$params['sales_price_val']:'';?>">
        </div>
        <div class="col-sm-3 form-group">
            <label class="control-label no-padding-right"> 库存:
                <select class="goods_store" name="Goods[goods_store]">
                    <?php foreach ($this->filter['compare'] as $k=>$v):?>
                        <option value="<?php echo $k;?>" <?php echo isset($params['goods_store'])&&$params['goods_store']==$k?'selected':'';?>><?php echo $v;?></option>
                    <?php endforeach;?>
                </select>
            </label>
            <input type="text" class="goods_store_val" name="Goods[goods_store_val]" value="<?php echo isset($params['goods_store_val'])?$params['goods_store_val']:'';?>">
        </div>
        <div class="col-sm-2 actionsBtn btn-group">
            <button type="submit" class="btn btn-sm btn-primary goods_filter">
                查询
            </button>
            <button type="reset" class="btn btn-sm btn-primary">
                清空
            </button>
        </div>
    </div>
</form>