<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/plugins/code/prettify.css" />
<script charset="utf-8" src="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8" src="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/plugins/code/prettify.js"></script>
<div class="page-header">
    <h1>
        文章
    </h1>
</div>
<div class="row">
    <div class="col-xs-12">
        <form class="form-horizontal" id="validation-form" novalidate="novalidate" action="?r=cms/article/<?php echo $action;?>" method="post">
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 栏目 </label>
                <div class="col-sm-2">
                    <select name="Article[category]" class="form-control">
                        <option value="0">--请选择栏目--</option>
                    <?php foreach ($model['category_list'] as $k=>$v):?>
                        <option value="<?php echo $v['id'];?>"
                                <?php if (isset($model['article_row']) && $model['article_row']['category'] == $v['id']):?>selected<?php endif;?>>
                            <?php echo $v['name'];?>
                        </option>
                    <?php endforeach;?>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 标题 </label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-5" name="Article[title]"
                           value="<?php echo isset($model['article_row'])?$model['article_row']['title']:'';?>">
                </div>
            </div>

            <div class="form-group">
                <label for="form-field-4" class="col-sm-3 control-label no-padding-right">缩略图</label>
                <div class="col-sm-4">
                    <div class="ace-file-input ace-file-multiple">
                        <label data-title="选择文件" class="file-label">
                            <span data-title="No File ..." class="file-name">
                                 <i class="upload-icon icon-cloud-upload blue icon-3x" id="file_upload"></i>
                            </span>
                        </label>
                    </div>
                    <div class="modal-img">
                        <a data-rel="colorbox" class="cboxElement">
                            <?php if (isset($model['article_row']) && $model['article_row']['thumb']):?>
                                <img src="<?php echo $model['article_row']['thumb'];?>" style="width: 390px; height: 130px;">
                                <input type="hidden" value="<?php echo $model['article_row']['thumb'];?>" name="Article[thumb]">
                            <?php endif;?>
                        </a>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 描述 </label>
                <div class="col-sm-9">
                    <textarea class="autosize-transition form-control"
                              name="Article[description]" style="width: 400px;height: 69px;"><?php echo isset($model['article_row'])?$model['article_row']['description']:'';?></textarea>
                </div>
            </div>

            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 内容 </label>
                <div class="col-sm-9">
                    <textarea id="intro" class="autosize-transition form-control"
                              name="Article[content]" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 69px;">
                        <?php echo isset($model['article_row'])?$model['article_row']['content']:'';?>
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