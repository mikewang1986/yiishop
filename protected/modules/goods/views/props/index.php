<?php
$this->breadcrumbs=array(
    '商品管理',
    '商品配置',
    '商品扩展属性'=>array('/goods/props/index'),
);
?>
<div style="margin-bottom: 5px;">
    <?php
    echo TbHtml::link('添加扩展属性',
        Yii::app()->controller->createUrl("/goods/props/create"),
        array(
            'class'=>'btn btn-sm'
        ));
    ?>
</div>
<div class="row">
    <div class="col-xs-12">
        <div class="table-header">
            列表
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
                        <th tabindex="0" rowspan="1" colspan="1">操作</th>
                        <th tabindex="0" rowspan="1" colspan="1">属性名</th>
                        <th tabindex="0" rowspan="1" colspan="1">属性别名(|分割)</th>
                        <th tabindex="0" rowspan="1" colspan="1">前台列表页表现类型</th>
                        <th tabindex="0" rowspan="1" colspan="1">显示</th>
                        <th tabindex="0" rowspan="1" colspan="1">排序</th>
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
                                <a href="<?php echo $this->createUrl('update',array('props_id'=>$v['props_id']));?>">
                                    <button class="btn btn-xs btn-info">
                                        <i class="icon-edit bigger-120"></i>
                                    </button>
                                </a>
                                <button class="btn btn-xs btn-danger spec_delete" data="<?php echo $v['props_id'];?>">
                                    <i class="icon-trash bigger-120"></i>
                                </button>
                            </td>
                            <td><?php echo $v['name'];?></td>
                            <td><?php echo $v['alias'];?></td>
                            <td><?php echo $v['type'];?></td>
                            <td><?php echo $v['show']=='on'?'是':'否';?></td>
                            <td><?php echo $v['ordernum'];?></td>
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
