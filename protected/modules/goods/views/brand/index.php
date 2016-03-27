<?php
$this->breadcrumbs=array(
    '商品',
    '商品配置',
    '品牌列表'
);
?>

<div class="row">
    <div class="col-xs-12">
        <div style="margin-bottom: 5px;">
            <a href="?r=goods/brand/create" class="btn btn-sm">添加品牌</a>
        </div>
        <div class="table-responsive">
            <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th class="center">
                            <label>
                                <input type="checkbox" class="ace" />
                                <span class="lbl"></span>
                            </label>
                        </th>
                        <th>操作</th>
                        <th>品牌名称</th>
                        <th>品牌别名</th>
                        <th>品牌网址</th>
                    </tr>
                </thead>

                <tbody>
                <?php foreach ($dataProvider as $v):?>
                    <tr>
                        <td class="center">
                            <label>
                                <input type="checkbox" class="ace" />
                                <span class="lbl"></span>
                            </label>
                        </td>
                        <td>
                            <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                <a class="green" href="?r=goods/brand/update&brand_id=<?php echo $v['brand_id'];?>">
                                    <i class="icon-pencil bigger-130"></i>
                                </a>
                                <a class="red spec_delete" href="javascript:;" data="<?php echo $v['brand_id'];?>">
                                    <i class="icon-trash bigger-130"></i>
                                </a>
                            </div>
                        </td>
                        <td><?php echo $v['brand_name'];?></td>
                        <td><?php echo $v['brand_keywords'];?></td>
                        <td><?php echo $v['brand_url'];?></td>
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
