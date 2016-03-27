var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
var animate = 1000;
var wait = 100;
var i = 1;

$('.easy-pie-chart.percentage').each(function(){
    $(this).easyPieChart({
        barColor: $(this).data('color'),
        trackColor: '#EEEEEE',
        scaleColor: false,
        lineCap: 'butt',
        lineWidth: 8,
        animate: oldie ? false : animate,
        size:100
    }).css('color', $(this).data('color'));
    animate1(i,wait);
});

function animate1(i,wait)
{
    if (wait != 0) {
        $('.percent').html(i);
        wait--;
        i++;
        setTimeout(function() {
            animate1(i,wait)
        },animate/100)
    }
}

$(function(){
    $('table th input:checkbox').on('click' , function(){
        var that = this;
        $(this).closest('table').find('tr > td:first-child input:checkbox')
        .each(function(){
            this.checked = that.checked;
            $(this).closest('tr').toggleClass('selected');
        });

    });
});

//时间控件
function datepicker () {
    $('.date').datepicker(
        {format:'yyyy-m-d'}
    );

    $('.time').timepicker({
        minuteStep: 1,
        showSeconds: true,
        showMeridian: false
    }).val('').next().on(ace.click_event, function(){
        $(this).prev().focus();
    });
}

function alertMsg(msg)
{
    bootbox.dialog({
        message: "<span class='bigger-110 red'>"+msg+"</span>",
        buttons:
        {
            "success" :
            {
                "label" : "<i class='icon-ok'></i> 确定",
                "className" : "btn-sm btn-success",
                "callback": function() {
                }
            }
        }
    });
    return false;
}