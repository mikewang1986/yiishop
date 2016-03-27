<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/themes/default/default.css" />
<link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/plugins/code/prettify.css" />

<script charset="utf-8" src="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/kindeditor.js"></script>
<script charset="utf-8" src="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script charset="utf-8" src="<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/plugins/code/prettify.js"></script>
<div class="page-header">
    <h1>
        品牌
    </h1>
</div>

<div class="row">
    <div class="col-xs-12">
        <form class="form-horizontal" id="validation-form" novalidate="novalidate" action="?r=goods/brand/<?php echo $action;?>" method="post">
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 名称 </label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-5" name="Brand[brand_name]" value="<?php echo isset($model['brand_item'])?$model['brand_item']['brand_name']:'';?>">
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 别名 </label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-5" name="Brand[brand_keywords]" value="<?php echo isset($model['brand_item'])?$model['brand_item']['brand_keywords']:'';?>">
                    <label>（|分隔，以|开头与结尾）</label>
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 排序 </label>
                <div class="col-sm-7">
                    <input type="text" class="col-sm-1" name="Brand[ordernum]" value="<?php echo isset($model['brand_item'])?$model['brand_item']['ordernum']:'99';?>">
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 网址 </label>
                <div class="col-sm-9">
                    <input type="text" class="col-xs-10 col-sm-5" name="Brand[brand_url]" value="<?php echo isset($model['brand_item'])?$model['brand_item']['brand_url']:'';?>">
                </div>
            </div>

            <div class="form-group">
                <label for="form-field-4" class="col-sm-3 control-label no-padding-right">图片</label>
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
                            <?php if (isset($model['brand_item']) && $model['brand_item']['brand_logo']):?>
                                <img src="<?php echo $model['brand_item']['brand_logo'];?>" style="width: 390px; height: 130px;">
                                <input type="hidden" value="<?php echo $model['brand_item']['brand_logo'];?>" name="Brand[brand_logo]">
                            <?php endif;?>
                        </a>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 商品类型关联 </label>
                <div class="col-sm-6">
                    <?php foreach ($model['type_list'] as $v):?>
                    <label>
                        <input type="checkbox" class="ace" name="GoodsType[]" value="<?php echo $v['type_id'];?>" <?php echo isset($model['type_brand_list'])&&in_array($v['type_id'],$model['type_brand_list'])?'checked':'';?>>
                        <span class="lbl"> <?php echo $v['name'];?></span>
                    </label>
                    <?php endforeach;?>
                </div>
            </div>
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 详细说明 </label>
                <div class="col-sm-9">
                    <div class="col-xs-8">
                        <textarea name="Brand[brand_desc]" ><?php echo isset($model['brand_item'])?$model['brand_item']['brand_desc']:'';?></textarea>
                    </div>
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
        var editor1 = K.create('textarea', {
            width : '800px',
            height : '300px',
            cssPath : '<?php echo Yii::app()->theme->baseUrl; ?>/kindeditor-4.1.10/plugins/code/prettify.css',
            uploadJson : '?r=site/filejson',
            allowFileManager : true
        });
        prettyPrint();
    });
</script>