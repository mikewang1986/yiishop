<table class="table order-table-info">
    <tr>
        <td>
            <p>用户名：<?php echo $member_info['login_account'];?></p>
            <p>当前积分：<?php echo $member_info['point'];?></p>
            <p>当前预存款：<?php echo round($member_info['advance'],2);?></p>
            <p>姓名：<?php echo $member_info['name'];?></p>
            <p>备注：<?php echo $member_info['remark'];?></p>
            <p>地址：<?php echo $member_info['addr'];?></p>
        </td>
        <td>
            <p>地区：<?php echo $member_info['area'];?></p>
            <p>E-mail：<?php echo $member_info['email'];?></p>
            <p>固定电话：<?php echo $member_info['tel'];?></p>
        </td>
        <td>
            <p>手机：<?php echo $member_info['mobile'];?></p>
            <p>邮编：<?php echo $member_info['zip'];?></p>
            <p>性别：<?php echo $member_info['sex']==0?'女':'男';?></p>
        </td>
        <td>
            <p>出生日期：<?php echo $member_info['b_year'].$member_info['b_month'].$member_info['b_day'];?></p>
            <p>注册日期：<?php echo date("Y-m-d H:i:s",$member_info['regtime']);?></p>
            <p>注册IP：<?php echo $member_info['reg_ip'];?></p>
        </td>
    </tr>
</table>