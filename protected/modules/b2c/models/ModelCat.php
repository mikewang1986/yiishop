<?php
/**
 * 分类管理.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       yiishop.model
 * @license       http://www.yiitian.com/license
 * @version       v1.0.0
 */

class ModelCat extends B2cModel
{
    public $table = '{{b2c_goods_cat}}';

    /**
     * 详情
     *
     * @param $condition
     * @return mixed
     */
    public function Item($condition)
    {
        return $this->ModelQueryRow($this->selectSql("cat_id,parent_id,cat_name,cat_path,p_order,img_url",$condition));
    }

    /**
     * 列表
     *
     * @param string $condition
     * @return mixed
     */
    public function Items($condition = '')
    {
        if ($condition) $condition .= " AND disabled = 'false'";
        else $condition = "disabled = 'false'";
        $list = $this->ModelQueryAll($this->selectSql("cat_id,parent_id,cat_name,cat_path,p_order,img_url",$condition));
        if ($list) return $this->catList($list);
        return array();
    }

    /**
     * 分类处理
     *
     * @param $list
     * @return array
     */
    private function catList($list)
    {
        foreach ($list as $v) {
            $str_count = substr_count($v['cat_path'],',');
            $cat_path_arr = explode(',',$v['cat_path']);
            $row['cat_id'] = $v['cat_id'];
            $row['parent_id'] = $v['parent_id'];
            $row['cat_name'] = $v['cat_name'];
            $row['path'] = $str_count;
            $row['p_order'] = $v['p_order'];
            $row['img_url'] = $v['img_url'];
            $row['child'] = array();

            if ($str_count == 1) $items[$v['cat_id']] = $row;
            elseif ($str_count == 2) $items[$v['parent_id']]['child'][$v['cat_id']] = $row;
            elseif ($str_count == 3) $items[$cat_path_arr[1]]['child'][$cat_path_arr[2]]['child'][] = $row;
        }
        return $items;
    }
} 