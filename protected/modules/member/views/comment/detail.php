<tr id="comment-detail">
    <td colspan="7">
        <table class="table order-table-info">
            <tr>
                <td>
                    <div class="col-sm-2" style="width: 10%;">
                        <img style="width: 150px;height: 150px;" src="<?php echo Yii::app()->baseUrl.$image_row['m_url'];?>">
                    </div>
                    <div class="col-sm-10">
                        <p>商品名称： <?php echo $goods_row['name'];?></p>
                        <p>商品链接
                            <a href="<?php echo Yii::app()->request->getHostInfo().'/product.html?id=17';?>" target="_blank">
                            <?php echo Yii::app()->request->getHostInfo().'/product.html?id=17';?>
                            </a>
                        </p>
                        <p>共11次评论</p>
                        <p>发表人： <?php echo $comment_row['author'];?></p>
                        <p>联系方式： <?php echo $comment_row['contact'];?></p>
                        <p>发表时间： <?php echo date('Y-m-d H:i:s',$comment_row['time']);?></p>
                        <p>发表人IP： <?php echo $comment_row['ip'];?></p>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="col-sm-2" style="width: 10%;">
                    </div>
                    <div class="col-sm-10">
                        <p>咨询内容
                            <?php if ($comment_row['display'] == 'false'):?>
                                <a href="javascript:;">[显示到商品页]</a>
                            <?php else:?>
                                <a href="javascript:;">[关闭显示]</a>
                            <?php endif;?>
                            <a href="javascript:;">[删除]</a>
                        </p>
                        <p>咨询项目：<?php echo Yii::app()->params['comment_type'][$comment_row['object_type']];?></p>
                        <p>内容：<?php echo $comment_row['comment'];?></p>
                    </div>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="col-sm-2" style="width: 10%;">
                    </div>
                    <div class="col-sm-10">
                        <p>管理员于[15-03-31 10:40]回复：
                            <?php if ($comment_row['display'] == 'false'):?>
                                <a href="javascript:;">[显示到商品页]</a>
                            <?php else:?>
                                <a href="javascript:;">[关闭显示]</a>
                            <?php endif;?>
                            <a href="javascript:;">[删除]</a>
                        </p>
                        <p>内容：您好 请问您身高体重孕期是多少呢</p>
                        <p>
                            回复用户：<textarea style="width: 300px;height: 80px;" id="relay-content"></textarea>
                        </p>
                        <p>
                            <button id="comment-add" class="btn btn-white" style="margin-left: 120px;">保存</button>
                        </p>
                    </div>
                </td>
            </tr>
        </table>
    </td>
</tr>

<script>
    $('#comment-detail li').click(function(){
        var data = $(this).attr('data');
        var data_arr = data.split('-');
        var act = data_arr[0];
        var member_id = data_arr[1];

        $('.table tr.selected td').css('background','none');

        $(this).attr('class','active').siblings().removeAttr('class');
        $.post(
            '?r=member/comment/'+act,
            {'member_id':member_id,'act':act},
            function (result) {
                $('.info').html(result);
            }
        );
    });
</script>