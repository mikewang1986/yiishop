<div class="container">
    <ul class="breadcrumb">
        当前位置：
        <li><a href="/">首页</a></li>
        <li><a href="/account/index.html">会员中心</a></li>
        <li class="active">收货地址</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row">
        <!-- BEGIN SIDEBAR -->
        <?php echo $this->renderPartial('/common/_left_profile');?>
        <!-- END SIDEBAR -->

        <!-- BEGIN CONTENT -->

        <div class="col-md-9">
            <div class="col-md-6">
                <h3>收货地址</h3>
            </div>
            <div class="col-md-6" style="text-align: right;">
                <a href="/addr/insert.html" class="btn default">添加收货地址</a>
            </div>

        </div>
        <div class="col-md-9">
            <div class="portlet-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-advance table-hover">
                        <thead>
                        <tr>
                            <th>
                                地址
                            </th>
                            <th>
                                收货人
                            </th>
                            <th>
                                联系电话
                            </th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($model['list'] as $v):?>
                        <tr>
                            <td><?php echo $v['area'].$v['addr'];?></td>
                            <td><?php echo $v['name'];?></td>
                            <td><?php echo $v['mobile'];?></td>
                            <td>
                                <?php if ($v['def_addr']):?>
                                <label class="btn btn-sm yellow" style="padding: 2px;">默认地址</label>
                                <?php endif;?>
                                <label><a href="/addr/update.html?addr_id=<?php echo $v['addr_id'];?>">编辑</a></label>
                                <label><a href="/addr/delete.html?addr_id=<?php echo $v['addr_id'];?>" class="addr-del">删除</a></label>
                            </td>
                        </tr>
                        <?php endforeach;?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>