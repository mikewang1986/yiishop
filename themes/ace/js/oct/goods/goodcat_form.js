$(function(){
    $('.spec_delete').on(ace.click_event, function() {
        var id = $(this).attr('data');
        bootbox.dialog({
            message: "<span class='bigger-110 red'>确定要删除这 1 项吗？</span>",
            buttons:
            {
                "success" :
                {
                    "label" : "<i class='icon-ok'></i> 确定",
                    "className" : "btn-sm btn-success",
                    "callback": function() {
                          location.href='?r=goods/cat/delete&cat_id='+id;
                    }
                },
                "danger" :
                {
                    "label" : "取消",
                    "className" : "btn-sm btn-danger",
                    "callback": function() {
                        //Example.show("uh oh, look out!");
                    }
                }
            }
        });
    });
});

setTimeout(function(){
    /*上传图片*/
    $('#file_upload').uploadify({
        'auto':true,
        'height':60,
        'swf'      : '/themes/bootstrap/images/uploadify.swf',
        'uploader' : 'admin.php?r=upload/cat',
        'width':90,
        'removeCompleted' : true,
        'uploadLimit' : 20,
        'fileSizeLimit' : '10000KB',
        'fileTypeExts' : '*.gif; *.jpg;',
        'buttonClass':'icon-cloud-upload blue',
        'onUploadSuccess' : function(file, data) {
            var data = eval("("+data+")");
            var html = '<img style="width: 390px; height: 130px;" src="'+data.url_name+'" class="img-rounded">';
            html += '<input type="hidden" name="Cat[img_url]" value="'+data.file_name+'">';
            $('.cboxElement').html(html);
        },
        'onUploadError' : function(file) {
            alert('文件' + file.name + '上传失败');
        }
    });
},10);


