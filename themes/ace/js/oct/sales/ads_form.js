$(function(){
    /*上传图片*/
    $('#file_upload').uploadify({
        'auto':true,
        'height':60,
        'swf'      : '/themes/bootstrap/images/uploadify.swf',
        'uploader' : '?r=upload/index&a=special',
        'width':90,
        'removeCompleted' : true,
        'uploadLimit' : 1,
        'fileSizeLimit' : '10000KB',
        'fileTypeExts' : '*.gif; *.jpg; *.png',
        'buttonClass':'icon-cloud-upload blue',
        'onUploadSuccess' : function(file, data, response) {
            var data = eval("("+data+")");
            var html = '<img style="width: 390px; height: 130px;" src="'+data.url_name+'" class="img-rounded">';
            html += '<input type="hidden" name="Ads[img_url]" value="'+data.file_name+'">';
            $('.cboxElement').html(html);
        },
        'onUploadError' : function(file, errorCode, errorMsg, errorString) {
            alert('文件' + file.name + '上传失败');
        }
    });

    /*表单验证*/
    $('#validation-form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            'Ads[title]':{
                required:true
            },
            'Ads[type]':{
                required:true
            },
            'Ads[key]':{
                required:true
            },
            'Ads[img_url]':{
                required:true
            },
            'Ads[url]':{
                required:true
            },
            'Ads[desc]':{
                required:true
            }
        },

        messages: {
            'Ads[title]':{
                required:"广告标题不能为空"
            },
            'Ads[type]':{
                required:'广告类型不能为空'
            },
            'Ads[key]':{
                required:'广告key值不能为空'
            },
            'Ads[img_url]':{
                required:'广告图片不能为空'
            },
            'Ads[url]':{
                required:'链接地址'
            },
            'Ads[desc]':{
                required:'广告描述'
            }
        },

        invalidHandler: function (event, validator) { //display error alert on form submit
            $('.alert-danger', $('.login-form')).show();
        },

        highlight: function (e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },

        success: function (e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        },

        errorPlacement: function (error, element) {
            if(element.is(':checkbox') || element.is(':radio')) {
                var controls = element.closest('div[class*="col-"]');
                if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
                else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
            }
            else if(element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            }
            else if(element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            }
            else error.insertAfter(element.parent());
        },

        submitHandler: function (form) {
            form.submit();
        },
        invalidHandler: function (form) {
        }
    });
});
