<?php
$this->breadcrumbs=array(
    '商品管理'=>array(''),
    '商品列表'
);
?>
<div class="row">
    <div class="col-xs-12">
        <div role="grid" class="dataTables_wrapper" id="sample-table-2_wrapper">
        <?php echo $this->renderPartial('filter',array('params'=>$params));?>
        </div>
    </div>
    <div class="col-xs-12" style="margin-top: 5px;">
        <div class="actionsBtn btn-group">
            <a class="btn btn-info btn-sm white" href="?r=goods/default/create">新增</a>
        </div>
    </div>
    <div class="col-xs-12">
        <div class="table-responsive">
            <div role="grid" class="dataTables_wrapper" id="sample-table-2_wrapper">
                <table class="table table-striped table-bordered table-hover dataTable" id="goods-list" aria-describedby="sample-table-2_info">
                    <thead>
                    <tr role="row">
                        <th class="center sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 71px;" aria-label="">
                            <label>
                                <span class="lbl"></span>
                            </label>
                        </th>
                        <th class="col-xs-2">操作</th>
                        <th>商品名</th>
                        <th>销售价</th>
                        <th>品牌</th>
                        <th>分类</th>
                        <th>类型</th>
                    </tr>
                    </thead>

                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                    <?php foreach ($dataProvider as $v):?>
                        <tr class="odd">
                            <td class="center sorting_1">
                                <label>
                                    <input type="checkbox" class="ace" name="goods_id" data="<?php echo $v['name'];?>" value="<?php echo $v['goods_id'];?>">
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                <a href="<?php echo $this->createUrl('update',array('goods_id'=>$v['goods_id']));?>">
                                    <button class="btn btn-xs btn-info">编辑</button>
                                </a>
                                <?php if ($v['is_spec'] == 'true'):?>
                                <a href="<?php echo $this->createUrl('spec',array('goods_id'=>$v['goods_id']));?>">
                                    <button class="btn btn-xs btn-info">货品</button>
                                </a>
                                <?php endif;?>
                                <?php if ($v['is_props'] == 'true'):?>
                                <a href="<?php echo $this->createUrl('props',array('goods_id'=>$v['goods_id']));?>">
                                    <button class="btn btn-xs btn-info">属性</button>
                                </a>
                                <?php endif;?>
                            </td>
                            <td><?php echo $v['name'];?></td>
                            <td><?php echo $v['cost'];?></td>
                            <td><?php echo $v['brand_name'];?></td>
                            <td><?php echo $v['cat_name'];?></td>
                            <td><?php echo $v['type_name'];?></td>
                        </tr>
                    <?php endforeach;?>
                    </tbody>
                </table>

                <div class="row">
                    <?php $this->widget(
                        'bootstrap.widgets.TbLinkPager',
                        array(
                            'pages' => $pages,
                            'currentPage'=>$pageIndex,
                            'pageSize'=>$this->pagesize
                        )
                    );?>
                </div>
            </div>
        </div>
    </div>
</div>