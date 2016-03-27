<style>
    .modal-dialog {padding-top: 100px;width: 800px;}
    #file_upload-button span {display: none;}
    .modal-img{
        border: 2px solid #333;
        display: block;
        float: left;
        margin: 2px;
        overflow: hidden;
        position: relative;
        width: 150px;
        height: 150px;
    }
    .modal-upload{
        margin-top:80px;
        margin-left:20px;
        float: left;
    }
    .btn.btn-app.btn-sm{
        width: 50px;
    }
    .uploadify-queue-item{
        display: none;
    }
</style>
<div class="row">
    <div class="col-xs-12">
        <div id="dropzone">
            <div class="dropzone dz-clickable">
                <div class="dz-default dz-message">
                    <span>
                        <span class="bigger-150 bolder">
                            <i class="icon-caret-right red"></i> 点击上传图片
                        </span>
                        <br>
                         <div style="float: left;">
                             <div class="modal-img">
                                 <a data-rel="colorbox" class="cboxElement">
                                     <img src="/themes/ace/images/gallery/thumb-3.jpg" alt="150x150">
                                 </a>
                             </div>
                             <div>
                                 <button class="btn btn-xs btn-danger">删除</button>
                                 <button class="btn btn-xs btn-pink" onclick="img_verify();">确认</button>
                             </div>
                         </div>
                        <div class="modal-upload">
                            <i class="upload-icon icon-cloud-upload blue icon-3x" id="file_upload"></i>
                        </div>
                    </span>
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
            'uploader' : '<?php echo Yii::app()->controller->createUrl("/upload/index",array('a'=>'cat'))?>',
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
                html += '<input type="hidden" name="Cat[img_url]" value="'+data.file_name+'">';
                $('.cboxElement').html(html);
            },
            'onUploadError' : function(file, errorCode, errorMsg, errorString) {
                alert('文件' + file.name + '上传失败');
            }
        });
    });

    $('#myModal').on('click','.cancel',function(){
        $(this).parent().parent().remove();
    });

    function img_verify()
    {
        var img_html = $('.cboxElement').html();
        $('.upload_img').remove();
        $('.modal-backdrop').remove();
        $('#cat-img').html(img_html);
    }
</script>