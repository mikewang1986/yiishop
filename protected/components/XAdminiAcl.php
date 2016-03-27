<?php
/**
 * 权限角色管理
 */
class XAdminiAcl
{
    //权限配制数据
    public static $aclList = array(
        'order'=>array(
            'name'=>'订单',
            'ctl'=>array(
                array(
                    'name'=>'订单列表',
                    'list_ctl'=>array('default'),
                    'act'=>array(
                        'default'=>array(
                            'name'=>'订单',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'订单列表','update'=>'订单编辑','delete'=>'删除订单')
                        ),
                    )
                )
            )
        ),
        'goods'=>array(
            'name'=>'商品',
            'ctl'=>array(
                array(
                    'name'=>'商品管理',
                    'list_ctl'=>array('default'),
                    'act'=>array(
                        'default'=>array(
                            'name'=>'商品列表',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'商品列表')
                        ),
                    )
                ),
                array(
                    'name'=>'商品配置',
                    'list_ctl'=>array('cat','brand','spec','type','props'),
                    'act'=>array(
                        'cat'=>array(
                            'name'=>'商品分类',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'分类列表')
                        ),
                        'type'=>array(
                            'name'=>'商品类型',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'类型列表')
                        ),
                        'brand'=>array(
                            'name'=>'商品品牌',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'品牌列表')
                        ),
                        'spec'=>array(
                            'name'=>'商品规格',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'规格列表')
                        ),
                        'props'=>array(
                            'name'=>'商品扩展属性',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'扩展属性列表')
                        ),
                    ),
                ),
            )
        ),
		
		'cms'=>array(
            'name'=>'内容管理',
            'ctl'=>array(
                'name'=>'栏目',
                'list_ctl'=>array('category','article'),
                'act'=>array(
                    'category'=>array(
                        'name'=>'栏目管理',
                        'default_id'=>'index',
                        'list_act'=>array('index'=>'栏目列表','insert'=>'新增栏目','update'=>'栏目编辑','delete'=>'栏目删除')
                    ),
                    'article'=>array(
                        'name'=>'文章管理',
                        'default_id'=>'index',
                        'list_act'=>array('index'=>'文章列表','insert'=>'新增文章','update'=>'栏目文章','delete'=>'栏目文章')
                    ),
                )
            )
        ),

        'desktop'=>array(
            'name'=>'系统',
            'ctl'=>array(
                array(
                    'name'=>'管理员和权限',
                    'list_ctl'=>array('role','user'),
                    'act'=>array(
                        'role'=>array(
                            'name'=>'角色管理',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'角色列表','update'=>'角色编辑')
                        ),
                        'user'=>array(
                            'name'=>'操作员管理',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'操作员列表')
                        ),
                    )
                )
            )
        ),
        //add by wanglei 增加会员管理
        'user'=>array(
            'name'=>'会员管理',
            'ctl'=>array(
                array(
                    'name'=>'会员管理',
                    'list_ctl'=>array('member','rank','outchangegold'),
                    'act'=>array(
                        'member'=>array(
                            'name'=>'会员管理',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'会员列表','update'=>'会员编辑')
                        ),
                        'rank'=>array(
                            'name'=>'会员等级',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'等级列表','update'=>'等级编辑','add'=>'新建等级'),
                        ),
                        'outchargegold'=>array(
                            'name'=>'审核余额提现操作',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'列表')
                        ),
                    )
                )
            )
        ),
        //add by wanglei 微信设置
        'weixin'=>array(
            'name'=>'公众号管理',
            'ctl'=>array(
                array(
                    'name'=>'会公众号管理',
                    'list_ctl'=>array('weixin'),
                    'act'=>array(
                        'member'=>array(
                            'name'=>'会公众号管理',
                            'default_id'=>'index',
                            'list_act'=>array('index'=>'会公众号列表','update'=>'会公众号修改','add'=>'会公众号增加')
                        ),

                    )
                )
            )
        ),

    );

    /**
     * 后台菜单过滤
     *
     */
    static public function filterMenu($acl_list,$super)
    {
        $item = self::$aclList;
        if ($super == 1) return $item;
        foreach ($item as $k=>$v) {
            foreach ($v['ctl'] as $kk=>$vv) {
                foreach ($vv['act'] as $kkk=>$vvv) {
                    $acl = $k.'_'.$kkk.'_'.$vvv['default_id'];
                    if (!in_array($acl,$acl_list)) {
                        unset($item[$k]['ctl'][$kk]['act'][$kkk]);
                    }
                }
                if (empty($item[$k]['ctl'][$kk]['act'])) unset($item[$k]['ctl'][$kk]);
            }
            if (empty($item[$k]['ctl'])) unset($item[$k]);
        }
        return $item;
    }

    /**
     * 系统角色管理
     *
     * @return array
     */
    public static function RoleMenu()
    {
        return self::$aclList;
    }
}

