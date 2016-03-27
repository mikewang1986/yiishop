<?php
$this->breadcrumbs=array(
    '500权限不租',
);
?>

<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="error-container">
                <div class="well">
                    <h1 class="grey lighter smaller">
                        <span class="blue bigger-125">
                            <i class="icon-random"></i>
                            500
                        </span>
                        权限不足
                    </h1>

                    <hr>
                    <h3 class="lighter smaller">
                        本来这个错误不应发送，但还是发生了
                        <i class="icon-wrench icon-animated-wrench bigger-125"></i>
                        Sorry!
                    </h3>

                    <div class="space"></div>

                    <div>
                        <h4 class="lighter smaller">如果您应该有这个权限, 可以试试下面的操作:</h4>

                        <ul class="list-unstyled spaced inline bigger-110 margin-15">
                            <li>
                                <i class="icon-hand-right blue"></i>
                                阅读手册
                            </li>

                            <li>
                                <i class="icon-hand-right blue"></i>
                                给我们更多的建议
                            </li>
                        </ul>
                    </div>

                    <hr>
                    <div class="space"></div>

                    <div class="center">
                        <a class="btn btn-grey" href="<?php echo $redirect;?>">
                            <i class="icon-arrow-left"></i>
                            返回
                        </a>

                        <a class="btn btn-primary" href="<?php echo $this->createUrl('default/index') ?>">
                            <i class="icon-dashboard"></i>
                            控制面板
                        </a>
                    </div>
                </div>
            </div>

            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div>