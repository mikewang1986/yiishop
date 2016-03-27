<?php
$this->breadcrumbs=array(
    '内容管理',
    '栏目管理',
    '栏目列表'
);
?>

<div class="row">
    <div  >
        <?php echo $this->renderPartial('filter');?>
    </div>
    <div class="col-xs-12" style="margin-top: 5px;">
        <div class="actionsBtn btn-group">
            <a class="btn btn-info btn-sm white" href="?r=cms/article/create">新增</a>
        </div>
    </div>
    <div class="col-xs-12">
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
                    <th>标题</th>
                    <th>访问量</th>
                    <th>真实量</th>
                    <th>状态</th>
                </tr>
                </thead>

                <tbody>
                <?php foreach ($item as $v):?>
                    <tr>
                        <td class="center">
                            <label>
                                <input type="checkbox" class="ace" />
                                <span class="lbl"></span>
                            </label>
                        </td>
                        <td>
                            <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                <a class="green" href="?r=cms/article/update&id=<?php echo $v['id'];?>">
                                    <i class="icon-pencil bigger-130"></i>
                                </a>
                                <a class="red form-delete" href="javascript:;" data="<?php echo $v['id'];?>">
                                    <i class="icon-trash bigger-130"></i>
                                </a>
                            </div>
                        </td>
                        <td><?php echo $v['title'];?></td>
                        <td><?php echo $v['hits'];?></td>
                        <td><?php echo $v['realhits'];?></td>
                    </tr>
                <?php endforeach;?>
                </tbody>
            </table>
        </div>
    </div>
</div>