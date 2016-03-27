<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <!-- basic styles -->
    <link href="<?php echo Yii::app()->theme->baseUrl; ?>/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace.min.css" />
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace-skins.min.css" />

    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/public.css" />

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ace-ie.min.css" />
    <![endif]-->
    <script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/html5shiv.js"></script>
    <script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<div class="main-container" id="main-container">


    <div class="main-container-inner">

        <div class="main-content">
            <div class="page-content"><?php echo $content;?></div><!-- /.page-content -->
        </div><!-- /.main-content -->
    </div><!-- /.main-container-inner -->
</div><!-- /.main-container -->
<!-- basic scripts -->

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
</body>
</html>