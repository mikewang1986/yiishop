<?php
class ApiRequestUrl {
    private $hostArray = array("http://m.mingyizhudao.com" => "http://crm560.mingyizd.com", "http://api.mingyizhudao.com" => "http://crm560.mingyizd.com", "http://wap.dev.mingyizd.com" => "http://crm.dev.mingyizd.com");
    private $admin_salesbooking_create = 'api/adminbooking';
    private function getHostInfo() {
        $hostInfo = strtolower(Yii::app()->request->hostInfo);
        if (isset($this->hostArray[$hostInfo])) {
            return $this->hostArray[$hostInfo];
        } else {
            return "http://crm.dev.mingyizd.com";
        }
    }
    //得到域名后的地址
    public function getUrl($url) {
        return $this->getHostInfo() . '/' . $url;    
    }
    public function getUrlAdminSalesBookingCreate() {
        return $this->getUrl($this->admin_salesbooking_create);
    }
    public function send_get($url) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        $output = curl_exec($ch);
        curl_close($ch);
        return json_decode($output, true);
    }
}
