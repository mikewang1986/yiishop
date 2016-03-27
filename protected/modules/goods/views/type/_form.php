<style>
    .nav-tabs{height: 42px;}
</style>
<div class="row">
    <div class="col-xs-12">
        <form class="form-horizontal" id="validation-form" novalidate="novalidate" action="?r=goods/type/<?php echo $action;?>" method="post">
            <div class="form-group">
                <div class="col-sm-6">
                    <h3 class="header smaller lighter purple">
                        编辑商品类型
                    </h3>

                    <div class="tabbable">
                        <ul id="myTab4" class="nav nav-tabs padding-12 tab-color-blue background-blue">
                            <li class="active">
                                <a href="#type_1" data-toggle="tab">基本设置</a>
                            </li>
                            <li class="">
                                <a href="#type_2" data-toggle="tab">扩展属性</a>
                            </li>
                            <li class="">
                                <a href="#type_3" data-toggle="tab">规格</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="type_1">
                                <?php echo $this->renderPartial('_form_1',array('model'=>$model));?>
                            </div>
                            <div class="tab-pane" id="type_2">
                                <?php echo $this->renderPartial('_form_2',array('model'=>$model));?>
                            </div>
                            <div class="tab-pane" id="type_3">
                                <?php echo $this->renderPartial('_form_3',array('model'=>$model));?>
                            </div>
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