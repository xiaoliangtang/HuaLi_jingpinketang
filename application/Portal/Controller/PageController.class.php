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
class PageController extends HomeBaseController{
	public function index() {
		$id=$_GET['id'];
		$content=sp_sql_page($id);
		
		if(empty($content)){
		    header('HTTP/1.1 404 Not Found');
		    header('Status:404 Not Found');
		    if(sp_template_file_exists(MODULE_NAME."/404")){
		        $this->display(":404");
		    }
		     
		    return ;
		}


		/* 获取主题配置 */
		$theme_config = sp_get_plugin_config('Config');
		//主导航
		//$navs = M("nav")->where(array('cid'=>$theme_config['model2_menu'],'parentid'=>0))->order("id asc")->select();
		$navs = sp_get_menu_tree($theme_config['model2_menu']);
		//咨询评估导航
		$zpnavs = sp_get_menu_tree($theme_config['model3_menu']);
		$this->assign("navs",$navs);
		$this->assign("zpnavs",$zpnavs);


	    //查询关于我们和EB-5栏目的子导航
        /* 获取主题配置 */
        $theme_config = sp_get_plugin_config('Config');
        $navs = sp_get_menu_tree($theme_config['model2_menu']);
        $aboutnavs = $navs[$theme_config['model5_aboutmenu']]['child'];
        $eb5navs = $navs[$theme_config['model12_eb5menu']]['child'];

		$this->assign($content);

		//分配子导航
        $this->assign("aboutnavs",$aboutnavs);
        $this->assign("eb5navs",$eb5navs);

		$smeta=json_decode($content['smeta'],true);
		$tplname=isset($smeta['template'])?$smeta['template']:"";
		
		$tplname=sp_get_apphome_tpl($tplname, "page");
		
		$this->display(":$tplname");
	}
	
	public function nav_index(){
		$navcatname="页面";
		$datas=sp_sql_pages("field:id,post_title;");
		$navrule=array(
				"action"=>"Page/index",
				"param"=>array(
						"id"=>"id"
				),
				"label"=>"post_title");
		exit( sp_get_nav4admin($navcatname,$datas,$navrule) );
	}
}