<?php
/**
 * 商品图片
 */

class Image {
    /**
     * 获取单个图片
     *
     * @param $image_id
     * @param string $type
     * @return mixed
     */
    public static function Item($image_id,$type = 's')
    {
        $ImageImage = new ImageImage();
        $row = $ImageImage->ImageUrl($image_id);
        return $row[$type.'_url'];
    }

    /**
     * 重构文件名
     *
     * @param $filename
     * @param $prefix
     * @return string
     */
    public static function prep_filename($filename,$prefix) {
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

} 