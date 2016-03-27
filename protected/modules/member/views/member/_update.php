<table>
    <tr>
        <td>
            <p>用户名：<?php echo $member_info['login_account'];?></p>
            <p>邮箱：<?php echo $member_info['email'];?></p>
            <p>手机号码：<?php echo $member_info['mobile'];?></p>
            <p>会员等级：
                <select style="width: 120px;" id="member_lv">
                    <?php foreach ($member_lv_list as $v):?>
                    <option value="<?php echo $v['member_lv_id'];?>"><?php echo $v['name'];?></option>
                    <?php endforeach;?>
                </select>
            </p>
            <p>姓名：<?php echo $member_info['name'];?></p>
            <p>地区：
                <select style="width: 120px;" id="consigneePr">
                    <?php foreach ($area_list['province'] as $v):?>
                    <option value="<?php echo $v['region_id'];?>" <?php if (isset($area_list['province_id']) && $v['region_id'] == $area_list['province_id']):?>selected="selected" <?php endif;?>>
                        <?php echo $v['local_name'];?>
                    </option>
                    <?php endforeach;?>
                </select>
                <?php if(isset($area_list['city'])):?>
                <select style="width: 120px;" id="consigneeCity">
                    <?php foreach ($area_list['city'] as $v):?>
                    <option value="<?php echo $v['region_id'];?>" <?php if ($v['region_id'] == $area_list['city_id']):?>selected="selected" <?php endif;?>>
                        <?php echo $v['local_name'];?>
                    </option>
                    <?php endforeach;?>
                </select>
                <?php endif;?>
                <?php if (isset($area_list['town'])):?>
                <select style="width: 120px;" id="consigneeArea">
                    <?php foreach ($area_list['town'] as $v):?>
                    <option value="<?php echo $v['region_id']?>" <?php if ($v['region_id'] == $area_list['town_id']):?>selected="selected" <?php endif;?>>
                        <?php echo $v['local_name'];?>
                    </option>
                    <?php endforeach;?>
                </select>
                <?php endif;?>
            </p>
            <p>联系地址：<input type="text" value="<?php echo $member_info['addr'];?>" id="addr"> </p>
            <p>性别：
                <input type="radio" name="optionsRadios" id="optionsRadios1" value="sex" <?php if ($member_info['sex'] == 1):?>checked<?php endif;?>>男
                <input type="radio" name="optionsRadios" id="optionsRadios1" value="sex" <?php if ($member_info['sex'] == 0):?>checked<?php endif;?>>女
            </p>
        </td>
    </tr>
</table>
<button style="margin-left: 120px;" class="btn btn-white" id="member-update">保存</button>