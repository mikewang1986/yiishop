<?php
/**
 * 该类是用户自定义的加密类型 md5加密方式
 */

class Encrypt {

    /**
     * 用户密码加密算法
     *
     * @param $source_str
     * @param $username
     * @param $createtime
     * @return string
     */
    public static function extends_md5($source_str,$username,$createtime)
    {
        //密码的MD5值连接用户名和注册时间，再算MD5
        $string_md5 = md5(md5($source_str).$username.$createtime);
        //取上面MD5值的前31位
        $front_string = substr($string_md5,0,31);
        //在前面加上字符s
        $end_string = 's'.$front_string;
        return $end_string;
    }
} 