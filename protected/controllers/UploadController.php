<?php
/**
 * 上传管理
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2013 shop.feipin0512.com
 * @version    1.0
 */
class UploadController extends Controller
{
    public $type;
    public $width;
    public $height;
    /**
     * 图片上传
     */
    public function actionIndex() {
        $this->type = $_GET['a'];

        $addtime='/images/'.date("Ymd",time());
        $path = $_SERVER['DOCUMENT_ROOT'].$addtime.'/';
        if (!file_exists($path)) mkdir($path,0777);

        $file_temp = $_FILES['Filedata']['tmp_name'];

        $file_ext = $this->get_extension($_FILES['Filedata']['name']);
        $fileNewName = time();
        $real_name = $file_name = $fileNewName.$file_ext;
        $newf_name = $this->set_filename($path, $file_name, $file_ext);
        $file_size = round($_FILES['Filedata']['size']/1024, 2);

        $targetFile =  str_replace('//','/',$path) . $newf_name;
        move_uploaded_file($file_temp,$targetFile);

        $filearray = array(
            'url_name'=>$addtime.'/'.$newf_name,
            'file_name' => $addtime.'/'.$newf_name,
            'real_name' => $real_name,
            'file_ext' => $file_ext,
            'file_size' => $file_size,
            'file_path' => $targetFile,
            'file_temp' => $file_temp
        );

        $this->thumb($addtime.'/'.$newf_name);

        $json_array = json_encode($filearray);
        echo $json_array;
    }

    /**
     * 图片上传
     */
    public function actionDefault() {
        $this->width = $_GET['width'];
        $this->height = $_GET['height'];

        $addtime='/images/'.date("Ymd",time());
        $path = $_SERVER['DOCUMENT_ROOT'].$addtime.'/';
        if (!file_exists($path)) mkdir($path,0777);

        $file_temp = $_FILES['Filedata']['tmp_name'];

        $file_ext = $this->get_extension($_FILES['Filedata']['name']);
        $fileNewName = md5(rand(1000,9999)).'_'.date('Y',time()).'_'.date('m',time()).'_'.date('d',time()).'_'.date('His',time());
        $real_name = $file_name = $fileNewName.$file_ext;
        $newf_name = $this->set_filename($path, $file_name, $file_ext);
        $file_size = round($_FILES['Filedata']['size']/1024, 2);

        $targetFile =  str_replace('//','/',$path) . $newf_name;
        move_uploaded_file($file_temp,$targetFile);

        $filearray = array(
            'url_name'=>$addtime.'/'.$newf_name,
            'file_name' => $addtime.'/'.$newf_name,
            'real_name' => $real_name,
            'file_ext' => $file_ext,
            'file_size' => $file_size,
            'file_path' => $targetFile,
            'file_temp' => $file_temp
        );

        //生成缩略图
        $this->imgthumb($addtime.'/'.$newf_name,$this->prep_filename($addtime.'/'.$newf_name,'_thumb'),$this->width,$this->height);

        $json_array = json_encode($filearray);
        echo $json_array;
    }

    /**
     * 商品图片
     */
    public function actionProduct()
    {
        $date = date("Ymd",time());
        $addtime='/images/'.$date;
        $path = $_SERVER['DOCUMENT_ROOT'].$addtime.'/';
        if (!file_exists($path)) mkdir($path,0777);

        $file_temp = $_FILES['Filedata']['tmp_name'];

        $file_ext = $this->get_extension($_FILES['Filedata']['name']);
        $fileNewName = md5(rand(1000,9999)).'_'.date('Y',time()).'_'.date('m',time()).'_'.date('d',time()).'_'.date('His',time());
        $real_name = $file_name = $fileNewName.$file_ext;
        $newf_name = $this->set_filename($path, $file_name, $file_ext);
        $file_size = round($_FILES['Filedata']['size']/1024, 2);

        $targetFile =  str_replace('//','/',$path) . $newf_name;
        move_uploaded_file($file_temp,$targetFile);

        $image_default = md5(rand(1000,9999).time());
        $filearray = array(
            'url_name' =>$date.'/'.$newf_name,
            'file_name' => $addtime.'/'.$newf_name,
            'image_id'  => $image_default,
            'real_name' => $real_name,
            'file_ext' => $file_ext,
            'file_size' => $file_size,
            'file_path' => $targetFile,
            'file_temp' => $file_temp
        );

        //生成缩略图
        $this->imgthumb($addtime.'/'.$newf_name,$this->prep_filename($addtime.'/'.$newf_name,'_l'),600,800);
        $this->imgthumb($addtime.'/'.$newf_name,$this->prep_filename($addtime.'/'.$newf_name,'_m'),387,516);
        $this->imgthumb($addtime.'/'.$newf_name,$this->prep_filename($addtime.'/'.$newf_name,'_s'),192,256);

        //$l_ident

        $json_array = json_encode($filearray);
        echo $json_array;
    }

