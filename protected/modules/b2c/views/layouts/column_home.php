<?php $this->beginContent('/layouts/main'); ?>
    <!-- BEGIN SLIDER -->
    <div class="page-slider margin-bottom-35">
        <!--LayerSlider begin-->
        <div id="layerslider" style="width: 100%; height: 494px; margin: 0 auto;">
            <!--LayerSlider layer-->
            <div class="ls-layer ls-layer1" style="slidedirection: right; transition2d: 24,25,27,28; ">
                <img src="<?php echo Yii::app()->theme->baseUrl; ?>/temp/sliders/slide1/bg.jpg" class="ls-bg" alt="Slide background">
                <div class="ls-s-1 title" style=" top: 96px; left: 35%; slidedirection : fade; slideoutdirection : fade; durationin : 750; durationout : 750; easingin : easeOutQuint; rotatein : 90; rotateout : -90; scalein : .5; scaleout : .5; showuntil : 4000; white-space: nowrap;">
                    Tones of <strong>shop UI features</strong> designed
                </div>
                <div class="ls-s-1 mini-text" style=" top: 338px; left: 35%; slidedirection : fade; slideoutdirection : fade; durationout : 750; easingin : easeOutQuint; delayin : 300; showuntil : 4000; white-space: nowrap;">
                    Lorem ipsum dolor sit amet  constectetuer diam<br > adipiscing elit euismod ut laoreet dolore.
                </div>
            </div>
        </div>
        <!--LayerSlider end-->
    </div>
    <!-- END SLIDER -->

    <div class="main">
        <?php echo $content;?>
    </div>


<?php $this->endContent(); ?>