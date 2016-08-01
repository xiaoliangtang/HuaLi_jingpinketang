<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace plugins\Weixin;//Weixin插件英文名，改成你的插件英文就行了
use Common\Lib\Plugin;

/**
 * Weixin
 */
class WeixinPlugin extends Plugin{//Weixin插件英文名，改成你的插件英文就行了

        public $info = array(
            'name'=>'Weixin',//Weixin插件英文名，改成你的插件英文就行了
            'title'=>'微信插件',
            'description'=>'网站微信平台',
            'status'=>1,
            'author'=>'xlt',
            'version'=>'1.0'
        );
        
        public $has_admin=1;//插件是否有后台管理界面

        public function install(){//安装方法必须实现
            return true;//安装成功返回true，失败false
        }

        public function uninstall(){//卸载方法必须实现
            return true;//卸载成功返回true，失败false
        }
        
        //实现的footer钩子方法
        public function weixin($param){
        	$Weixin=$this->getConfig();
        	$this->assign($Weixin);
        	$this->display('widget');
        }

    }