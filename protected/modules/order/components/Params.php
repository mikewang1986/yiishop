<?php

/**
 * 订单状态转换
 */
class Params {

    /**
     * 付款状态
     *
     * @param $status
     * @return array
     */
    public static function PayStatus($status)
    {
        $pay_status = array(
            0=>'未付款',
            1=>'已支付',
            2=>'已付款至担保方',
            3=>'部分付款',
            4=>'部分退款',
            5=>'全额退款'
        );
        return isset($pay_status[$status])?$pay_status[$status]:'';
    }

    /**
     * 支付单状态
     *
     * @param $status
     * @return string
     */
    public static function PaymentStatus($status)
    {
        $payment_status = array(
            'succ'=>'支付成功',
            'failed'=>'支付失败',
            'cancel'=>'未支付',
            'error'=>'处理异常',
            'invalid'=>'非法参数',
            'progress'=>'已付款至担保方',
            'timeout'=>'超时',
            'ready'=>'准备中',
        );
        return isset($payment_status[$status])?$payment_status[$status]:'';
    }

    /**
     * 发货状态
     *
     * @param $status
     * @return string
     */
    public static function ShipStatus($status)
    {
        $ship_status = array(
            0=>'未发货',
            1=>'已发货',
            2=>'部分发货',
            3=>'部分退货',
            4=>'已退货'
        );
        return isset($ship_status[$status])?$ship_status[$status]:'';
    }

    /**
     * 日志记录操作的行为
     *
     * @param $status
     * @return string
     */
    public static function BehaviorStatus($status)
    {
        $behavior_status = array(
            'creates'=>'创建',
            'updates'=>'修改',
            'payments'=>'支付',
            'refunds'=>'退款',
            'delivery'=>'发货',
            'reship'=>'退货',
            'finish'=>'完成',
            'cancel'=>'取消',
        );
        return isset($behavior_status[$status])?$behavior_status[$status]:'';
    }

    /**
     * 获取用户名
     *
     * @param $member_id
     * @return mixed
     */
    public static function PamMember($member_id)
    {
        $cache_name = 'pam_member';
        $member_list = Yii::app()->cache->get($cache_name);
        if (isset($member_list[$member_id]) && $member_list) return $member_list[$member_id];

        $sql = "SELECT member_id,name FROM {{b2c_members}}";
        $command = Yii::app()->db->createCommand($sql);
        $list = $command->queryAll();
        foreach ($list as $v) {
            $item[$v['member_id']] = $v['name'];
        }

        Yii::app()->cache->set($cache_name, $item,30);
        return isset($item[$member_id])?$item[$member_id]:'';
    }

    /**
     * 获取会员信息
     *
     * @param $member_id
     * @return mixed
     */
    public static function Member($member_id)
    {
        $cache_name = 'member';
        $member_list = Yii::app()->cache->get($cache_name);
        if (isset($member_list[$member_id]) && $member_list[$member_id]) return $member_list[$member_id];

        $sql = "SELECT * FROM {{b2c_members}}";
        $command = Yii::app()->db->createCommand($sql);
        $list = $command->queryAll();
        foreach ($list as $v) {
            $item[$v['member_id']] = $v;
        }

        Yii::app()->cache->set($cache_name,$item);
        return $item[$member_id];
    }

    /**
     * 配送方式
     *
     * @param $dt_id
     * @return mixed
     */
    public static function DlyType($dt_id)
    {
        $cache_name = 'dlytype';
        $dly_list = Yii::app()->cache->get($cache_name);
        if ($dly_list) return $dly_list[$dt_id];

        $sql = "SELECT * FROM {{b2c_dlytype}}";
        $command = Yii::app()->db->createCommand($sql);
        $list = $command->queryAll();
        foreach ($list as $v) {
            $item[$v['dt_id']] = $v;
        }

        Yii::app()->cache->set($cache_name);
        return $item[$dt_id];
    }

    /**
     * 地区去掉 mainland 字符
     *
     * @param $area
     * @return mixed
     */
    public static function AreaMainLand($area)
    {
        if (!empty($area)) {
            $areaArr = explode(':',$area);
            if (isset($areaArr[1])) return $areaArr[1];
        }
        return $area;
    }
}