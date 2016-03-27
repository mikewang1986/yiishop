<style>
    .dataTables_info{float: left;}
</style>
<div class="row">
    <div class="col-xs-12">
        <div class="table-responsive">
            <div role="grid" class="dataTables_wrapper" id="sample-table-2_wrapper">
                <?php echo $this->renderPartial('filter',array('params'=>$params));?>
                <table class="table table-striped table-bordered table-hover dataTable" id="goods-list" aria-describedby="sample-table-2_info">
                    <thead>
                        <tr role="row">
                            <th class="center sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 71px;" aria-label="">
                                <label>
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>商品名</th>
                            <th>品牌</th>
                            <th>分类</th>
                            <th>类型</th>
                        </tr>
                    </thead>

                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                    <?php foreach ($dataProvider as $v):?>
                        <tr class="odd">
                            <td class="center  sorting_1">
                                <label>
                                    <input type="radio" class="ace" name="goods_id" data="<?php echo $v['name'];?>" value="<?php echo $v['goods_id'];?>">
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                <a href="<?php echo $v['goods_id'];?>"><?php echo $v['name'];?></a>
                            </td>
                            <td><?php echo $v['brand_name'];?></td>
                            <td><?php echo $v['cat_name'];?></td>
                            <td><?php echo $v['type_name'];?></td>
                        </tr>
                    <?php endforeach;?>
                    </tbody>
                </table>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="dataTables_paginate paging_bootstrap">
                            <?php $this->widget(
                                'bootstrap.widgets.TbLinkPager',
                                array(
                                    'pages' => $pages,
                                    'currentPage'=>$pageIndex,
                                    'pageSize'=>$this->pagesize,
                                )
                            );?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        $('#page-id a').click(function(){
            var pageUrl = $(this).attr('href');
            $.get(
                pageUrl,
                {},
                function (data){
                    $('.bootbox-body').html(data);
                }
            );
            return false;
        });
    });
</script>
