/**************************************查看操作订单***************************************/
$('#content').on('click','.view',function(){
    var obj = $(this);
    var order_id = obj.attr('data');

    if (obj.attr('data-type') == 'close') {
        obj.html('<button class="btn btn-xs btn-info">查看/操作</button>');
        $('.order-detail').remove();
        obj.removeAttr('data-type');
        return false;
    }

    $('.order-detail').remove();
    $('.view').html('<button class="btn btn-xs btn-info">查看/操作</button>');
    $('.view').removeAttr('data-type');

    $.post(
        '?r=order/order/base',
        {'order_id':order_id},
        function(data) {
            obj.parents('tr').after(data);
            obj.attr('data-type','close');

            obj.html('<button class="btn btn-xs btn-yellow">查看/操作</button>');
        }
    );
});

$('#content').on('click','.order-detail li',function(){
    var data = $(this).attr('data');
    var data_arr = data.split('-');
    var act = data_arr[0];
    var order_id = data_arr[1];

    $('.table tr.selected td').css('background','none');

    $(this).attr('class','active').siblings().removeAttr('class');
    $.post(
        '?r=order/order/'+act,
        {'order_id':order_id,'act':act},
        function (result) {
            $('.info').html(result);
        }
    );
});
/**************************************支付***************************************/
$('#content').on('click','.order_pay',function(){
    var order_id = $(this).attr('data');
    $.post(
        '?r=order/pay/index',
        {'order_id':order_id},
        function (data) {
            bootbox.dialog({
                message: data
            });
        }
    );
});

$('body').on('click','.submit-pay',function(){
    var data = $('#pay-form').serialize();
    if ($("input[name='Payments[bank]']").val() == '') {
        alert('收款银行不能为空');return false;
    }
    if ($("input[name='Payments[account]']").val() == '') {
        alert('收款帐号不能为空');return false;
    }
    if ($("input[name='Payments[pay_type]']").val() == '') {
        alert('付款类型不能为空');return false;
    }
    if ($("input[name='Payments[pay_app_id]']").val() == '') {
        alert('支付方式不能为空');return false;
    }
    if ($("input[name='Payments[pay_account]']").val() == '') {
        alert('付款人不能为空');return false;
    }

    $.ajax({
        cache: true,
        type: "POST",
        url:'?r=order/pay/create',
        data:data,// 你的formid
        async: false,
        dataType:"json",
        error: function() {
            alert('支付失败');
        },
        success: function(result) {
            if (result.code == 200) {
                $( '.bootbox' ).remove();
                $( '.modal-backdrop' ).remove();
                alert('支付成功');
                location.reload();
            } else {
                alert('支付失败');
            }
        }
    });
});

/**************************************退款***************************************/
$('#content').on('click','.order_refund',function(){
    var order_id = $(this).attr('data');
    $.post(
        '?r=order/pay/refund',
        {'order_id':order_id},
        function (data) {
            bootbox.dialog({
                message: data
            });
        }
    );
});

$('body').on('click','.submit-refunds',function(){
    var data = $('#refund-form').serialize();
    if ($("input[name='Refunds[bank]']").val() == '') {
        alert('退款银行不能为空');return false;
    }
    if ($("input[name='Refunds[account]']").val() == '') {
        alert('退款帐号不能为空');return false;
    }
    if ($("input[name='Refunds[pay_type]']").val() == '') {
        alert('退款类型不能为空');return false;
    }
    if ($("input[name='Refunds[pay_app_id]']").val() == '') {
        alert('退款方式不能为空');return false;
    }
    if ($("input[name='Refunds[pay_account]']").val() == '') {
        alert('退款人不能为空');return false;
    }

    $.ajax({
        cache: true,
        type: "POST",
        url:'?r=order/pay/refundcreate',
        data:data,// 你的formid
        async: false,
        dataType:"json",
        error: function() {
            alert('退款失败');
        },
        success: function(result) {
            if (result.code == 200) {
                $( '.bootbox' ).remove();
                $( '.modal-backdrop' ).remove();
                alert('退款成功');
                location.reload();
            } else {
                alert('退款失败');
            }
        }
    });
});

