$(function(){
    var availableTags = '';
    $.ajax({
        url: "?r=goods/brand/special",
        dataType: "json",
        async:false, //同步
        data: {},
        success: function(data) {
            availableTags = data;
        }
    });

    /*自动提示*/
    $( "#tags" ).autocomplete({
        source: availableTags,
        select: function(e, ui) {
            var html = '<input type="hidden" value="'+ui.item.brand_id+'" name="Special[brand_id]">'+
                '<input type="hidden" value="'+ui.item.label+'" name="Special[brand_name]">';
            $('#brand-id').html(html);
        }
    });

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
            html += '<input type="hidden" name="Special[img_url]" value="'+data.file_name+'">';
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
            'special_name':{
                required:true
            },
            'Special[special_name]': {
                required: true
            },
            'Special[brief]':{
                required:true
            }
        },

        messages: {
            'special_name':{
                required:"特卖品牌不能为空"
            },
            'Special[special_name]':{
                required:"特卖说明不能为空"
            },
            'Special[brief]':{
                required:"特卖活动不能为空"
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

    $('input[name="Special[start_date]"]').datepicker(
        {format:'yyyy-m-d'}
    );

    $('input[name="Special[end_date]"]').datepicker(
        {format:'yyyy-m-d'}
    );

    $('#timepicker_start').timepicker({
        minuteStep: 1,
        showSeconds: true,
        showMeridian: false
    }).next().on(ace.click_event, function(){
        $(this).prev().focus();
    });

    $('#timepicker_end').timepicker({
        minuteStep: 1,
        showSeconds: true,
        showMeridian: false
    }).next().on(ace.click_event, function(){
        $(this).prev().focus();
    });
});