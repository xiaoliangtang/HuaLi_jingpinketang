<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;
use Common\Controller\HomeBaseController;
class SitemapController extends HomeBaseController{
	public function index() {

		/* 获取主题配置 */
		$theme_config = sp_get_plugin_config('Config');
		/* 获取图片插件 */
		$theme_config3 = sp_get_plugin_config('Image');

		//获取主导航
		$navs = sp_get_menu_tree($theme_config['model2_menu']);

		//获取咨询评估导航
		$zpnavs = sp_get_menu_tree($theme_config['model3_menu']);

		$this->assign("navs",$navs);
		$this->assign("zpnavs",$zpnavs);
		//var_dump($navs);
		$this->display(":sitemap");
	}
}