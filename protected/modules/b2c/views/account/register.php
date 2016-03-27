<div class="container">
    <ul class="breadcrumb">
        <li><a href="/">首页</a></li>
        <li><a href="/account/index.html">会员中心</a></li>
        <li class="active">注册</li>
    </ul>
    <!-- BEGIN SIDEBAR & CONTENT -->
    <div class="row margin-bottom-40">
        <!-- BEGIN SIDEBAR -->
        <?php echo $this->renderPartial('/common/_left_profile');?>
        <!-- END SIDEBAR -->

        <!-- BEGIN CONTENT -->
        <div class="col-md-9 col-sm-9">
            <h1>新用户注册</h1>
            <div class="content-form-page">
                <div class="row">
                    <div class="col-md-7 col-sm-7">
                        <form class="form-horizontal form-register" method="post" action="/account/rescheckall">
                            <fieldset>
                                <legend>个人信息</legend>
                                <div class="form-group">
                                    <label for="email" class="col-lg-4 control-label">用户名 <span class="require">*</span></label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" value="" id="username" name="username">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-lg-4 control-label">用户名 <span class="require">*</span></label>
                                    <div class="col-lg-8">
                                        <input type="text" class="form-control" value="" id="username" name="username">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="password" class="col-lg-4 control-label">密码 <span class="require">*</span></label>
                                    <div class="col-lg-8">
                                        <input type="password" class="form-control" value="" id="password" name="password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="confirm-password" class="col-lg-4 control-label">确认密码 <span class="require">*</span></label>
                                    <div class="col-lg-8">
                                        <input type="password" class="form-control" value="" id="confirm-password" name="confirm-password">
                                    </div>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>用户协议</legend>
                                <div class="checkbox form-group">
                                    <label>
                                        <div class="col-lg-4 col-sm-4"></div>
                                        <div class="col-lg-8 col-sm-8">
                                            <a>用户协议</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="checkbox" id="licence" value="1">我已看过并接受
                                        </div>
                                    </label>
                                </div>
                            </fieldset>
                            <div class="row">
                                <div class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
                                    <button type="submit" class="btn btn-primary">立即注册</button>
                                    <button type="button" class="btn btn-default">重置</button>
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
    <!-- END SIDEBAR & CONTENT -->
</div>