<?php
$this->breadcrumbs=array(
    '商品管理'=>array(''),
    '商品列表'
);
?>
<div class="row">
    <div class="col-xs-12">
        <div style="margin-bottom: 5px;">
            <a href="?r=goods/cat/create" class="btn btn-sm">添加分类</a>
        </div>
        <div class="table-header">
            分类列表
        </div>
        <div class="table-responsive">
            <div role="grid" class="dataTables_wrapper" id="sample-table-2_wrapper">
                <div style="overflow:auto;height: 700px;">
                <table class="table table-striped table-bordered table-hover dataTable" id="goods-list">
                    <thead>
                        <tr role="row">
                            <th class="center sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 30px;" aria-label="">
                                <label>
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th tabindex="0" rowspan="1" colspan="1" style="width: 59px;">

                            </th>
                            <th tabindex="0" rowspan="1" colspan="1" style="width: 169px;">分类名</th>
                            <th tabindex="0" rowspan="1" colspan="1" style="width: 169px;">类型名</th>
                            <th tabindex="0" rowspan="1" colspan="1" style="width: 169px;">排序</th>
                        </tr>
                    </thead>

                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                    <?php foreach ($dataProvider as $v):?>
                        <tr class="odd">
                            <td class="center  sorting_1">
                                <label>
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                <a href="<?php echo $this->createUrl('create',array('parent_id'=>$v['cat_id']));?>">
                                    <button class="btn btn-xs btn-info">
                                        子分类
                                    </button>
                                </a>
                                <a href="<?php echo $this->createUrl('update',array('cat_id'=>$v['cat_id']));?>">
                                    <button class="btn btn-xs btn-info">
                                        编辑
                                    </button>
                                </a>
                                <a class="red cat_delete" href="javascript:;" data="<?php echo $v['cat_id'];?>">
                                    <button class="btn btn-xs btn-danger">
                                        删除
                                    </button>
                                </a>
                            </td>
                            <td>
                                <?php if ($v['path'] == 2):?>
                                    &nbsp;&nbsp;&nbsp;-&nbsp;-
                                <?php endif;?>
                                <?php if ($v['path'] == 3):?>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-
                                <?php endif;?>
                                <?php echo $v['cat_name'];?>
                            </td>
                            <td>
                                <?php echo $v['type_name'];?>
                            </td>
                            <td>
                                <?php echo $v['p_order'];?>
                            </td>
                        </tr>
                    <?php endforeach;?>
                    </tbody>
                </table>
                </div>
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
