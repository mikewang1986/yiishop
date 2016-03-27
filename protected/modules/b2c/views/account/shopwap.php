<div class="container">
    <ul class="breadcrumb">
        <li><a href="/">首页</a></li>
        <li><a href="/account/index.html">会员中心</a></li>
        <li class="active">资料修改</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
        <!-- BEGIN SIDEBAR -->
        <?php echo $this->renderPartial('/common/_left_profile');?>
        <!-- END SIDEBAR -->
        <!-- BEGIN CONTENT -->
        <div class="col-md-9 col-sm-9">
            <h1>用户资料</h1>
            <div class="content-form-page">
                <div class="row">
                    <div class="col-md-7 col-sm-7">
                        <form class="form-horizontal" method="post" action="/account/save" onsubmit="return checkInfo(this);">
                            <fieldset>
                                <legend></legend>
                                <div class="form-group">
                                    <label for="password" class="col-lg-4 control-label">注册手机号<span class="require">*</span></label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" value="<?php echo $userinfo['mobile']; ?>" id="mobile" name="members[mobile]">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="confirm-password" class="col-lg-4 control-label">用户名 <span class="require">*</span></label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" value="<?php echo $userinfo['name']; ?>" id="name" name="members[name]">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="confirm-password" class="col-lg-4 control-label">邮箱 </label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" value="<?php echo $userinfo['email']; ?>" id="name" name="members[email]">
                                    </div>
                                </div>
                                <!---  提款信息         --->
                                <div class="form-group">
                                    <label for="confirm-password" class="col-lg-4 control-label">取款方式 </label>
                                    <div class="col-lg-8">
                                        <select class="form-control input-sm" id="outgold_paytype"  name="outgoldinfo[outgold_paytype]" onchange="changeoutgold(this)">
                                            <option value="1" <?php  if(empty($outgoldinfo['outgold_paytype'])||$outgoldinfo['outgold_paytype']==1):
                                             ?>selected="selected"<?php endif;?>>银行卡</option>
                                            <option value="2" <?php  if($outgoldinfo['outgold_paytype']==2):
                                            ?>selected="selected"<?php endif;?>>支付宝</option>
                                            <option value="3" <?php  if($outgoldinfo['outgold_paytype']==3):
                                            ?>selected="selected"<?php endif;?>>微信号</option>
                                        </select>
                                    </div>
                                </div>
                                <div id="outgold_bank">
                                <div class="form-group" >
                                    <label for="confirm-password" class="col-lg-4 control-label">收款银行 </label>
                                    <div class="col-lg-8">
                                        <select class="form-control input-sm" id="outgold_bankname"  name="outgoldinfo[outgold_bankname]">
                                            <option value="中国工商银行" <?php  if(empty($outgoldinfo['outgold_bankname'])||$outgoldinfo['outgold_bankname']=='中国工商银行'):
                                            ?>selected="selected"<?php endif;?>>中国工商银行</option>
                                            <option value="中国农业银行" <?php  if($outgoldinfo['outgold_paytype']=='中国农业银行'):
                                            ?>selected="selected"<?php endif;?>>中国农业银行</option>
                                            <option value="中国银行" <?php  if($outgoldinfo['outgold_paytype']=='中国银行'):
                                            ?>selected="selected"<?php endif;?>>中国银行</option>
                                            <option value="中国建设银行" <?php  if($outgoldinfo['outgold_paytype']=='中国建设银行'):
                                            ?>selected="selected"<?php endif;?>>中国建设银行</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="confirm-password" class="col-lg-4 control-label">收款人姓名 </label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" value="<?php echo $outgoldinfo['outgold_bankcardname']; ?>" id="outgold_bankcardcode" name="outgoldinfo[outgold_bankcardname]">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="confirm-password" class="col-lg-4 control-label">收款人账号 </label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" value="<?php echo $outgoldinfo['outgold_bankcardcode']; ?>" id="outgold_bankcardcode" name="outgoldinfo[outgold_bankcardcode]">
                                    </div>
                                </div>
                                </div>
                                <div class="form-group" id="outgold_alipay">
                                    <label for="confirm-password" class="col-lg-4 control-label">支付宝账户 </label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" value="<?php echo $outgoldinfo['outgold_alipay']; ?>" id="outgold_alipay" name="outgoldinfo[outgold_alipay]">
                                    </div>
                                </div>
                                <div class="form-group" id="outgold_weixin">
                                    <label for="confirm-password" class="col-lg-4 control-label">微信账户</label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" value="<?php echo $outgoldinfo['outgold_weixin']; ?>" id="t_outgold_weixin" name="outgoldinfo[outgold_weixin]">
                                    </div>
                                </div>

                            </fieldset>
                            <div class="row">
                                <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
                                    <button type="submit" class="btn btn-primary">修改</button>

                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-4 col-sm-4 pull-right">
                        <div class="form-info">
                            <h2><em>提示</em> 信息</h2>
                            <p>本网站禁止制作、复制、发布、传播等具有反动、色情、暴力、淫秽等内容的信息，一经发现，立即删除。若您因此触犯法律，我们对此不承担任何法律责任。 </p>

                            <button type="button" class="btn btn-default">更多详情</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>
    <script type="text/javascript">
        function checkInfo(form) {
            var mobile = form['mobile'].value;
            if (!mobile) {
                alert('请输入您的手机号码！');
                return false;
            }
            if (mobile.search(/^([0-9]{11})?$/) == -1) {
                alert('请输入正确的手机号码！');
                return false;
            }
            if (!form['pwd'].value) {
                alert('请输入登录密码。');
                return false;
            }
            if (form['pwd'].value!=form['repwd'].value) {
                alert('两次登录密码不一致。');
                return false;
            }

        }

        function changeoutgold(outgold)
        {
            if(outgold.value==1)
            {
                document.getElementById('outgold_bank').style.display="block";
                document.getElementById('outgold_alipay').style.display="none";
                document.getElementById('outgold_weixin').style.display="none";
            }
            if(outgold.value==2)
            {
                document.getElementById('outgold_bank').style.display="none";
                document.getElementById('outgold_alipay').style.display="block";
                document.getElementById('outgold_weixin').style.display="none";
            }
            if(outgold.value==3)
            {
                document.getElementById('outgold_bank').style.display="none";
                document.getElementById('outgold_alipay').style.display="none";
                document.getElementById('outgold_weixin').style.display="block";
            }
        }
        changeoutgold(document.getElementById('outgold_paytype'));
    </script>
    <!-- END SIDEBAR & CONTENT -->
</div>