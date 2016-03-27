<style>
    .modal-dialog{width: 60%;}
</style>
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
                        <th tabindex="0" rowspan="1" colspan="1">属性名</th>
                        <th tabindex="0" rowspan="1" colspan="1">属性别名(|分割)</th>
                        <th tabindex="0" rowspan="1" colspan="1">扩展属性值</th>
                        <th tabindex="0" rowspan="1" colspan="1">显示</th>
                        <th tabindex="0" rowspan="1" colspan="1">排序</th>
                    </tr>
                    </thead>

                    <tbody role="alert" aria-live="polite" aria-relevant="all">
                    <?php foreach ($dataProvider as $v):?>
                        <tr>
                            <td class="center sorting_1">
                                <label>
                                    <input type="checkbox" class="ace props_list" value="<?php echo $v['props_id'];?>">
                                    <span class="lbl"></span>
                                    <input type="hidden" value="<?php echo $v['name'];?>">
                                    <input type="hidden" value="<?php echo $v['alias'];?>">
                                    <input type="hidden" value="<?php echo isset($propsValue[$v['props_id']])?implode(',',$propsValue[$v['props_id']]):'';?>">
                                </label>
                            </td>
                            <td><?php echo $v['name'];?></td>
                            <td><?php echo $v['alias'];?></td>
                            <td><?php echo isset($propsValue[$v['props_id']])?implode(',',$propsValue[$v['props_id']]):'';?></td>
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