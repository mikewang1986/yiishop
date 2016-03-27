<div class="row">
    <div class="col-xs-12" style="margin-left: 10px;">
        <form class="form-horizontal" action="?r=goods/cat/<?php echo $action;?>" method="post">
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right">分类名称</label>
                <div class="col-sm-9">
                    <input type="text" value="<?php echo isset($model['cat_row']['cat_name'])?$model['cat_row']['cat_name']:'';?>" name="Cat[cat_name]" class="col-xs-10 col-sm-5" placeholder="分类名称" id="form-field-1">
                </div>
            </div>

            <div class="form-group">
                <label for="name" class="control-label col-xs-12 col-sm-3 no-padding-right">上级分类</label>
                <div class="col-sm-3">
                    <select id="goods_type" class="form-control" name="Cat[parent_id]">
                        <option value="">---无---</option>
                        <?php if (isset($model['parent']) && $model['parent']):?>
                            <?php foreach ($model['parent'] as $k=>$v):?>
                                <option value="<?php echo $v['cat_id'];?>" <?php echo isset($model['cat_row'])&&$model['cat_row']['parent_id']==$v['cat_id']?'selected':'';?>>
                                    <?php if ($v['path'] == 2):?>
                                        &nbsp;&nbsp;&nbsp;-&nbsp;-
                                    <?php endif;?>
                                    <?php if ($v['path'] == 3):?>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;-&nbsp;-&nbsp;-
                                    <?php endif;?>
                                    <?php echo $v['cat_name'];?>
                                </option>
                            <?php endforeach;?>
                        <?php endif;?>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="name" class="control-label col-xs-12 col-sm-3 no-padding-right">商品类型</label>
                <div class="col-sm-3">
                    <select id="goods_type" class="form-control" name="Cat[type_id]">
                        <option value="">请选择</option>
                        <?php if (isset($model['type']) && $model['type']):?>
                            <?php foreach ($model['type'] as $k=>$v):?>
                                <option value="<?php echo $k;?>" <?php echo isset($model['cat_row'])&&$model['cat_row']['type_id']==$k?'selected':'';?>><?php echo $v;?></option>
                            <?php endforeach;?>
                        <?php endif;?>
                    </select>
                </div>
            </div>
            <!--  分类图片-->
            <!--  <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right">默认图片</label>
                <div class="col-sm-7">
                    <div class="ace-file-input ace-file-multiple">
                        <div class="col-sm-3">
                            <label data-title="选择图片" class="file-label">
                                    <span data-title="No File ..." class="file-name">
                                         <i class="upload-icon icon-cloud-upload blue icon-3x" id="file_upload"></i>
                                    </span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
           <div class="form-group">
                <label for="comment" class="control-label col-xs-12 col-sm-3 no-padding-right">分类图片：</label>
                <div class="col-xs-12 col-sm-9">
                    <input type="hidden" name="Cat[image_default_id]" id="image-default" value="<?php echo isset($model['cat_row'])?$model['cat_row']['image_default_id']:'';?>">
                    <ul class="ace-thumbnails">
                        <?php if (isset($model['image']) && $model['image']):?>
                            <?php foreach ($model['image'] as $v):?>
                                <li>
                                    <a data-rel="colorbox" title="商品图片" href="<?php echo $this->image_url.$v['l_url'];?>" class="cboxElement">
                                        <img style="width: 120px;height: 120px;" src="<?php echo $this->image_url.$v['s_url'];?>">
                                        <input type="hidden" name="Image[]" value="<?php echo $v['ident'];?>">
                                        <input type="hidden" name="ImageId[]" class="image-id" value="<?php echo $v['image_id'];?>">
                                        <?php if ($v['image_id'] == $model['cat_row']['image_default_id']):?>
                                            <div class="tags image_default">
                                        <span class="label-holder">
                                            <span class="label label-danger">默认图片</span>
                                        </span>
                                            </div>
                                        <?php endif;?>
                                        <div class="text">
                                            <div class="inner">点击查看大图</div>
                                        </div>
                                    </a>
                                    <div class="tools tools-bottom">
                                        <button class="btn btn-minier btn-purple arrowed-right image_default_opt" data="<?php echo $v['image_id'];?>">默认</button>
                                        <button class="btn btn-minier btn-pink arrowed image_delete_opt" data="<?php echo $v['image_id']==$model['cat_row']['image_default_id']?'true':'false'?>">删除</button>
                                    </div>
                                </li>
                                <input type="hidden" name="ImageAttach[]" value="<?php echo $v['image_id'];?>">
                            <?php endforeach;?>
                        <?php endif;?>
                    </ul>
                </div>
            </div>-->
            <div class="form-group">
                <label for="form-field-4" class="col-sm-3 control-label no-padding-right">图片</label>
                <div class="col-sm-4">
                    <div class="ace-file-input ace-file-multiple">
                        <label data-title="选择文件" class="file-label">
                            <span data-title="No File ..." class="file-name">
                                 <i class="upload-icon icon-cloud-upload blue icon-3x" id="file_upload"></i>
                            </span>
                        </label>
                    </div>
                    <div class="modal-img">
                        <a data-rel="colorbox" class="cboxElement">
                            <?php if (isset($model['cat_row']) && $model['cat_row']['img_url']):?>
                                <img src="<?php echo $model['cat_row']['img_url'];?>" style="width: 390px; height: 130px;">
                                <input type="hidden" value="<?php echo $model['cat_row']['img_url'];?>" name="Cat[img_url]">
                            <?php endif;?>
                        </a>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right"> 排序 </label>
                <div class="col-sm-5">
                    <input type="text" class="col-sm-1" name="Cat[p_order]"
                           value="<?php echo isset($model['cat_row']['p_order'])&&$model['cat_row']['p_order']?$model['cat_row']['p_order']:'99';?>">
                </div>
            </div>

            <!--
            <div class="form-group">
                <label for="form-field-1" class="col-sm-3 control-label no-padding-right">分类图片</label>
                <div class="col-sm-9">
                    <a id="bootbox-regular" class="btn">上传图片</a>
                    <div id="cat-img" style="margin-top: 10px;">
                        <img style="width: 150px;height: 150px;" src="<?php echo isset($model['cat_row']['img_url'])?Common::ImgUrlName($model['cat_row']['img_url'],'m'):'/images/image-2.jpg';?>">
                        <input type="hidden" name="Cat[img_url]" value="<?php echo isset($model['cat_row']['img_url'])?$model['cat_row']['img_url']:'';?>">
                    </div>
                </div>
            </div>
            -->

            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <button type="submit" class="btn btn-info">
                        <i class="icon-ok bigger-110"></i>
                        确认
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>