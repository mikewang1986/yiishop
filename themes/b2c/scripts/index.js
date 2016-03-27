var Index = function () {
    return {
        initLayerSlider: function () {
            $('#layerslider').layerSlider({
                skin : '../../themes/b2c/plugins/layerslider/skins/fullwidth',
                thumbnailNavigation : 'hover',
                hoverPrevNext : false,
                responsive : false,
                responsiveUnder : 960,
                sublayerContainer : 960
            });
        }
    };
}();

/**********************************用户登录/注册*************************************/
//登录
$('.form-login').on('submit',function(){
    if (!$('#username').val()) {
        layer.msg('用户名不能为空',1);
        return false;
    }
    if (!$('#password').val()) {
        layer.msg('密码不能为空',1);
        return false;
    }
    $.post(
        '/account/logincheckall',
        {'username':$('#username').val(),'password':$('#password').val()},
        function(result) {
            if (result.code == 400) {
                layer.msg(result.msg,1);
                return false;
            }
            location.href='/account/index.html';
        },'json'
    );
    return false;
});

//注册
$('.form-register').on('submit',function(){
    if (!$('#username').val()) {
        layer.msg('用户名不能为空',1);
        return false;
    }
    if (!$('#password').val()) {
        layer.msg('密码不能为空',1);
        return false;
    }
    if ($('#confirm-password').val() != $('#password').val()) {
        layer.msg('两次输入密码不一致',1);
        return false;
    }
    if (!$('#licence').attr("checked")) {
        layer.msg('确认用户协议才能注册',1);
        return false;
    }
    $.post(
        '/account/rescheckall',
        {'username':$('#username').val(),'password':$('#password').val()},
        function (result) {
            if (result.code == 400) {
                layer.msg(result.msg,1);
                return false;
            }
            location.href='/account/index.html';
        },'json'
    );
    return false;
});

//重置密码
$('.form-reset').on('submit',function(){
    if (!$('#password').val()) {
        layer.msg('密码不能为空',1);
        return false;
    }
    if ($('#confirm-password').val() != $('#password').val()) {
        layer.msg('两次输入密码不一致',1);
        return false;
    }
    $.post(
        '/account/resetcheck',
        {'password':$('#password').val()},
        function (result) {
            if (result.code == 400) {
                layer.msg(result.msg,1);
                return false;
            }
            layer.msg(result.msg,1,1);
            location.href='/account/index.html';
        },'json'
    );
    return false;
});

/**********************************省市区联动*************************************/
$('#area').on('change','#consigneePr',function(){
    var province_id = $('#consigneePr').val();
    var city_default = '<option value="">请选择城市</option>';
    $.post(
        '/addr/region',
        {'region_id':province_id},
        function (result) {
            $('#consigneeCity').html(city_default+result);
            $('#consigneeArea').html('<option value="">请选择地区</option>');
        }
    );
});

$('#area').on('change','#consigneeCity',function(){
    var city_id = $('#consigneeCity').val();
    var area_default = '<option value="">请选择地区</option>';
    $.post(
        '/addr/region',
        {'region_id':city_id},
        function (result) {
            $('#consigneeArea').html(area_default + result);
        }
    );
});

/**********************************购物车*************************************/
$('body').on('click','#add-cart',function(){
    var product_id = $('#product-id').val();
    var quantity = $('#product-quantity').val();
    add(product_id,quantity);
});

function add(product_id,quantity)
{
    $.post(
        '/cart/insert',
        {'product_id':product_id,'quantity':quantity},
        function (result) {
            if (result.code == 200) {
                layer.msg(result.msg,2,-1);
                location.reload();
            } else {
                layer.msg(result.msg,2,-1);
            }
        },'json'
    );
}

//删除购物车商品
function cart_del(product_id){
    layer.confirm('确定删除吗？',function(){
        $.post(
            '/cart/delete',
            {'product_id':product_id},
            function(data){
                if(data.code == 200){
                    layer.msg('删除成功', 1, -1);
                    location.reload();
                }else{
                    layer.msg(data.msg, 1, -1);
                }
            },
            "json"
        );
    });
}

/**********************************订单操作*************************************/

/**********************************地址操作*************************************/
//收货地址新增/编辑
$(function(){
    $('.form-addr').submit(function(){
        var msg = '';
        if (!$('#consigneePr').val() || $('#consigneePr').val() == 0) {
            msg = '省份不能为空';
            layer.msg(msg,1);
            return false;
        }
        if (!$('#consigneeCity').val() || $('#consigneeCity').val() == 0) {
            msg = '市不能为空';
            layer.msg(msg,1);
            return false;
        }
        if (!$('#consigneeArea').val() || $('#consigneeArea').val() == 0) {
            msg = '区/县不能为空';
            layer.msg(msg,1);
            return false;
        }
        if (!$('#consigneeAd').val()) {
            msg = '详细地址不能为空';
            layer.msg(msg,1);
            return false;
        }
        if (!$('#consignee').val()) {
            msg = '收货人不能为空';
            layer.msg(msg,1);
            return false;
        }
        if (!$('#consigneeNo').val()) {
            msg = '手机不能为空';
            layer.msg(msg,1);
            return false;
        }
    });
})


//删除地址
$('.addr-del').on('click',function(){
    var href = $(this).attr('href');
    var obj = $(this);
    $.layer({
        dialog: {
            msg: '您确定删除地址',
            type: 1,
            yes: function(){
                $.post(
                    href,
                    {},
                    function (result) {
                        if (result.code == 200) {
                            obj.parents('tr').remove()
                            layer.msg(result.msg,1,1);
                        } else layer.msg(result.msg,1);
                    },'json'
                );
            }, no: function(){
                return false;
            }
        }
    });
    return false;
});