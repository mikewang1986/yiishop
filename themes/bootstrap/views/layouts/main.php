<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/styles.css" />

    <title><?php echo CHtml::encode($this->pageTitle); ?></title>
	<?php Yii::app()->bootstrap->register(); ?>
    <script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/common.js"></script>
    <script src="<?php echo Yii::app()->theme->baseUrl; ?>/js/bootbox.js"></script>
</head>

<body>

<?php $this->widget('bootstrap.widgets.TbNavbar', array(
    'brandLabel' => '后台管理',
    'display' => null, // default is static to top
    'items' => array(
        array(
            'class' => 'bootstrap.widgets.TbNav',
            'items' => XAdminiAcl::navMenu(),
        ),
    ),
)); ?>

<div class="container" style="width: 100%;margin-top: -20px;">
    <div class="base_left">

        <?php
            $this->widget('bootstrap.widgets.TbNav', array(
                'type'=>TbHtml::NAV_TYPE_LIST,
                'items'=>XAdminiAcl::leftMenu($this->module->id,Yii::app()->controller->id),
            ));
        ?>
    </div>

    <div class="base_right">
        <?php if(isset($this->breadcrumbs)):?>
        <?php
            $this->widget('bootstrap.widgets.TbBreadcrumb', array(
                'links' => $this->breadcrumbs,
            )); ?>
        <!-- breadcrumbs -->
        <?php endif?>
        <?php echo $content; ?>
    </div>

	<div class="clear"></div>

</div><!-- page -->

</body>
</html>
