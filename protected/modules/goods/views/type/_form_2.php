<div class="billContainer no_spec ">
    <div class="row col-xs-12">
        <p><a class="btn btn-sm btn-primary" id="type-props">添加</a></p>
        <div class="table-responsive center">
            <table id="spec-table" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th class="center">属性名</th>
                    <th class="center">属性别名</th>
                    <th class="center">选择项可选值</th>
                    <th class="center">删除</th>
                </tr>
                </thead>

                <tbody id="type-props-list">
                <?php if(isset($model['props_list']['item']) && $model['props_list']['item']):?>
                    <?php foreach($model['props_list']['item'] as $v):?>
                        <tr>
                            <td><input type="hidden" name="TypeProps[props_id][]" value="<?php echo $v['props_id'];?>"><?php echo $v['name'];?></td>
                            <td><?php echo $v['alias'];?></td>
                            <td>
                                <div class="tags" style="overflow-x: hidden;border: none;"><span class="tag">
                                <?php if (isset($model['props_list']['propsValue'][$v['props_id']])):?>
                                <?php foreach ($model['props_list']['propsValue'][$v['props_id']] as $vv):?>
                                    <?php echo $vv;?>
                                <?php endforeach;?>
                                <?php endif;?>
                                </span></div>
                            </td>
                            <td><button class="btn btn-xs btn-danger del"><i class="fa icon-trash bigger-120"></i></button></td>
                        </tr>
                    <?php endforeach;?>
                <?php endif;?>
                </tbody>
            </table>
        </div>
    </div>
</div>