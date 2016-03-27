<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>控制台 - 后台管理</title>
    <meta name="keywords" content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文" />
    <meta name="description" content="站长素材提供Bootstrap模版,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/colorbox.css" />
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace.min.css" />
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace-skins.min.css" />

    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/public.css" />

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace-ie.min.css" />
    <![endif]-->

    <!--[if !IE]> -->
    <script type="text/javascript">
        window.jQuery || document.write("<script src='<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery-2.0.3.min.js'>"+"<"+"script>");
    </script>
    <!-- <![endif]-->

    <!--[if IE]>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery-1.10.2.min.js'>"+"<"+"script>");
    </script>
    <![endif]-->

    <script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/html5shiv.js"></script>
    <script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed')}catch(e){}
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="icon-leaf"></i>
                    商城管理系统
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="<?php echo Yii::app()->theme->baseUrl; ?>/avatars/user.jpg" alt="Jason's Photo" />
                            <span class="user-info">
                                <small>欢迎光临,</small>
                                <?php echo Yii::app()->session['_admini']['name'];?>
                            </span>
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="/" target="_blank">
                                <i class="icon-user"></i>
                                商城前台
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-cog"></i>
                                设置
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-user"></i>
                                个人资料
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="?r=admin/logout">
                                <i class="icon-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul><!-- /.ace-nav -->
        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <div class="sidebar" id="sidebar">
            <ul class="nav nav-list">
                <li class="<?php echo $_GET['r']=='desktop/default/index'?'active':'';?>">
                    <a href="?r=desktop/default/index">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text"> 控制台</span>
                    </a>
                </li>

                <?php foreach ($this->ActList as $k=>$v):?>
                <li class="<?php echo $this->module==$k&&$_GET['r']!='desktop/default/index'?'open':'';?>">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-desktop"></i>
                        <span class="menu-text"><?php echo $v['name'];?></span>
                        <b class="arrow icon-angle-down"></b>
                    </a>
                    <ul class="submenu" <?php echo $this->module==$k&&$_GET['r']!='desktop/default/index'?'style="display: block;"':'';?>>
                        <?php if (isset($v['ctl']['name']) && $v['ctl']['name']):?>
                            <?php foreach ($v['ctl']['act'] as $kkk=>$vvv):?>
                                <li class="<?php echo $this->module==$k&&Yii::app()->controller->id==$kkk?'active':'';?>">
                                    <a href="?r=<?php echo $k;?>/<?php echo $kkk;?>/<?php echo $vvv['default_id'];?>">
                                        <i class="icon-double-angle-right"></i>
                                        <?php echo $vvv['name'];?>
                                    </a>
                                </li>
                            <?php endforeach;?>
                        <?php else:?>
                        <?php foreach ($v['ctl'] as $vv):?>
                        <li class="<?php echo $this->module==$k&&in_array(Yii::app()->controller->id,$vv['list_ctl'])?'open':'';?>">
                            <a href="#" class="dropdown-toggle">
                                <i class="icon-double-angle-right"></i>
                                <?php echo $vv['name'];?>
                                <b class="arrow icon-angle-down"></b>
                            </a>
                            <ul class="submenu" style="display: <?php echo $this->module==$k&&in_array(Yii::app()->controller->id,$vv['list_ctl'])&&$_GET['r']!='desktop/default/index'?'block':'none';?>;">
                                <?php foreach ($vv['act'] as $kkk=>$vvv):?>
                                <li class="<?php echo $this->module==$k&&Yii::app()->controller->id==$kkk?'active':'';?>">
                                    <a href="?r=<?php echo $k;?>/<?php echo $kkk;?>/<?php echo $vvv['default_id'];?>">
                                        <i class="icon-leaf"></i>
                                        <?php echo $vvv['name'];?>
                                    </a>
                                </li>
                                <?php endforeach;?>
                            </ul>
                        </li>
                        <?php endforeach;?>
                        <?php endif;?>
                    </ul>
                </li>
                <?php endforeach;?>

            </ul><!-- /.nav-list -->

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
            </div>
        </div>

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <?php if(isset($this->breadcrumbs)):?>
                    <?php
                    $this->widget('bootstrap.widgets.TbBreadcrumb', array(
                        'homeUrl'=>'?r=order/default/index',
                        'links' => $this->breadcrumbs,
                    )); ?>
                    <!-- breadcrumbs -->
                <?php endif?>
            </div>
            <div class="page-content"><?php echo $content;?></div><!-- /.page-content -->
        </div><!-- /.main-content -->
    </div><!-- /.main-container-inner -->
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<!-- basic scripts -->

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
</script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/bootstrap.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/excanvas.min.js"></script>
<![endif]-->

<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.ui.touch-punch.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.slimscroll.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.easy-pie-chart.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.sparkline.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/flot/jquery.flot.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/flot/jquery.flot.pie.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/flot/jquery.flot.resize.min.js"></script>

<!-- ace scripts -->

<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/ace-elements.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/ace.min.js"></script>
<!-- inline scripts related to this page -->

<!-- form --->
<!--<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery-ui-1.10.3.full.min.js"></script>-->
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.validate.min.js"></script>

<!-- page specific plugin scripts -->
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.dataTables.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.dataTables.bootstrap.js"></script>

<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/bootbox.min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.easy-pie-chart.min.js"></script>

<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/jquery.colorbox-min.js"></script>
<script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/oct/common.js"></script>

</body>
</html>