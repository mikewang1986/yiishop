<?php
/**
 * 品牌管理.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       yiishop.model
 * @license       http://www.yiitian.com/license
 * @version       v1.0.0
 */

class ModelBrand extends B2cModel
{
    public $table = '{{b2c_brand}}';

    /**
     * 单个品牌
     *
     * @param string $condition
     * @return mixed
     */
    public function Item($condition = '')
    {
        if ($condition) $condition .= " AND disabled = 'false'";
        else $condition = "disabled = 'false'";
        return $this->ModelQueryRow($this->selectSql("brand_id,brand_name,brand_url,brand_logo",$condition));
    }

    /**
     * 品牌列表
     *
     * @param string $condition
     * @return mixed
     */
    public function Items($condition = '')
    {
        if ($condition) $condition .= " AND disabled = 'false'";
        else $condition = "disabled = 'false'";
        return $this->ModelQueryAll($this->selectSql("brand_id,brand_name,brand_url,brand_logo",$condition));
    }
} 