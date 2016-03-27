$(function(){
    var nav_height = $('.navbar').height();
    var page_height = $(document).height();
    $('.base_left').css('height',(page_height - nav_height -5)+'px');
});

function GetCheckbox(url){
    var data=new Array();
    $("input[name='selectdel[]']:checked").each(function (){

        data.push($(this).val());
    });
    if(data.length > 0){
        $.post(url,{'selectdel[]':data},
            function(){window.location.reload();}
    );

    }else{
        alert("请选择要删除的内容!");
    }

}
