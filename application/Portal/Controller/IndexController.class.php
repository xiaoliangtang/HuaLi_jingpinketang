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
/**
 * 首页
 */
class IndexController extends HomeBaseController {
	
    //首页
	public function index() {
		/* 获取主题配置 */
		$theme_config = sp_get_plugin_config('Config');
		//主导航
		$navs = sp_get_menu_tree($theme_config['model2_menu']);
		//咨询评估导航
		$zpnavs = sp_get_menu_tree($theme_config['model3_menu']);

		//获取全站文章索引
		//$alltid = $theme_config['model17_alltid'];
		//新闻资讯栏目ID
		$newsid = $theme_config["model8_newsid"];
		//公司活动栏目ID
		$activityid = $theme_config['model6_activitymenuid'];
		//移民项目子导航
		$projects = $navs[$theme_config['model10_projectid']]['child'];	


		//公司活动链接
		$activityurl = $navs[$theme_config['model5_aboutmenu']]['child'][$theme_config['model6_activityid']]['href'];
		//获取专家团队的链接
        $teamurl = $navs[$theme_config['model15_teamid']]['href'];
        //专家团队页面ID
		$team_id = $theme_config['model15_teamcid'];


		//组合数组：将移民子项目对应的页面id组合
		$projects_chlid = M('terms')->field('term_id,name')->where(array('parent'=>$theme_config['model10_projectcid']))->select();
		$projects_all = array();
		foreach ($projects as $key => $value) {
			foreach ($projects_chlid as $k => $v) {
				if($value['label']===$v['name']){
					$value['tid']=$v['term_id'];
					$projects_all[]=$value;
				}
			}
		}

		//组合数组：将移民资讯对应的子页面id组合
		$ymzx = $navs[$theme_config['model13_ymzxtid']]['child'];
		$ymzx_chlid = M('terms')->field('term_id,name')->where(array('parent'=>$theme_config['model13_ymzxtid']))->select();
		$ymzx_all = array();
		foreach ($ymzx as $key => $value) {
			foreach ($ymzx_chlid as $k => $v) {
				if($value['label']===$v['name']){
					$value['cat_id']=$v['term_id'];
					$ymzx_all[]=$value;
				}
			}
		}


		//分配导航
		$this->assign("navs",$navs);
		$this->assign("zpnavs",$zpnavs);
		//$this->assign("alltid",$alltid);
		$this->assign("newsid",$newsid);
		$this->assign("activityid",$activityid);
		$this->assign("projects",$projects);

		$this->assign("activityurl",$activityurl);
		$this->assign("teamurl",$teamurl);
		$this->assign("team_id",$team_id);

		//分配移民项目的子页面id
		$this->assign("projects_all",$projects_all);
		//分配移民资讯的子页面id
		$this->assign("ymzx_all",$ymzx_all);
    	$this->display(":index");
    }   

}


