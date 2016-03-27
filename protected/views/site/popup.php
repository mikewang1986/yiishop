<?php $this->beginContent('//layouts/main'); ?>
<?php
$this->breadcrumbs=array(
    '提示页',
);
?>
    <script language="javascript">
        $(document).ready(function() {
            function jump(count) {
                window.setTimeout(function(){
                    count--;
                    if(count > 0) {
                        $('#num').html(count);
                        jump(count);
                    } else {
                        location.href="<?php echo $redirect;?>";
                    }
                }, 1000);
            }
            jump(3);
        });
    </script>

    <?php
        echo $this->renderPartial(
            '//site/popup/'.$action,
            array(
                'redirect'=>$redirect,
                'content'=>$content,
                'timeout'=>$timeout
            )
        );
    ?>

<?php $this->endContent(); ?>