/*********************筛选页面高度*************************/
var billContainer_height = $('#filter_form').height();
$(function(){
    $('.billContainer2').height(billContainer_height - 10);

    datepicker();
});

/*********************商品选择*************************/
$("#recommend_search").on('click', function() {
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

/*********************渠道、类型、位置管理*************************/
$('#Dimension_channel').on('change',function(){
    var channel = $(this).val();
    if (channel == '') {
        $('#Dimension_page_type').html('<option value="">请选择</option>');
        $('#Dimension_position').html('<option value="">请选择</option>');
        return false;
    }
    $.post(
        '?r=sales/rdimension/channel',
        {'channel':channel},
        function (result) {
            $('#Dimension_page_type').html(result);
        }
    );
});

$('#Dimension_page_type').on('change',function(){
    var channel = $('#Dimension_channel').val();
    var page_type = $(this).val();
    if (page_type == '') {
        $('#Dimension_position').html('<option value="">请选择</option>');
        return false;
    }
    $.post(
        '?r=sales/rdimension/pagetype',
        {'channel':channel,'page_type':page_type},
        function (result) {
            $('#Dimension_position').html(result);
        }
    );
});

/*********************表单验证*************************/
/*表单验证*/
$('#validation-form').validate({
    errorElement: 'div',
    errorClass: 'help-block',
    focusInvalid: false,
    rules: {
        'goods_name':{
            required:true
        },
        'Recommend[title]': {
            required: true
        },
        'Dimension[channel]':{
            required:true
        },
        'Dimension[page_type]':{
            required:true
        },
        'Recommend[dimension_id]':{
            required:true
        },
        'Time[start_date]':{
            date:false,
            required:true
        },
        'Time[end_date]':{
            date:false,
            required:true
        }
    },

    messages: {
        'goods_name':{
            required:"商品不能为空"
        },
        'Dimension[title]':{
            required:"促销语不能为空"
        },
        'Dimension[channel]':{
            required:"所属渠道不能为空"
        },
        'Recommend[page_type]':{
            required:"页面类型不能为空"
        },
        'Recommend[dimension_id]':{
            required:"广告位置为空"
        },
        'Time[start_date]':{
            required:"生效时间不能为空"
        },
        'Time[end_date]':{
            required:"失效时间不能为空"
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

/*********************删除记录提示*************************/
$(".form-delete").on('click', function() {
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

                    location.href='?r=sales/recommend/delete&location_id='+id;
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

/*********************日期控件*************************/
//表单
$('input[name="advert[start_date]"]').datepicker(
    {format:'yyyy-m-d'}
);

$('input[name="advert[start_date2]"]').datepicker(
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
