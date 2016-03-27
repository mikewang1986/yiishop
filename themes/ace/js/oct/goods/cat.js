$(function(){
    $("#bootbox-regular").on(ace.click_event, function() {
        bootbox.dialog({
            message: image_upload(),
            className:'upload_img'
        });
    });

    $('.cat_delete').on(ace.click_event, function() {
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
                        location.href='?r=goods/cat/delete&cat_id='+id;
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

function image_upload()
{
    var template;

    $.ajax({
        type: "POST",
        async:false, //同步；
        url: "?r=goods/cat/img",
        data: "",
        success: function(msg){
            template = msg;
        }
    });
    return template;
}