$(function(){
    $("#bootbox-regular").on(ace.click_event, function() {
        bootbox.dialog({
            message: image_upload(),
            className:'upload_img'
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
