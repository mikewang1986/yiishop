<div class="container">
    <ul class="breadcrumb">
        <li><a href="/">首页</a></li>
        <li><a href="/account/index.html">会员中心</a></li>
        <li class="active">登录</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
        <!-- BEGIN SIDEBAR -->
        <?php echo $this->renderPartial('/common/_left_profile');?>
        <!-- END SIDEBAR -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-9 col-sm-9">
            <h1>登录</h1>
            <div class="content-form-page">
                <div class="row">
                    <div class="col-md-7 col-sm-7">
                        <form class="form-horizontal form-without-legend form-login" method="post">
                            <div class="form-group">
                                <label for="email" class="col-lg-4 control-label">用户名 <span class="require">*</span></label>
                                <div class="col-lg-8">
                                    <input type="text" class="form-control" id="username" name="username">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-lg-4 control-label">密码 <span class="require">*</span></label>
                                <div class="col-lg-8">
                                    <input type="password" class="form-control" id="password" name="password">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8 col-md-offset-4 padding-left-0">
                                    <a href="/account/register">免费注册</a>
                                    <a href="forgotton-password.html">忘记密码?</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
                                    <button type="submit" class="btn btn-primary">登录</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-4 col-sm-4 pull-right">
                        <div class="form-info">
                            <h2><em>信息</em> 提示</h2>
                            <p>还不是商城会员？30秒轻松注册，就可方便购物，赶紧点击下方</p>
                            <button type="button" class="btn btn-default">更多详情</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END SIDEBAR & CONTENT -->
</div>