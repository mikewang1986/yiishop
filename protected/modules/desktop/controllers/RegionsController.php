<?php
/**
 * 地区
 *
 * @author     chenfenghua<843958575@qq.com>
 * @copyright  Copyright 2008-2015 shop.feipin0512.com
 * @version    1.0
 */

class RegionsController extends BaseController
{
    /**
     * 动态获取地址
     */
    public function actionRegion()
    {
        $region_id = $this->post('region_id');
        $Regions = new Regions();
        $region_list = $Regions->RegionsList($region_id);

        $region_str = '';
        foreach ($region_list as $v) {
            $region_str .= "<option value='{$v['region_id']}'>{$v['local_name']}</option>";
        }

        echo $region_str;
    }

} 