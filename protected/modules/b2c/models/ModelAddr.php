<?php
/**
 * 收货地址管理.
 *
 * @author        chenfenghua <843958575@qq.com>
 * @copyright     Copyright (c) 2011-2015 shop. All rights reserved.
 * @link          http://www.yiitian.com
 * @package       yiishop.model
 * @license       http://www.yiitian.com/license
 * @version       v1.0.0
 */

class ModelAddr extends B2cModel
{
    /**
     * 默认收货地址
     *
     * @param $member_id
     * @return mixed
     */
    public function Addrdefault($member_id)
    {
        $select = 'addr_id,member_id,name,area,addr,zip,tel,mobile,day,time,def_addr';
        $def_sql = "SELECT {$select} FROM {{b2c_member_addrs}} WHERE member_id = $member_id AND def_addr = 1";

        return $this->ModelQueryRow($def_sql);
    }

    /**
     * 收货地址详情
     *
     * @param $addr_id
     * @return mixed
     */
    public function AddrRow($addr_id)
    {
        $select = 'addr_id,member_id,name,area,addr,zip,tel,mobile,day,time,def_addr';
        $row = $this->ModelQueryRow("SELECT {$select} FROM {{b2c_member_addrs}} WHERE addr_id = $addr_id");
        if(empty($row)){
            return false;
        }
        $row['area'] = $this->AreaToAddr($row['area']);

        return $row;
    }

    /**
     * 收货地址列表
     *
     * @param $member_id
     * @return mixed
     */
    public function AddrList($member_id)
    {
        $select = 'addr_id,member_id,name,area,addr,zip,tel,mobile,day,time,def_addr';
        $def_sql = "SELECT {$select} FROM {{b2c_member_addrs}} WHERE member_id = $member_id";

        $def_list = $this->ModelQueryAll($def_sql);

        foreach ($def_list as $k => $v) {
            $area = $this->AddrArea($v['area']);
            $def_list[$k]['area'] = $area['area'];
            $def_list[$k]['area_id'] = $area['area_id'];
            $def_list[$k]['def_addr'] = empty($v['def_addr']) ? 0 : 1;
        }

        return $def_list;
    }

    /**
     * 收货地址编辑
     *
     * @param $addr_id
     * @param $params
     * @param $address_default_check
     * @param $address_default_old
     * @return bool
     */
    public function AddrEdit($addr_id,$params,$address_default_check,$address_default_old)
    {
        if ($address_default_check == 1 && $address_default_old != 1) {
            $result = $this->AddressDef($params['member_id'],true);
            if ($result == false) return false;
        }

        $params['def_addr'] = $address_default_check;
        if (isset($params['area']) && $params['area']) $params['area'] = $this->AddrAreaTo($params['area']);

        if (!$this->ModelEdit('{{b2c_member_addrs}}',array('addr_id'=>$addr_id),$params))
            return false;
        return true;
    }

    /**
     * 收货地址删除
     *
     * @param $addr_id
     * @return bool
     */
    public function AddrDel($addr_id)
    {
        if (!$this->ModelExecute("DELETE FROM {{b2c_member_addrs}} WHERE addr_id = $addr_id"))
            return false;
        return true;
    }

    /**
     * 收货地址添加
     *
     * @param $params
     * @param $address_default_check
     * @return bool
     */
    public function AddrAdd($params,$address_default_check)
    {
        if ($address_default_check == 1) {
            $sql = "update  {{b2c_member_addrs}}  set def_addr = 0 where member_id = ".$params['member_id'];
             $this->ModelExecute($sql) ;
        }

        $params['def_addr'] = $address_default_check;
        if (isset($params['area']) && $params['area']) $params['area'] = $this->AddrAreaTo($params['area']);
//        var_dump($params);die();
        if (!$this->ModelInsert('{{b2c_member_addrs}}', $params))
            return false;
        return true;
    }

    /**
     * 默认地址为空
     * @param int $member_id
     * @param bool $type
     * @return bool
     */
    public function AddressDef($member_id,$type=false)
    {
        $member_id = intval($member_id);

        if ($type == true) {
            $def_row = $this->ModelQueryRow("SELECT addr_id FROM _{{member_addrs}} WHERE member_id = $member_id AND def_addr = 1");
            if (!$def_row) return true;
        }

        $sql = 'UPDATE {{b2c_member_addrs}} SET def_addr = 0 WHERE member_id ='.$member_id;

        if ($this->ModelExecute($sql))
            return true;
        else
            return false;
    }

    /**
     * 收货地区格式修改
     *
     * @param $area
     * @return mixed
     */
    public function AddrArea($area)
    {
        if (empty($area)) return $area;
        $areaArr = explode(':', $area);
        $item['area'] = '';
        $item['area_id'] = '';

        if (isset($areaArr[1]) && !empty($areaArr[1])) $item['area'] = str_replace('/', '', $areaArr[1]);
        if (isset($areaArr[2]) && !empty($areaArr[2])) $item['area_id'] = $areaArr[2];
        return $item;
    }