    /**
     * 品牌上传
     */
    public function actionList()
    {
        $date = date("Ymd",time());
        $addtime='/images/'.$date;
        $path = $_SERVER['DOCUMENT_ROOT'].$addtime.'/';
        if (!file_exists($path)) mkdir($path,0777);
        $file_temp = $_FILES['Filedata']['tmp_name'];
        $file_ext = $this->get_extension($_FILES['Filedata']['name']);
        $fileNewName = md5(rand(1000,9999)).'_'.date('Y',time()).'_'.date('m',time()).'_'.date('d',time()).'_'.date('His',time());
        $real_name = $file_name = $fileNewName.$file_ext;
        $newf_name = $this->set_filename($path, $file_name, $file_ext);
        $file_size = round($_FILES['Filedata']['size']/1024, 2);
        $targetFile =  str_replace('//','/',$path) . $newf_name;
        move_uploaded_file($file_temp,$targetFile);
        $filearray = array(
            'url_name'  => $addtime.'/'.$newf_name,
            'file_name' => $addtime.'/'.$newf_name,
            'real_name' => $real_name,
            'file_ext'  => $file_ext,
            'file_size' => $file_size,
            'file_path' => $targetFile,
            'file_temp' => $file_temp
        );

        //生成缩略图
        $this->imgthumb($addtime.'/'.$newf_name,$this->prep_filename($addtime.'/'.$newf_name,'_l'),300,300);
        $this->imgthumb($addtime.'/'.$newf_name,$this->prep_filename($addtime.'/'.$newf_name,'_m'),200,200);
        $this->imgthumb($addtime.'/'.$newf_name,$this->prep_filename($addtime.'/'.$newf_name,'_s'),100,100);

        //$l_ident

        $json_array = json_encode($filearray);
        echo $json_array;
    }

    /**
     * 品牌上传
     */
    public function actionBrand()
    {
        $date = date("Ymd",time());
        $addtime='/images/'.$date;
        $path = $_SERVER['DOCUMENT_ROOT'].$addtime.'/';
        if (!file_exists($path)) mkdir($path,0777);

        $file_temp = $_FILES['Filedata']['tmp_name'];

        $file_ext = $this->get_extension($_FILES['Filedata']['name']);
        $fileNewName = md5(rand(1000,9999)).'_'.date('Y',time()).'_'.date('m',time()).'_'.date('d',time()).'_'.date('His',time());
        $real_name = $file_name = $fileNewName.$file_ext;
        $newf_name = $this->set_filename($path, $file_name, $file_ext);
        $file_size = round($_FILES['Filedata']['size']/1024, 2);

        $targetFile =  str_replace('//','/',$path) . $newf_name;

        move_uploaded_file($file_temp,$targetFile);

        $filearray = array(
            'url_name'  => $addtime.'/'.$newf_name,
            'file_name' => $addtime.'/'.$newf_name,
            'real_name' => $real_name,
            'file_ext'  => $file_ext,
            'file_size' => $file_size,
            'file_path' => $targetFile,
            'file_temp' => $file_temp
        );

        //$l_ident

        $json_array = json_encode($filearray);
        echo $json_array;
    }
    /**
     * 分类上传
     */
    public function actionCat()
    {
        $date = date("Ymd",time());
        $addtime='/images/'.$date;
        $path = $_SERVER['DOCUMENT_ROOT'].$addtime.'/';
        if (!file_exists($path)) mkdir($path,0777);

        $file_temp = $_FILES['Filedata']['tmp_name'];

        $file_ext = $this->get_extension($_FILES['Filedata']['name']);
        $fileNewName = md5(rand(1000,9999)).'_'.date('Y',time()).'_'.date('m',time()).'_'.date('d',time()).'_'.date('His',time());
        $real_name = $file_name = $fileNewName.$file_ext;
        $newf_name = $this->set_filename($path, $file_name, $file_ext);
        $file_size = round($_FILES['Filedata']['size']/1024, 2);

        $targetFile =  str_replace('//','/',$path) . $newf_name;

        move_uploaded_file($file_temp,$targetFile);

        $filearray = array(
            'url_name'  => $addtime.'/'.$newf_name,
            'file_name' => $addtime.'/'.$newf_name,
            'real_name' => $real_name,
            'file_ext'  => $file_ext,
            'file_size' => $file_size,
            'file_path' => $targetFile,
            'file_temp' => $file_temp
        );

        //$l_ident

        $json_array = json_encode($filearray);
        echo $json_array;
    }