/**************************************发货***************************************/
$('body').on('change','#consigneePr',function(){
    var province_id = $('#consigneePr').val();
    var city_default = '<option value="">请选择城市</option>';
    $.post(
        '?r=order/delivery/region',
        {'region_id':province_id},
        function (result) {
            $('#consigneeCity').html(city_default+result);
            $('#consigneeArea').html('<option value="">请选择地区</option>');
        }
    );
});

$('body').on('change','#consigneeCity',function(){
    var city_id = $('#consigneeCity').val();
    var area_default = '<option value="">请选择地区</option>';
    $.post(
        '?r=order/delivery/region',
        {'region_id':city_id},
        function (result) {
            $('#consigneeArea').html(area_default + result);
        }
    );
});

$('#content').on('click','.order_delivery',function(){
    var order_id = $(this).attr('data');
    $.post(
        '?r=order/delivery/index',
        {'order_id':order_id},
        function (data) {
            bootbox.dialog({
                message: data
            });
        }
    );
});

$('body').on('click','.submit-delivery',function(){
    var data = $('#delivery-form').serialize();
    if ($("input[name='Delivery[shipping_id]']").val() == '') {
        alert('配送方式不能为空');return false;
    }
    if ($("input[name='Delivery[logi_id]']").val() == '') {
        alert('物流公司不能为空');return false;
    }
    if ($("input[name='cost_freight']").val() == '') {
        alert('物流费用不能为空');return false;
    }
    if ($("input[name='Area[town]']").val() == '' || $("input[name='Area[city]']").val() == '' || $("input[name='Area[province]']").val() == '') {
        alert('地区不能为空');return false;
    }
    if ($("input[name='ship_addr']").val() == '') {
        alert('详细地址不能为空');return false;
    }
    if ($("input[name='Delivery[logi_no]']").val() == '') {
        alert('物流单号不能为空');return false;
    }

    $.ajax({
        cache: true,
        type: "POST",
        url:'?r=order/delivery/create',
        data:data,// 你的formid
        async: false,
        dataType:"json",
        error: function() {
            alert('发货失败');
        },
        success: function(result) {
            if (result.code == 200) {
                $( '.bootbox' ).remove();
                $( '.modal-backdrop' ).remove();
                alert('发货成功');
                location.reload();
            } else {
                alert('发货失败');
            }
        }
    });
});

/**************************************退货***************************************/
$('#content').on('click','.order_reship',function(){
    var order_id = $(this).attr('data');
    $.post(
        '?r=order/delivery/reship',
        {'order_id':order_id},
        function (data) {
            bootbox.dialog({
                message: data
            });
        }
    );
});

$('body').on('click','.submit-reship',function(){
    var data = $('#reship-form').serialize();
    if ($("input[name='Delivery[shipping_id]']").val() == '') {
        alert('配送方式不能为空');return false;
    }
    if ($("input[name='Delivery[logi_id]']").val() == '') {
        alert('物流公司不能为空');return false;
    }
    if ($("input[name='Area[town]']").val() == '' || $("input[name='Area[city]']").val() == '' || $("input[name='Area[province]']").val() == '') {
        alert('地区不能为空');return false;
    }
    if ($("input[name='ship_addr']").val() == '') {
        alert('详细地址不能为空');return false;
    }
    if ($("input[name='Delivery[logi_no]']").val() == '') {
        alert('物流单号不能为空');return false;
    }

    $.ajax({
        cache: true,
        type: "POST",
        url:'?r=order/delivery/reshipcreate',
        data:data,// 你的formid
        async: false,
        dataType:"json",
        error: function() {
            alert('退货失败bug');
        },
        success: function(result) {
            if (result.code == 200) {
                $( '.bootbox' ).remove();
                $( '.modal-backdrop' ).remove();
                alert('退货成功');
                location.reload();
            } else {
                alert(result.msg);
            }
        }
    });
});
