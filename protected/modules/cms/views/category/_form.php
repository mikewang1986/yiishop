<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/plugins/code/prettify.css" />

<script charset="utf-8" src="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8" src="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/plugins/code/prettify.js"></script>
<div class="page-header">
    <h1>
        栏目
    </h1>
</div>

<div class="row">
    <div class="col-xs-12">
        <form class="form-horizontal" id="validation-form" novalidate="novalidate" action="?r=cms/category/<?php echo $action;?>" method="post">
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 标题 </label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-5" name="Category[name]"
                           value="<?php echo isset($model['category_row'])?$model['category_row']['name']:'';?>">
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 栏目目录 </label>
                <div class="col-sm-4">
                    <input type="text" class="col-xs-3" name="Category[dir]"
                           value="<?php echo isset($model['category_row'])?$model['category_row']['dir']:'';?>">
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 栏目模型 </label>
                <div class="col-sm-2">
                    <select name="Category[model]" class="form-control">
                        <?php foreach (Yii::app()->params['category_model'] as $k=>$v):?>
                            <option value="<?php echo $k;?>"
                                    <?php if (isset($model['category_row']) && $model['category_row']['model'] == $k):?>selected<?php endif;?>>
                                <?php echo $v;?>
                            </option>
                        <?php endforeach;?>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 上级栏目 </label>
                <div class="col-sm-2">
                    <select name="Category[parent_id]" class="form-control">
                        <option value="0">--请选择上级分类--</option>
                    <?php foreach ($model['category_list'] as $k=>$v):?>
                        <option value="<?php echo $v['id'];?>"
                                <?php if (isset($model['category_row']) && $model['category_row']['parent_id'] == $v['id']):?>selected<?php endif;?>>
                            <?php echo $v['name'];?>
                        </option>
                    <?php endforeach;?>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 内容 </label>
                <div class="col-sm-9">
                    <textarea id="intro" class="autosize-transition form-control"
                              name="Category[content]" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 69px;">
                        <?php echo isset($model['category_row'])?$model['category_row']['content']:'';?>
                    </textarea>
                </div>
            </div>

            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <button type="submit" class="btn btn-info">
                        <i class="icon-ok bigger-110"></i>
                        提交
                    </button>

                    &nbsp; &nbsp; &nbsp;
                    <button type="reset" class="btn">
                        <i class="icon-undo bigger-110"></i>
                        重置
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    KindEditor.ready(function(K) {
        var editor1 = K.create('#intro', {
            width : '800px',
            height : '300px',
            cssPath : '<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/plugins/code/prettify.css',
            uploadJson : '?r=site/filejson',
            allowFileManager : true
        });
        prettyPrint();
    });
</script>