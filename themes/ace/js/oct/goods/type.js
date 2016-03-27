/***************************扩展属性*******************************/
$('#type-props').on('click',function(){
    var html = '';
    var obj;
    $.post(
        '?r=goods/props/ajaxlist',
        {},
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
                            $('.props_list:checked').each(function(){
                                obj = $(this);
                                html = '<tr><td><input type="hidden" name="TypeProps[props_id][]" value="'+obj.val()+'">'+obj.next().next().val()+'</td>' +
                                    '<td>'+obj.next().next().next().val()+'</td>' +
                                    '<td><div class="tags" style="overflow-x: hidden;border: none;"><span class="tag">'+obj.next().next().next().next().val()+'</span></div></td>' +
                                    '<td><button class="btn btn-xs btn-danger del"><i class="fa icon-trash bigger-120"></i></button></td></tr>'
                                $(html).appendTo('#type-props-list');
                            });

                        }
                    }
                }
            });
        }
    );
});

$('body').on('click','.del',function(){
    $(this).parent().parent().remove();
});

/***************************类型删除*******************************/
$(function(){
    $(".bootbox-delete").on(ace.click_event, function() {
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
                        location.href='?r=goods/type/delete&type_id='+id;
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
})
