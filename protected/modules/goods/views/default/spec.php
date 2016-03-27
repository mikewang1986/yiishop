<?php
$this->breadcrumbs=array(
    '商品管理'=>array('index'),
    '商品列表'
);
?>

<div class="row">
    <div class="col-sm-12">
        <div class="tabbable tabs-left">
            <ul id="myTab3" class="nav nav-tabs">
                <?php foreach ($items as $k=>$v):?>
                <li>
                    <a href="#spec_<?php echo $k;?>" data-toggle="tab">
                        <i class="pink icon-dashboard bigger-110"></i>
                        <?php echo $v['spec_name'];?>
                        (<label><?php echo isset($spec_list[$k])?count($spec_list[$k]['spec_value']):0;?></label>)
                    </a>
                </li>
                <?php endforeach;?>
            </ul>

            <div class="tab-content">
                <?php foreach ($items as $k=>$v):?>
                <div class="tab-pane" id="spec_<?php echo $k;?>" data="<?php echo $k;?>">
                    <?php foreach ($v['spec_val'] as $kk=>$vv):?>
                    <label id="spec_value_<?php echo $vv['spec_value_id'];?>">
                        <input type="checkbox" class="ace spec_value spec_type_<?php echo $k;?>" <?php echo isset($spec_list[$k])&&in_array($vv['spec_value_id'],$spec_list[$k]['spec_value_id_arr'])?'checked':'';?> value="<?php echo $vv['spec_value_id'];?>">
                        <span class="lbl"><?php echo $vv['spec_value'];?></span>
                    </label>
                    <?php endforeach;?>
                    <div class="form-group">
                        <label for="form-field-tags" class="col-sm-1 control-label no-padding-right" style="width: 5%;">规格</label>
                        <div class="col-sm-10">
                            <div class="tags spec_tags" style="min-width: 190px;min-height: 41px;width: auto;">
                                <?php if (isset($spec_list[$k])):?>
                                <?php foreach ($spec_list[$k]['spec_value'] as $vvv):?>
                                <span data="<?php echo $vvv['spec_value_id'];?>" class="tag tag_button_<?php echo $vvv['spec_value_id'];?>"><?php echo $vvv['spec_value_name'];?><button type="button" class="close">×</button></span>
                                <?php endforeach;?>
                                <?php endif;?>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach;?>
            </div>
            <div class="clearfix form-actions">
                <div class="col-md-offset-5">
                    <button type="button" class="btn btn-info spec_button">
                        生成货品
                    </button>
                </div>
            </div>
        </div>
        <i class="icon-bell bigger-110 purple"></i>
        共<label id="spec_product_num"><?php echo count($product_list);?></label>件货品
        <form action="?r=goods/default/spec&goods_id=<?php echo $goods_row['goods_id'];?>" method="post" id="spec-form">
            <table class="table table-striped table-bordered table-hover" id="sample-table-1">
                <thead>
                    <tr>
                        <th>规格值</th>
                        <th>货号</th>
                        <th>上架</th>
                        <th>库存</th>
                        <th>冻结库存</th>
                        <th>销售价</th>
                        <th>成本价</th>
                        <th>市场价</th>
                        <th>重量(g)</th>
                        <th>默认货品</th>
                        <th>操作</th>
                    </tr>
                </thead>

                <tbody class="spec-val">
                    <?php foreach ($product_list as $v):?>
                    <tr>
                        <td style="width: 12%;"><?php echo $v['spec_info'];?><input type="hidden" name="Product[spec_name][]" value="<?php echo $v['spec_info'];?>"><input type="hidden" name="Product[spec][]" value="<?php echo $v['spec_desc'];?>"></td>
                        <td style="width: 15%;"><input class="col-sm-12" type="text" name="Product[bn][]" value="<?php echo $v['bn'];?>"></td>
                        <td class="center"><label><input type="checkbox" class="ace" name="Product[marketable][]" value="<?php echo $v['marketable']==true?1:0;?>" <?php if ($v['marketable'] == 'true'):?>checked="true"<?php endif;?>><span class="lbl"></span></label></td>
                        <td><input class="col-sm-5" type="text" name="Product[store][]" value="0"></td>
                        <td>0</td>
                        <td><input class="col-sm-8" type="text" name="Product[price][]" value="<?php echo $v['price'];?>"></td>
                        <td><input class="col-sm-8" type="text" name="Product[cost][]" value="<?php echo $v['cost'];?>"></td>
                        <td><input class="col-sm-8" type="text" name="Product[mktprice][]" value="<?php echo $v['mktprice'];?>"></td>
                        <td><input class="col-sm-5" type="text" name="Product[weight][]" value="<?php echo $v['weight'];?>"></td>
                        <td class="center">
                            <label>
                                <input type="radio" class="ace product_default" name="Product[is_default][]" value="<?php echo $v['is_default']==true?1:0;?>" <?php if ($v['is_default']=='true'):?>checked="true"<?php endif;?>>
                                <span class="lbl"></span>
                            </label>
                        </td>
                        <td><button class="btn btn-xs btn-danger product-del"><i class="icon-trash bigger-120"></i></button></td>
                    </tr>
                    <?php endforeach;?>
                </tbody>
            </table>

            <input type="hidden" id="goods_id" value="<?php echo $goods_row['goods_id'];?>">
            <div class="clearfix form-actions">
                <div class="col-md-offset-5">
                    <input class="btn btn-info product-submit" type="submit" value="确定提交">
                </div>
            </div>
        </form>
    </div><!-- /span -->
</div>

<script>
    $('.nav-tabs li:first').attr('class','active');
    $('.tab-content div:first').attr('class','tab-pane active');
    if ($('.spec_tags').html() == '') $('.spec_tags').hide();
</script>