    /**
     * 图片缩略图
     *
     * @param $file
     */
    public function thumb($file)
    {
        //商品分类图片
        if ($this->type == 'cat') {
            //PC端图片缩略图
            $this->imgthumb($file,$this->prep_filename($file,'_m'),200,200);
            //APP端图片缩略图
            $this->imgthumb($file,$this->prep_filename($file,'_app_l'),281,334);
            $this->imgthumb($file,$this->prep_filename($file,'_app_m'),240,285);
        }
        //特卖图片
        else if ($this->type == 'special') {
            //PC端图片缩略图
            $this->imgthumb($file,$this->prep_filename($file,'_m'),640,240);
        }
    }

    /**
     * 重命名
     *
     * @param $path
     * @param $filename
     * @param $file_ext
     * @param bool $encrypt_name
     * @return bool|string
     */
    function set_filename($path, $filename, $file_ext, $encrypt_name = FALSE)
    {
        if ($encrypt_name == TRUE)
        {
            mt_srand();
            $filename = md5(uniqid(mt_rand())).$file_ext;
        }

        if ( ! file_exists($path.$filename))
        {
            return $filename;
        }

        $filename = str_replace($file_ext, '', $filename);

        $new_filename = '';
        for ($i = 1; $i < 100; $i++)
        {
            if ( ! file_exists($path.$filename.$i.$file_ext))
            {
                $new_filename = time().$i.$file_ext;
                break;
            }
            $new_filename = time().$file_ext;
        }

        if ($new_filename == '')
        {
            return FALSE;
        }
        else
        {
            return $new_filename;
        }
    }

    /**
     * 重构文件名
     *
     * @param $filename
     * @param $prefix
     * @return string
     */
    function prep_filename($filename,$prefix) {
        if (strpos($filename, '.') === FALSE) {
            return $filename;
        }
        $parts = explode('.', $filename);
        $ext = array_pop($parts);
        $filename = array_shift($parts);
        foreach ($parts as $part) {
            $filename .= '.'.$part;
        }
        $filename .= $prefix.'.'.$ext;
        return $filename;
    }

    /**
     * 获取文件名后缀
     *
     * @param $filename
     * @return string
     */
    function get_extension($filename) {
        $x = explode('.', $filename);
        return '.'.end($x);
    }

    /**
     * 获取文件名后缀
     *
     * @param $file
     * @return string
     */
    function fileext($file)
    {
        return pathinfo($file, PATHINFO_EXTENSION);
    }

