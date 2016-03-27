<?php
/**
 * 列表筛选
 */
class GoodsFilter
{
    /**
     * 商品筛选
     *
     * @param $params
     * @return string
     */
    public static function goods($params)
    {
        if (isset($params['bn']) && $params['bn']) $condition[] = "g.bn LIKE '%{$params['bn']}%'";
        if (isset($params['goods_name']) && $params['goods_name']) $condition[] = "g.name LIKE '%{$params['goods_name']}%'";
        if (isset($params['sales_price_val']) && $params['sales_price_val']) {
            $condition[] = "g.price {$params['sales_price']} {$params['sales_price_val']}";
        }
        if (isset($params['goods_store_val']) && $params['goods_store_val']) {
            $condition[] = "g.price {$params['goods_store']} {$params['goods_store_val']}";
        }

        $condition[] = "g.disabled = 'false'";
        if ($condition) return implode(' AND ',$condition);
        return '';
    }
} 