$(function(){
    $("#goods_regular").on(ace.click_event, function() {
        $.post(
            '?r=goods/default/ajaxgoodslist',
            {},
            function (data) {
                bootbox.dialog({
                    message: data,
                    buttons:
                    {
                        "success" :
                        {
                            "label" : "<i class='icon-ok'></i> 确定",
                            "className" : "btn-sm btn-success",
                            "callback": function() {
                                var goods_id = $("input[name='goods_id']:checked").val();
                                var goods_name = $("input[name='goods_id']:checked").attr('data');

                                $('#goods_regular').val(goods_name);
                                $('#goods_regular_id').val(goods_id);
                            }
                        }
                    }
                });
            }
        );

    });

    /*表单验证*/
    $('#validation-form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            'Seckill[goods_name]':{
                required:true
            },
            'Seckill[goods_id]': {
                required: true
            },
            'Seckill[num]':{
                required:true
            },
            'Seckill[price]':{
                required:true
            }
        },

        messages: {
            'Seckill[goods_name]':{
                required:"秒杀商品不能为空"
            },
            'Seckill[goods_id]':{
                required:"秒杀商品不能为空"
            },
            'Seckill[num]':{
                required:"秒杀商品数量不能为空"
            },
            'Seckill[price]':{
                required:"秒杀商品价格不能为空"
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

    $('input[name="Seckill[start_date]"]').datepicker(
        {format:'yyyy-m-d'}
    );

    $('input[name="Seckill[end_date]"]').datepicker(
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