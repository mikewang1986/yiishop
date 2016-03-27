$(function($){
    //表单验证
    $('#validation-form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            'Goods[name]': {
                required: true
            }
        },

        messages: {
            'Goods[name]':{
                required:"商品名称不能为空"
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

    var colorbox_params = {
        reposition:true,
        scalePhotos:true,
        scrolling:false,
        previous:'<i class="icon-arrow-left"></i>',
        next:'<i class="icon-arrow-right"></i>',
        close:'&times;',
        current:'{current} of {total}',
        maxWidth:'100%',
        maxHeight:'100%',
        onOpen:function(){
            document.body.style.overflow = 'hidden';
        },
        onClosed:function(){
            document.body.style.overflow = 'auto';
        },
        onComplete:function(){
            $.colorbox.resize();
        }
    };

    $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
    $("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");
})

/***********************商品分类*******************************/
$('#goods_cat').on('click',function(){
    var goods_cat_id = $('#goods_cat_id').val();
    //商品分类弹出展示
    $.post(
        '?r=goods/cat/ajaxgoodscat',
        {'cat_id':goods_cat_id},
        function(data) {
            bootbox.dialog({
                message: data,
                buttons:
                {
                    "success" :
                    {
                        "label" : "<i class='icon-ok'></i> 确定",
                        "className" : "btn-sm btn-success",
                        "callback": function() {
                            var cat_name;
                            var cat_id = $('#select_cat_id').val();
                            if ($('.select_3').text()) cat_name = $('.select_3').text();
                            else if ($('.select_2').text()) cat_name = $('.select_2').text();
                            else if ($('.select_1').text()) cat_name = $('.select_1').text();

                            $('#goods_cat').val(cat_name);
                            $('#goods_cat_id').val(cat_id);
                        }
                    }
                }
            });
        }
    );
});

/*商品分类筛选*/
$('body').on('click','.goods-cat-select1 li a',function(){
    $('.goods-cat-select1 .active').removeAttr('class');
    $(this).parent().attr('class','active');
    $('.goods-cat-select2').hide();
    $('.goods-cat-select2').html('');
    $('.goods-cat-select3').hide();
    $('.goods-cat-select3').html('');

    $('.select_1').html($(this).text());
    $('.select_2').html('');
    $('.select_3').html('');
    var cat_id = $(this).parent().attr('li-cat_id');
    cat_select(cat_id,1,2);
    $('#select_cat_id').val(cat_id);
});

$('body').on('click','.goods-cat-select2 li a',function(){
    $('.goods-cat-select2 .active').removeAttr('class');
    $(this).parent().attr('class','active');
    $('.goods-cat-select3').hide();
    $('.goods-cat-select3').html('');
    $('.select_2').html($(this).text());
    $('.select_3').html('');
    var cat_id = $(this).parent().attr('li-cat_id');
    cat_select(cat_id,1,3);
    $('#select_cat_id').val(cat_id);
});

$('body').on('click','.goods-cat-select3 li a',function(){
    $('.goods-cat-select3 .active').removeAttr('class');
    $(this).parent().attr('class','active');
    $('.select_3').html($(this).text());
    var cat_id = $(this).parent().attr('li-cat_id');
    $('#select_cat_id').val(cat_id);
});

/**
 * 分类筛选
 * @param cat_id
 * @param val
 * @param show
 */
function cat_select(cat_id,val,show)
{
    $.post(
        '?r=goods/cat/ajaxgoodscat',
        {'cat_id':cat_id,'default':val},
        function (data) {
            if (data) {
                $('.goods-cat-select'+show).show();
                $('.goods-cat-select'+show).html(data);
            }
        }
    );
}

/***********************商品图片*******************************/
$('.ace-thumbnails').on('click','.image_default_opt',function(){
    var html = '<div class="tags image_default">'+
        '<span class="label-holder">'+
        '<span class="label label-danger">默认图片</span>'+
        '</span>'+
        '</div>';
    $('.image_default').remove();
    $(this).parent().prev().append(html);

    $('#image-default').val($(this).attr('data'));
    return false;
});

$('.ace-thumbnails').on('click','.image_delete_opt',function(){
    if ($(this).attr('data') == 'true') {
        $('#image-default').val($('.ace-thumbnails li:first').find('.image-id').val());
    }
    $(this).parents('li').remove();
    return false;
});
setTimeout(function(){
/*上传图片*/
$('#file_upload').uploadify({
    'auto':true,
    'height':60,
    checkExisting   : false,
    debug           : false,
    'swf'      : '/themes/bootstrap/images/uploadify.swf',
    'uploader' : 'admin.php?r=upload/product',
    'width':90,
    'removeCompleted' : true,
    'uploadLimit' : 200,
    'fileSizeLimit' : 2048,
    'fileTypeExts' : '*.gif; *.jpg;*.png;',
    'buttonClass':'icon-cloud-upload blue',
    'onUploadSuccess' : function(file, data) {
        var data = eval("("+data+")");
        if ($('.ace-thumbnails').length == 0) {
            $('#image-default').val(data.image_id);
        }

        var html ='<li><a data-rel="colorbox" title="商品图片" href="'+data.file_name+'" class="cboxElement">' +
            '<img style="width: 120px;height: 120px;" src="'+data.file_name+'"><input type="hidden" name="Image[]" value="'+data.url_name+'">' +
            '<input type="hidden" name="ImageId[]" value="'+data.image_id+'">'+
            '<div class="text"><div class="inner">点击查看大图</div></div></a>' +
            '<div class="tools tools-bottom"><button class="btn btn-minier btn-purple arrowed-right image_default_opt" data="'+data.image_id+'">默认</button>' +
            '<button class="btn btn-minier btn-pink arrowed image_delete_opt">删除</button></div></li>';
        $(html).appendTo('.ace-thumbnails');
    },
    'onUploadError' : function(file,errorCode,errorMsg, errorString) {
        alert('文件' + file.name + '上传失败'+errorCode+errorMsg+errorString);
    }
});
},10);

/***********************商品规格*******************************/
$('#myTab3 li:first').addClass('active');

$('.spec_value').on('click', function() {
    var tags_text = $(this).next().html();
    var tags_val = $(this).val();
    var tags_obj = $(this).parent().parent().find('.spec_tags');

    if ($(this).is(':checked')==false) {
        $('.tag_button_'+tags_val).remove();
    } else {
        var tags='<span class="tag tag_button_'+tags_val+'" data="'+tags_val+'">'+tags_text+'<button class="close" type="button">×</button></span>';
        tags_obj.show();
        tags_obj.append(tags);
    }
    var check_num = $(this).parent().parent().find('.spec_value:checked').length;
    $('#myTab3 .active label').text(check_num);
});

$('body').on('click','.close',function(){
    var tags_data = $(this).parent().attr('data');
    var check_num = $(this).parent().parent().parent().parent().parent().find('.spec_value:checked').length;
    $('#myTab3 .active label').text(check_num*1 - 1);
    $(this).parent().remove();
    $('#spec_value_'+tags_data).remove();

});

/**
 * 生成货品
 */
$('.spec_button').on('click',function(){
    var spec_num;
    var total_num = 1;
    var spec_str = '';
    var goods_id = $('#goods_id').val();
    $('#myTab3').find('label').each(function(){
        spec_num = $(this).html() * 1;
        if (spec_num < 1) {
            alert('每个规格项至少选中一项，才能组合成完整的货品信息。');
            $('.spec-val').html('');
            return false;
        }

        total_num *=spec_num;
    });

    $('.tag').each(function(){
        spec_str += $(this).attr('data')+',';
    });
    $.post(
        '?r=goods/spec/ajaxspecproducts',
        {'spec_str':spec_str,'goods_id':goods_id},
        function(result) {
            var obj = eval(result);
            var htmls = '';
            $(obj).each(function(index){
                var val = eval(obj[index]);
                var html = '<tr>';
                html += '<td style="width: 12%;">'+val.name+'<input type="hidden" name="Product[spec][]" value="'+val.val+'"><input type="hidden" name="Product[spec_name][]" value="'+val.name+'"></td>';
                html += '<td style="width: 15%;"><input class="col-sm-12" type="text" name="Product[bn][]" value="'+val.goods.bn+'"></td>';
                html += '<td class="center"><label><input type="checkbox" class="ace" name="Product[marketable][]" value="1" checked="true"><span class="lbl"></span></label></td>';
                html += '<td><input class="col-sm-5" type="text" name="Product[store][]" value="0"></td>';
                html += '<td>0</td>';
                html += '<td><input class="col-sm-8" type="text" name="Product[price][]" value="'+val.goods.price+'"></td>';
                html += '<td><input class="col-sm-8" type="text" name="Product[cost][]" value="'+val.goods.cost+'"></td>';
                html += '<td><input class="col-sm-8" type="text" name="Product[mktprice][]" value="'+val.goods.mktprice+'"></td>';
                html += '<td><input class="col-sm-5" type="text" name="Product[weight][]" value="'+val.goods.weight+'"></td>';
                html += '<td class="center"><label><input type="radio" class="ace product_default" name="Product[is_default][]" value="1"><span class="lbl"></span></label></td>';
                html += '<td><button class="btn btn-xs btn-danger product-del"><i class="icon-trash bigger-120"></i></button></td>';
                html += '</tr>';

                htmls += html;
            });
            $('.spec-val').html(htmls);
        }
    );

    if (!spec_num) return false;
    $('#spec_product_num').text(total_num);
});

/**
 * 删除货品
 */
$('.spec-val').on('click','.product-del',function(){
    $(this).parent().parent().remove();
    //return false;
});

/**
 * 表单提交
 */
$('.product-submit').on('click',function(){
    var is_check = true;
    //货号
    $("input[name='Product[bn][]']").each(function(){
        if ($(this).val() == '') {
            is_check = false;
            return false;
        }
    });
    if (!is_check) {
        alert('货号不能为空');
        return false;
    }

    //库存
    $("input[name='Product[store][]']").each(function(){
        if ($(this).val() == '') {
            is_check = false;
            return false;
        }
    });
    if (!is_check) {
        alert('库存不能为空');
        return false;
    }

    //默认货品
    if (!$("input[name='Product[is_default][]']:checked").val()) {
        alert('请选择默认货品');
        return false;
    }

    $('#spec-form').submit();
});

/***********************商品品牌-类型*******************************/
$('#goods_type').on('change',function(){
    var type_id = $(this).val();
    $.post(
        '?r=goods/brand/ajaxtypebrand',
        {'type_id':type_id},
        function(result) {
            $('#brand_id').html(result);
            //类型规格判断
            type_spec(type_id);
        }
    );

    $('.no_spec').show();
    $('.has_spec').hide();
});

/**
 * 类型规格
 * @param type_id
 */
function type_spec(type_id)
{
    $.post(
        '?r=goods/type/ajaxspecprops',
        {'type_id':type_id},
        function(result) {
            if (result.spec) {
                $('#is_spec').val('true');
            } else {
                $('#is_spec').val('false');
            }
            if (result.props) {
                $('#is_props').val('true');
            } else {
                $('#is_props').val('false');
            }
        },'json'
    );
}
/***********************商品--免运费商品*******************************/
$('#issendfree').on('click',function(){
    var issendfree = $("input[name='Goods[issendfree]']").val();
    if(issendfree==1){
        $("input[name='Goods[issendfree]']").val(0);
    }
    else{
        $("input[name='Goods[issendfree]']").val(1);
    }
});
/***********************商品--开启限时促销*******************************/
$('#istime').on('click',function(){
    var istime = $("input[name='Goods[istime]']").val();
    if(istime==1){
        $("input[name='Goods[istime]']").val(0);
    }
    else{
        $("input[name='Goods[istime]']").val(1);
    }
});