    /**
     * 收货地址格式编辑
     *
     * @param $region_id
     * @return string
     */
    public function AddrAreaTo($region_id)
    {
        $region_row = $this->ModelQueryRow("SELECT region_path FROM {{ectools_regions}} WHERE region_id = $region_id");
        $region_path = trim($region_row['region_path'], ',');

        $region_list = $this->ModelQueryAll(
            "SELECT local_name FROM {{ectools_regions}}
            WHERE region_id IN ({$region_path}) ORDER BY region_grade ASC"
        );

        foreach ($region_list as $v) {
            $area_arr[] = $v['local_name'];
        }
        $area = implode('/', $area_arr);

        return 'mainland:' . $area . ':' . $region_id;
    }

    /**
     * 收货地址格式还原
     *
     * @param $area
     * @return array
     */
    public function AreaToAddr($area)
    {
        $areaArr = explode(':',$area);
        $region_id = $areaArr[2];

        $region_row = $this->ModelQueryRow("SELECT region_id,region_path FROM {{ectools_regions}} WHERE region_id = {$region_id}");

        $region_path = trim($region_row['region_path'],',');
        $regionArr = explode(',',$region_path);

        $item = array();
        $item['province'] = $this->Regions();
        if (isset($regionArr[0])) {
            $item['province_id'] = $regionArr[0];
            $item['city'] = $this->Regions($regionArr[0]);
        }
        if (isset($regionArr[1])) {
            $item['city_id'] = $regionArr[1];
            $item['town'] = $this->Regions($regionArr[1]);
        }
        if (isset($regionArr[2])) {
            $item['town_id'] = $regionArr[2];
        }

        return $item;
    }

    /**
     * 收货地区
     *
     * @param int $region_id
     * @return mixed
     */
    public function Regions($region_id = 0)
    {
        if ($region_id)
            $rows = $this->ModelQueryAll(
                "SELECT region_id,local_name FROM {{ectools_regions}}
                WHERE p_region_id = {$region_id} ORDER BY region_id ASC"
            );
        else $rows = $this->ModelQueryAll(
            "SELECT region_id,local_name FROM {{ectools_regions}}
            WHERE region_grade = 1 ORDER BY region_id ASC"
        );

        return $rows;
    }

    /**
     * 收货地址
     * 有默认地址显示默认，没有默认显示最近添加
     *
     * @param $member_id
     * @return array
     */
    public function AddrOrderDefault($member_id)
    {
        $select = 'addr_id,member_id,name,area,addr,zip,tel,mobile,day,time';
        $def_sql = "SELECT {$select} FROM {{b2c_member_addrs}}
        WHERE member_id = $member_id AND def_addr = 1";
        $def_addr = $this->ModelQueryRow($def_sql);

        if (!$def_addr) {
            $def_sql = "SELECT {$select} FROM {{b2c_member_addrs}} WHERE member_id = $member_id ORDER BY addr_id DESC";
            $def_addr = $this->ModelQueryRow($def_sql);
        }

        if (!$def_addr) return false;

        $def_addr['def_area'] = $def_addr['area'];
        $area = $this->AddrArea($def_addr['area']);
        $def_addr['area'] = $area['area'];
        $def_addr['area_id'] = $area['area_id'];



        return $def_addr;
    }

    /**
     * 收货地址选择
     *
     * @param $member_id
     * @param $addr_id
     * @return array
     */
    public function AddrSelect($member_id, $addr_id)
    {
        $order_info = Yii::app()->cache->get('b2c-cart-product-set-' . $member_id);
//        var_dump($order_info);
        $select = 'addr_id,member_id,name,area,area as def_area,addr,zip,tel,mobile,day,time';
        $def_sql = "SELECT {$select} FROM {{b2c_member_addrs}} WHERE addr_id = $addr_id";
        $addr = $this->ModelQueryRow($def_sql);
        if(empty($addr)) return false;

        $area = $this->AddrArea($addr['area']);
        $addr['area'] = $area['area'];
        $addr['area_id'] = $area['area_id'];
        $order_info['addr'] = $addr;
        if (Yii::app()->cache->set('b2c-cart-product-set-' . $member_id, $order_info, $this->cart_expire))
//        var_dump(Yii::app()->cache->get('b2c-cart-product-set-' . $member_id));die();
            return  true ;


        return false;
    }


    public function addressDefault($member_id, $addr_id){
        $select = 'addr_id,member_id,name,area,area as def_area,addr,zip,tel,mobile,day,time';
        $def_sql = "SELECT {$select} FROM {{b2c_member_addrs}} WHERE addr_id = $addr_id";
        $addr = $this->ModelQueryRow($def_sql);
        if(empty($addr)) return false;

        $sql = "UPDATE {{b2c_member_addrs}} SET def_addr = 0 where member_id = $member_id";
        $this->ModelExecute($sql);
        $sql = "update {{b2c_member_addrs}} set def_addr = 1 where member_id =  $member_id  and addr_id= $addr_id";
        return  $this->ModelExecute($sql);

    }
}