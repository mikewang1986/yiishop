<div class="hero-unit"><h1>商城后台登录</h1>

    <?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
        'layout' => TbHtml::FORM_LAYOUT_VERTICAL,
    )); ?>
<br>
    <div class="controls">
        用户名：<input type="text" maxlength="30" id="Desktopusers_name" name="Desktopusers[name]" value="admin">
    </div>
    <div class="controls">
        密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" maxlength="30" id="Desktopusers_password" name="Desktopusers[password]" value="123456">
    </div>

    <button class="btn" id="yw125" type="submit" name="yt4">登录</button>

    <?php
        if ($error) {
            $user = Yii::app()->getComponent('user');
            $user->setFlash(
                'error',
                "<strong>ERROR！</strong> 用户名或密码输入错误."
            );
            $this->widget('bootstrap.widgets.TbAlert', array(
                'fade' => true,
                'closeText' => '&times;', // false equals no close link
                'events' => array(),
                'htmlOptions' => array(),
                'alerts' => array( // configurations per alert type
                    'error' => array('closeText' => '&times;'),
                ),
            ));
        }
    ?>
<?php $this->endWidget(); ?>
</div>
