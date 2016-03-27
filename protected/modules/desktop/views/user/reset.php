<div class="page-header">
    <h1>
        修改密码
    </h1>

    <div class="row">
        <div class="col-xs-12">
            <form class="form-horizontal" action="?r=desktop/user/reset" method="post">
                <div class="form-group">
                    <div class="col-xs-12">
                        <div class="control-group" >
                            <label class="control-label  col-sm-3  bolder blue">密码</label>

                            <div class="col-sm-9">
                                <input type="password" class="col-xs-10 col-sm-5" name="User[password]"
                                       value="" placeholder="密码" id="form-field-1">
                            </div>

                        </div>
                    </div>

                </div>

                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <button type="submit" class="btn btn-info">
                            <i class="icon-ok bigger-110"></i>
                            提交
                        </button>

                        &nbsp; &nbsp; &nbsp;
                        <button type="reset" class="btn">
                            <i class="icon-undo bigger-110"></i>
                            重置
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>