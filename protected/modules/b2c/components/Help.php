<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 14-11-15
 * Time: 下午3:05
 */

class Help {

    /**
     * 多维数组字段组合成字符
     *
     * @param array $arr
     * @param $key
     * @return bool|string
     */
    public static function ArrayToString(Array $arr,$key)
    {
        if (!$arr) return false;
        foreach ($arr as $v) {
            $item[] = $v[$key];
        }
        $str = implode(',',$item);

        return $str;
    }

    /**
     * 组合对象列表信息
     *
     * @param $data
     * @param $val
     * @return array
     */
    public static function ArrayListByKey($data,$val)
    {
        $items = array();
        foreach ($data as $v) {
            $items[$v[$val]] = $v;
        }

        return $items;
    }

    /**
     * 字符编码转换
     *
     * @param $word
     * @return string
     */
    public static function WordEncode($word)
    {
        $encode = mb_detect_encoding($word, array('ASCII','UTF-8','GB2312','GBK','BIG5',"ISO-8859-1"));
        if ($encode != 'UTF-8') $word = iconv($encode,'UTF-8',$word);
        return $word;
    }

    /**
     * 发送POST请求
     *
     * @param string $url
     * @param array $post
     * @throws Exception
     * @return string
     */
    public static function post($url, $post = null)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_FAILONERROR, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        //https 请求
        if(strlen($url) > 5 && strtolower(substr($url, 0, 5)) == "https" )
        {
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        }
        if (is_array($post) && 0 < count($post))
        {
            $post_body_string = "";
            $post_multipart = false;
            foreach ($post as $k => $v)
            {
                if("@" != substr($v, 0, 1))//判断是不是文件上传
                {
                    $post_body_string .= "$k=" . urlencode($v) . "&";
                }
                else//文件上传用multipart/form-data，否则用www-form-urlencoded
                {
                    $post_multipart = true;
                }
            }
            curl_setopt($ch, CURLOPT_POST, true);
            if ($post_multipart)
            {
                curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
            }
            else
            {
                curl_setopt($ch, CURLOPT_POSTFIELDS, substr($post_body_string,0,-1));
            }
        }
        $reponse = curl_exec($ch);

        if (curl_errno($ch))
        {
            throw new Exception(curl_error($ch), 0);
        }
        else
        {
            $http_status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            if (200 !== $http_status_code)
            {
                throw new Exception($reponse,$http_status_code);
            }
        }
        curl_close($ch);
        return $reponse;
    }

    /**
     * 短信接口验证
     *
     * @param $to string 手机号码
     * @param $content string 发送内容
     * @return string
     */
    public static function Message($to,$content)
    {

    }
}