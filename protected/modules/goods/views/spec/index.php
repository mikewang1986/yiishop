<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品规格'=>array('/goods/spec/index'),
);
?>

<div style="margin-bottom: 5px;">
    <?php
    echo TbHtml::link('添加规格',
        Yii::app()->controller->createUrl("/goods/spec/create"),
        array(
            'class'=>'btn btn-sm'
        ));
    ?>
</div>

<div class="row">
    <div class="col-xs-12">
        <div class="table-header">
            广告列表
        </div>
        <div class="table-responsive">
            <div role="grid" class="dataTables_wrapper" id="sample-table-2_wrapper">
                <table class="table table-striped table-bordered table-hover dataTable" id="goods-list" aria-describedby="sample-table-2_info">
                    <thead>
                    <tr role="row">
                        <th class="center sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 30px;" aria-label="">
                            <label>
                                <input type="checkbox" class="ace">
                                <span class="lbl"></span>
                            </label>
                        </th>
                        <th tabindex="0" rowspan="1" colspan="1">规格操作</th>
                        <th tabindex="0" rowspan="1" colspan="1">规格备注</th>
                        <th tabindex="0" rowspan="1" colspan="1">类型</th>
                        <th tabindex="0" rowspan="1" colspan="1">显示方式</th>
                        <th tabindex="0" rowspan="1" colspan="1">规格名称</th>
                    </tr>
                    </thead>

                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                    <?php foreach ($dataProvider as $v):?>
                        <tr>
                            <td class="center sorting_1">
                                <label>
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                <a href="<?php echo $this->createUrl('update',array('spec_id'=>$v['spec_id']));?>">
                                    <button class="btn btn-xs btn-info">
                                        <i class="icon-edit bigger-120"></i>
                                    </button>
                                </a>
                                <button class="btn btn-xs btn-danger spec_delete" data="<?php echo $v['spec_id'];?>">
                                    <i class="icon-trash bigger-120"></i>
                                </button>
                            </td>
                            <td><?php echo $v['spec_memo'];?></td>
                            <td><?php echo $this->spec_type[$v['spec_type']];?></td>
                            <td><?php echo $this->spec_show_type[$v['spec_show_type']];?></td>
                            <td><?php echo $v['alias'];?></td>
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
