<?php
/**
 * 列表筛选
 */
class MembersFilter
{
    /**
     * 会员筛选
     *
     * @param $params
     * @return string
     */
    public static function members($params)
    {
        $condition=array();
        if (isset($params['name']) && $params['name']) $condition[] = "m.name LIKE '%{$params['name']}%'";
        if (isset($params['mobile']) && $params['mobile']) $condition[] = "m.mobile LIKE '%{$params['mobile']}%'";
        if (isset($params['disabled']) && $params['disabled']) {
            $condition[] = "m.disabled ='{$params['disabled']}'";
        }
        if (isset($params['member_lv_id']) && $params['member_lv_id']) {
            $condition[] = "m.member_lv_id = {$params['member_lv_id']}";
        }

        if ($condition) return implode(' AND ',$condition);
        return '';
    }
} 