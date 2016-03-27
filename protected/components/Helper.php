<?php

class Helper {

    /**
     * 组合对象列表信息
     *
     * @param $data
     * @param $val
     * @return array
     */
    public static function helpArrayIds($data,$val)
    {
        $items = array();
        foreach ($data as $v) {
            $items[] = $v->$val;
        }

        return $items;
    }

    /**
     * 数组重组
     * @param $data
     * @param $key
     * @param array $attribute
     * @return array
     */
    public static function helpArrayVal($data,$key,$attribute = array())
    {
        $items = array();
        foreach ($data as $v) {
            if (empty($attribute))
                $items[$key] = $v;
            else {
                foreach ($attribute as $vv) {
                    $items[$v->$key][$vv] = $v->$vv;
                }
            }

        }

        return $items;
    }
}