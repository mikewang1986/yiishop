<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 14-12-23
 * Time: 下午1:58
 */

class Common {
    /**
     * 根据图片名获取指定大小图片
     *
     * @param $filename
     * @param $prefix
     * @return mixed|string
     */
    public static function ImgUrlName($filename,$prefix)
    {
        if (empty($filename)) return '';

        if (strpos($filename, '.') === FALSE) {
            return $filename;
        }
        $parts = explode('.', $filename);
        $ext = array_pop($parts);
        $filename = array_shift($parts);
        foreach ($parts as $part) {
            $filename .= '.'.$part;
        }
        $filename .= '_'.$prefix.'.'.$ext;
        return $filename;
    }
} 