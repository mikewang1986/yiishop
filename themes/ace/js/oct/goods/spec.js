/***************************规格管理**********************/
//上移
$('#spec-table').on('click','.spec_up',function(){
    var obj_tr = $(this).parents('tr');
    obj_tr.prev().before(obj_tr);
    return false;
});

//下移
$('#spec-table').on('click','.spec_down',function(){
    var obj_tr = $(this).parents('tr');
    obj_tr.next().after(obj_tr);
    return false;
});

//删除
$('#spec-table').on('click','.spec_del',function(){
    var obj_tr = $(this).parent().parent();
    obj_tr.remove();
});

//新增
$('.spec_insert').on('click',function(){
    var obj_tr = $('#spec-table tr:last');
    var html = '<tr><td><input type="text" value="" name="SpecValue[spec_value][]">' +
        '<input type="hidden" value="0" name="SpecValue[spec_value_id][]"></td>' +
        '<td><input type="text" value="" name="SpecValue[alias][]"></td>' +
        '<td><button class="btn btn-xs btn-success spec_up"><i class="fa fa-arrow-up bigger-120"></i></button>' +
        '&nbsp;' +
        '<button class="btn btn-xs btn-success spec_down"><i class="fa fa-arrow-down bigger-120"></i></button>' +
        '&nbsp;' +
        '<button class="btn btn-xs btn-danger spec_del"><i class="fa icon-trash bigger-120"></i></button>' +
        '</td></tr>';
    obj_tr.after(html);
    return false;
});

$(function(){
    $('.spec_delete').on(ace.click_event, function() {
        var spec_id = $(this).attr('data');
        bootbox.dialog({
            message: "<span class='bigger-110 red'>确定要删除这 1 项吗？</span>",
            buttons:
            {
                "success" :
                {
                    "label" : "<i class='icon-ok'></i> 确定",
                    "className" : "btn-sm btn-success",
                    "callback": function() {

                        location.href='?r=goods/spec/delete&dimension_id='+spec_id;
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
