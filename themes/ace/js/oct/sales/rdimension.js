$(function(){
    $(".bootbox-confirm").on(ace.click_event, function() {
        var dimension_id = $(this).attr('data');
        bootbox.dialog({
            message: "<span class='bigger-110 red'>确定要删除这 1 项吗？</span>",
            buttons:
            {
                "success" :
                {
                    "label" : "<i class='icon-ok'></i> 确定",
                    "className" : "btn-sm btn-success",
                    "callback": function() {

                        location.href='?r=sales/rdimension/delete&dimension_id='+dimension_id;
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
    /*表单验证*/
    $('#validation-form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            'Dimension[channel]':{
                required:true
            },
            'Dimension[page_type]': {
                required: true
            },
            'Dimension[position_no]':{
                required:true
            },
            'Dimension[width]':{
                required:true
            },
            'Dimension[height]':{
                required:true
            }
        },

        messages: {
            'Dimension[channel]':{
                required:"所属去掉不能为空"
            },
            'Dimension[page_type]':{
                required:"页面类型不能为空"
            },
            'Dimension[position_no]':{
                required:"位置编号不能为空"
            },
            'Dimension[width]':{
                required:"宽度不能为空"
            },
            'Dimension[height]':{
                required:"高度不能为空"
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