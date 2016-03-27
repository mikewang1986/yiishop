<?php
$this->breadcrumbs=array(
    '会员管理'=>array('/member/default'),
    '会员列表'
);
?>
<div class="row">
    <div class="col-xs-12">
        <div role="grid" class="dataTables_wrapper" id="sample-table-2_wrapper">
            <?php echo $this->renderPartial('filter',array('params'=>$params));?>
        </div>
    </div>
    <div class="col-xs-12">
        <div class="table-responsive">
            <div role="grid" class="dataTables_wrapper" id="sample-table-2_wrapper">
                <table class="table table-striped table-bordered table-hover dataTable" id="member-list" aria-describedby="sample-table-2_info">
                    <thead>
                    <tr role="row">
                        <th class="center sorting_disabled" role="columnheader" rowspan="1" colspan="1" style="width: 71px;" aria-label="">
                            <label>
                                <span class="lbl"></span>
                            </label>
                        </th>
                        <th class="col-xs-2">操作</th>
                        <th>ID</th>
                        <th>用户名</th>
                        <th>Email</th>
                        <th>手机</th>
                        <th>会员等级</th>
                        <th>创建时间</th>
                        <th>积分</th>
                    </tr>
                    </thead>

                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                    <?php foreach ($dataProvider as $v):?>
                        <tr class="odd">
                            <td class="center sorting_1">
                                <label>
                                    <input type="checkbox" class="ace" name="member_id" value="<?php echo $v['member_id'];?>">
                                    <span class="lbl"></span>
                                </label>
                            </td>
                            <td>
                                <a href="<?php echo $this->createUrl('update',array('member_id'=>$v['member_id']));?>" data="<?php echo $v['member_id'];?>" class="view">
                                    <button class="btn btn-xs btn-info">编辑</button>
                                </a>
                            </td>
                            <td><?php echo $v['member_id'];?></td>
                            <td><?php echo $v['name'];?></td>
                            <td><?php echo $v['email'];?></td>
                            <td><?php echo $v['mobile'];?></td>
                            <td><?php echo $v['member_lv_id']==1?'注册会员':'';?></td>
                            <td><?php echo date('Y-m-d H:i:s',$v['createtime']);?></td>
                            <td><?php echo $v['point'];?></td>
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