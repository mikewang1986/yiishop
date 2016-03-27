<div class="billContainer no_spec ">
    <div class="row col-xs-12">
        <div class="table-responsive">
            <?php foreach ($model['spec_list'] as $v):?>
            <label>
                <input type="checkbox" class="ace" name="Spec[spec_id][]"
                       <?php if (isset($model['spec_selected'][$v['spec_id']])):?>checked="true" <?php endif;?>
                       value="<?php echo $v['spec_id'];?>">
                <span class="lbl"><?php echo $v['spec_name'];?></span>
            </label>
            <?php endforeach;?>
        </div>
    </div>
</div>