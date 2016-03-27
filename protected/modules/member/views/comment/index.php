<?php
$this->breadcrumbs=array(
    '会员管理'=>array('/member/comment'),
    '咨询列表'
);

?>

<div class="row">
    <div class="col-xs-12">
        <div role="grid" class="dataTables_wrapper" id="sample-table-2_wrapper">
            <?php echo $this->renderPartial('filter');?>
        </div>
    </div>

    <div class="col-xs-12">
        <div class="table-responsive">
            <div role="grid" class="dataTables_wrapper" id="sample-table-2_wrapper">
                <table class="table table-striped table-bordered table-hover dataTable" id="comment-list" aria-describedby="sample-table-2_info">
                    <thead>
                    <tr role="row">
                        <th class="center sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 71px;" aria-label="">
                            <label>
                                <span class="lbl"></span>
                            </label>
                        </th>
                        <th class="col-xs-2">操作</th>
                        <th>名称</th>
                        <th>最后回复人</th>
                        <th>IP</th>
                        <th>前台是否显示</th>
                        <th>内容</th>
                    </tr>
                    </thead>

                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                    <?php foreach ($dataProvider as $v):?>
                        <tr class="odd">
                            <td class="center sorting_1">
                                <label>
                                    <input type="checkbox" class="ace" name="comment_id" value="<?php echo $v['comment_id'];?>">
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                <a href="javascript:;" data="<?php echo $v['comment_id'];?>" class="view">
                                    <button class="btn btn-xs btn-info">查看/操作</button>
                                </a>
                            </td>
                            <td><?php echo $v['author'];?></td>
                            <td><?php echo $v['reply_name'];?></td>
                            <td><?php echo $v['ip'];?></td>
                            <td><?php echo $v['display']=='false'?'否':'是';?></td>
                            <td><?php echo $v['contact'];?></td>
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