<style>
    .modal-img{
        border: 1px solid #f5f5f5;
        display: block;
        float: left;
        margin: 2px;
        overflow: hidden;
        position: relative;
        width: 150px;
        height: 150px;
    }
</style>
<div class="row">
    <div class="col-xs-12">
        <div id="dropzone">
            <div class="dropzone dz-clickable" style="overflow-y: hidden;height: auto;">
                <div class="dz-default dz-message">
                    <div class="col-sm-12 form-actions">
                        <div class="ace-file-input ace-file-multiple">
                            <span class="bigger-150 bolder"><i class="icon-caret-right red"></i> 上传文件</span>
                            <span class="smaller-80 grey">(点击)</span>
                            <span data-title="No File ..." class="file-name">
                                <i class="upload-icon icon-cloud-upload blue icon-3x" id="file_upload"></i>
                            </span>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <div class="modal-img">
                            <a data-rel="colorbox" class="cboxElement">
                                <img src="/themes/ace/images/no_pic.jpg" alt="150x150">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- PAGE CONTENT ENDS -->
    </div><!-- /.col -->
</div>
<script type="text/javascript">
    <?php $timestamp = time();?>
    $(function() {
        $('#file_upload').uploadify({
            'auto':true,
            'height':80,
            'swf'      : '<?php echo Yii::app()->baseUrl; ?>/themes/bootstrap/images/uploadify.swf',
            'uploader' : '<?php echo Yii::app()->controller->createUrl("/upload/default",array('width'=>$width,'height'=>$height))?>',
            'width':90,
            'removeCompleted' : true,
            'uploadLimit' : 10,
            'fileSizeLimit' : '5000KB',
            'fileTypeExts' : '*.gif; *.jpg; *.png',
            'buttonClass':'upload-icon icon-cloud-upload blue icon-3x',
            'onCancel' : function(file) {
                //alert('The file ' + file.name + ' was cancelled.');
            },
            'onSelect' : function(file) {
                //console.log(getPath(this))
                //getObjectURL(this);
                //alert('The file ' + file.name + ' was added to the queue.');
            },
            'onComplete' : function(event,queueID,fileObj,response,data) {
                alert(data);
            },
            'onClearQueue' : function(queueItemCount) {
                //alert(queueItemCount + ' file(s) were removed from the queue');
                // addLimit();
            },
            'onUploadComplete' : function(file) {
                //alert('The file ' + file.name + ' finished processing.');

            },
            'onUploadSuccess' : function(file, data, response) {
                var data = eval("("+data+")");
                var html = '<img style="width: 140px; height: 140px;" src="'+data.file_name+'" class="img-rounded">';
                html += '<input type="hidden" name="img_url" value="'+data.file_name+'">';
                $('.cboxElement').html(html);
            },
            'onUploadError' : function(file, errorCode, errorMsg, errorString) {
                alert('文件' + file.name + '上传失败');
            }
        });
    });
</script>