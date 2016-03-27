<?php
/**
 * 列表筛选
 */
class OrderFilter
{
    /**
     * 商品筛选
     *
     * @param $params
     * @return string
     */
    public static function order($params,$conditionArr)
    {
        $condition = array();
        if (!empty($conditionArr)) {
            foreach ($conditionArr as $k=>$v) {
                $condition[] = "$k = '$v'";
            }
        }

        if (isset($params['order_id']) && $params['order_id']) {
            $order_id = trim($params['order_id']);
            $condition[] = "order_id LIKE '%{$order_id}%'";
        }


        //下单时间
        if (isset($params['start_date']) && $params['start_date']) {
            if (isset($params['start_time']) && $params['start_time']) {
                $start = strtotime($params['start_date'].' '.$params['start_time']);
            } else {
                $start = strtotime($params['start_date']);
            }

            $condition[] = "createtime >= $start";
        }

        //下单时间
        if (isset($params['end_date']) && $params['end_date']) {
            if (isset($params['end_time']) && $params['end_time']) {
                $end = strtotime($params['end_date'].' '.$params['end_time']);
            } else {
                $end = strtotime($params['end_date']);
            }

            $condition[] = "createtime <= $end";
        }

        $condition[] = "disabled = 'false'";

        if ($condition) return implode(' AND ',$condition);
        return '';
    }

    /**
     * 订单退货
     *
     * @param $params
     * @return string
     */
    public static function returnOrder($params)
    {
        if (!empty($params['order_id'])) $condition[] = "order_id = {$params['order_id']}";

        $condition[] = "disabled = 'false'";

        if ($condition) return implode(' AND ',$condition);
    }

    /**
     * 续约
     *
     * @param $params
     * @return string
     */
    public static function xyDetail($params)
    {
        if (!empty($params['order_id'])) $condition[] = "d.order_id = {$params['order_id']}";

        $condition[] = "d.payment_id = 2 AND d.disabled = 'false'";

        if ($condition) return implode(' AND ',$condition);
    }

    /**
     * 滤网
     *
     * @param $params
     * @return string
     */
    public static function xyFilter($params)
    {
         if (!empty($params['shipping_no'])) $condition[] = "f.shipping_no = {$params['shipping_no']}";

        $condition[] = "f.disabled = 'false'";

        if ($condition) return implode(' AND ',$condition);
    }

    /**
     * 发票
     *
     * @param $params
     * @return string
     */
    public static function Tax($params)
    {
        if (!empty($params['order_id'])) $condition[] = "order_id = {$params['order_id']}";

        $condition[] = "is_tax = 'true' AND disabled = 'false'";

        if ($condition) return implode(' AND ',$condition);
    }
} 