    /**
     * 生成缩略图
     * @author yangzhiguo0903@163.com
     * @param $src_img string     源图绝对完整地址{带文件名及后缀名}
     * @param $dst_img string     目标图绝对完整地址{带文件名及后缀名}
     * @param $width   int        缩略图宽{0:此时目标高度不能为0，目标宽度为源图宽*(目标高度/源图高)}
     * @param $height  int        缩略图高{0:此时目标宽度不能为0，目标高度为源图高*(目标宽度/源图宽)}
     * @param $cut     int        是否裁切{宽,高必须非0}
     * @param $proportion       int/float  缩放{0:不缩放, 0<this<1:缩放到相应比例(此时宽高限制和裁切均失效)}
     * @return boolean
     */
    function imgthumb($src_img, $dst_img, $width = 75, $height = 75, $cut = 0, $proportion = 0)
    {
        $src_img = Yii::app()->basePath.'/..'.$src_img;
        $dst_img = Yii::app()->basePath.'/..'.$dst_img;

        if(!is_file($src_img))
        {
            return false;
        }
        $ot = $this->fileext($dst_img);
        $otfunc = 'image' . ($ot == 'jpg' ? 'jpeg' : $ot);
        $srcinfo = getimagesize($src_img);
        $src_w = $srcinfo[0];
        $src_h = $srcinfo[1];
        $type  = strtolower(substr(image_type_to_extension($srcinfo[2]), 1));
        $createfun = 'imagecreatefrom' . ($type == 'jpg' ? 'jpeg' : $type);

        $dst_h = $height;
        $dst_w = $width;
        $x = $y = 0;

        /**
         * 缩略图不超过源图尺寸（前提是宽或高只有一个）
         */
        if(($width> $src_w && $height> $src_h) || ($height> $src_h && $width == 0) || ($width> $src_w && $height == 0))
        {
            $proportion = 1;
        }
        if($width> $src_w)
        {
            $dst_w = $width = $src_w;
        }
        if($height> $src_h)
        {
            $dst_h = $height = $src_h;
        }

        if(!$width && !$height && !$proportion)
        {
            return false;
        }
        if(!$proportion)
        {
            if($cut == 0)
            {
                if($dst_w && $dst_h)
                {
                    if($dst_w/$src_w> $dst_h/$src_h)
                    {
                        $dst_w = $src_w * ($dst_h / $src_h);
                        $x = 0 - ($dst_w - $width) / 2;
                    }
                    else
                    {
                        $dst_h = $src_h * ($dst_w / $src_w);
                        $y = 0 - ($dst_h - $height) / 2;
                    }
                }
                else if($dst_w xor $dst_h)
                {
                    if($dst_w && !$dst_h)  //有宽无高
                    {
                        $propor = $dst_w / $src_w;
                        $height = $dst_h  = $src_h * $propor;
                    }
                    else if(!$dst_w && $dst_h)  //有高无宽
                    {
                        $propor = $dst_h / $src_h;
                        $width  = $dst_w = $src_w * $propor;
                    }
                }
            }
            else
            {
                if(!$dst_h)  //裁剪时无高
                {
                    $height = $dst_h = $dst_w;
                }
                if(!$dst_w)  //裁剪时无宽
                {
                    $width = $dst_w = $dst_h;
                }
                $propor = min(max($dst_w / $src_w, $dst_h / $src_h), 1);
                $dst_w = (int)round($src_w * $propor);
                $dst_h = (int)round($src_h * $propor);
                $x = ($width - $dst_w) / 2;
                $y = ($height - $dst_h) / 2;
            }
        }
        else
        {
            $proportion = min($proportion, 1);
            $height = $dst_h = $src_h * $proportion;
            $width  = $dst_w = $src_w * $proportion;
        }

        $src = $createfun($src_img);
        $dst = imagecreatetruecolor($width ? $width : $dst_w, $height ? $height : $dst_h);
        $white = imagecolorallocate($dst, 255, 255, 255);
        imagefill($dst, 0, 0, $white);

        if(function_exists('imagecopyresampled'))
        {
            imagecopyresampled($dst, $src, $x, $y, 0, 0, $dst_w, $dst_h, $src_w, $src_h);
        }
        else
        {
            imagecopyresized($dst, $src, $x, $y, 0, 0, $dst_w, $dst_h, $src_w, $src_h);
        }
        $otfunc($dst, $dst_img);
        imagedestroy($dst);
        imagedestroy($src);
        return true;
    }
}
