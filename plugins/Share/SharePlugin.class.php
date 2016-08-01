<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace plugins\Share;//Share插件英文名，改成你的插件英文就行了
use Common\Lib\Plugin;

/**
 * Share
 */
class SharePlugin extends Plugin{//Share插件英文名，改成你的插件英文就行了

        public $info = array(
            'name'=>'Share',//Share插件英文名，改成你的插件英文就行了
            'title'=>'分享插件',
            'description'=>'网站分享',
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
        
        //实现的share钩子方法
        public function share($param){
        	$Share=$this->getConfig();
        	$this->assign($Share);
        	$this->display('widget');
        }

    }