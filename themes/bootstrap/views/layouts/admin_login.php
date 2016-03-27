<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="language" content="en" />

    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/styles.css" />

    <title><?php echo CHtml::encode($this->pageTitle); ?></title>

    <?php Yii::app()->bootstrap->register(); ?>
    <style>
        label
    </style>
</head>

<body>

<div class="container" style="width: 100%;margin-top:150px;">
   <div style="margin: 0 auto;width: 50%;">
   <?php echo $content; ?>
   </div>
    <div class="clear"></div>
</div><!-- page -->

</body>
</html>
