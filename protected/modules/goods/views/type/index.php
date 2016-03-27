<?php
$this->breadcrumbs=array(
    '商品',
    '商品配置',
    '类型列表'
);
?>

<div class="row">
    <div class="col-xs-12">
        <div style="margin-bottom: 5px;">
            <a href="?r=goods/type/create" class="btn btn-sm">添加类型</a>
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
                    <th>类型名称</th>
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
                                <a class="green" href="?r=goods/type/update&type_id=<?php echo $v['type_id'];?>">
                                    <i class="icon-pencil bigger-130"></i>
                                </a>
                                <a class="red bootbox-delete" href="javascript:;" data="<?php echo $v['type_id'];?>">
                                    <i class="icon-trash bigger-130"></i>
                                </a>
                            </div>
                        </td>
                        <td><?php echo $v['name'];?></td>
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
