<?php
/**
 * 列表筛选
 */
class DesktopFilter
{
    /**
     * 日志筛选
     *
     * @param $params
     * @return string
     */
    public static function CpsLog($params)
    {
        //推广方案ID
        if (isset($params['case_id']) && $params['case_id']) {
            $condition[] = "l.case_id = {$params['case_id']}";
        }

        if (isset($params['type_id']) && $params['type_id']) {
            $condition[] = "p.val_id = {$params['type_id']}";
        }

        //创建时间
        if (isset($params['start_date']) && $params['start_date']) {
            if (isset($params['start_time']) && $params['start_time']) {
                $start = strtotime($params['start_date'].' '.$params['start_time']);
            } else {
                $start = strtotime($params['start_date']);
            }

            $condition[] = "l.create_time >= $start";
        }

        if (isset($params['start_date2']) && $params['start_date2']) {
            if (isset($params['start_time2']) && $params['start_time2']) {
                $start2 = strtotime($params['start_date2'].' '.$params['start_time2']);
            } else {
                $start2 = strtotime($params['start_date2']);
            }

            $condition[] = "l.create_time < $start2";
        }

        $condition[] ="l.disabled='false'";
        if ($condition) return implode(' AND ',$condition);

        return '';
    }
} 