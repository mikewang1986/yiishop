

/**********************************用户编辑*************************************/
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

