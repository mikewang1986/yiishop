<?php

class RPCController extends Controller {
   public  $rpc;
   public function init() {
        $this->rpc=new RPC();
    }

}