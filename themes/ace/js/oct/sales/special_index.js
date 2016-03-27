$(function(){
    $( "#id-btn-dialog1" ).on('click', function(e) {
        e.preventDefault();

        var dialog = $( "#dialog-message" ).removeClass('hide').dialog({
            modal: true,
            title: "选择品牌",
            title_html: true,
            buttons: [
                {
                    text: "Cancel",
                    "class" : "btn btn-xs",
                    click: function() {
                        $( this ).dialog( "close" );
                    }
                },
                {
                    text: "OK",
                    "class" : "btn btn-primary btn-xs",
                    click: function() {
                        $( this ).dialog( "close" );
                    }
                }
            ]
        });
    });


});
