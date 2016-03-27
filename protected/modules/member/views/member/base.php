<tr id="member-detail">
    <td colspan="9">
        <?php echo $this->renderPartial('_nav',array('member_id'=>$member_info['member_id']),true);?>

        <div class="hero-unit info" style="margin-bottom: 10px;padding: 3px;">
            <?php echo $this->renderPartial(
                '_member_base',
                array(
                    'member_info'=>$member_info,
                ),
                true);
            ?>
        </div>
    </td>
</tr>

<script>
    $('#member-detail li').click(function(){
        var data = $(this).attr('data');
        var data_arr = data.split('-');
        var act = data_arr[0];
        var member_id = data_arr[1];

        $('.table tr.selected td').css('background','none');

        $(this).attr('class','active').siblings().removeAttr('class');
        $.post(
            '?r=member/member/'+act,
            {'member_id':member_id,'act':act},
            function (result) {
                $('.info').html(result);
            }
        );
    });
</script>