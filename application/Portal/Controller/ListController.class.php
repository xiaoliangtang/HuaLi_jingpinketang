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
 * 文章列表
*/
class ListController extends HomeBaseController {

	//文章内页
	public function index() {
		$term=sp_get_term($_GET['id']);

		/* 获取主题配置 */
		$theme_config = sp_get_plugin_config('Config');
		/* 获取图片插件 */
		$theme_config3 = sp_get_plugin_config('Image');

		//获取所有导航
		$allnav1 = sp_get_menu_tree($theme_config['model2_menu']);
		$allnav2 = sp_get_menu_tree($theme_config['model3_menu']);
		$allnavs = array_merge($allnav1,$allnav2);
		$this->assign("allnavs",$allnavs);


		//首页导航
		$navs = sp_get_menu_tree($theme_config['model2_menu']);
		//咨询评估导航
		$zpnavs = sp_get_menu_tree($theme_config['model3_menu']);
		//专家团队图片
		$team_img = $theme_config3['team_img'];
		//个人评估图片
		$access_img = $theme_config3['access_img'];

		//美国移民栏目ID
		$usymid = $theme_config['model16_usymid'];
		

		//查询关于我们的子导航
        /* 获取主题配置 */
        $theme_config = sp_get_plugin_config('Config');
        $navs = sp_get_menu_tree($theme_config['model2_menu']);
        $aboutnavs = $navs[$theme_config['model5_aboutmenu']]['child'];

        //获取eb5的链接
        $eb5url = $navs[$theme_config['model12_eb5menu']]['href'];
        //获取专家团队的链接
        $teamurl = $navs[$theme_config['model15_teamid']]['href'];
        //移民项目链接
        $projecturl = $navs[$theme_config['model10_projectid']]['href'];


        //专家团队页面ID
		$team_id = $theme_config['model15_teamcid'];
		//移民项目的页面ID
		$project_id = $theme_config['model10_projectcid'];

        //移民项目子栏目
		$projects = $navs[$theme_config['model10_projectid']]['child'];
		//精彩瞬间子栏目
		$wonderfulchilds = $navs[$theme_config['model19_wonderfulid']]['child'];


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
		
		//组合数组：将移民子项目对应的页面id组合
		$projects_chlid = M('terms')->field('term_id,name')->where(array('parent'=>$theme_config['model10_projectcid']))->select();
		$projects_all = array();
		$projects_chlid_tid = array();
		foreach ($projects as $key => $value) {
			foreach ($projects_chlid as $k => $v) {
				$projects_chlid_tid[] = $v['term_id'];
				if($value['label']===$v['name']){
					$value['tid']=$v['term_id'];
					$projects_all[]=$value;
				}
			}
		}
		$projects_chlid_tids = implode(',', $projects_chlid_tid);



		$this->assign("navs",$navs);
		$this->assign("zpnavs",$zpnavs);
		$this->assign("team_img",$team_img);
		$this->assign("access_img",$access_img);
		$this->assign("projects",$projects);
		//分配移民项目所有子id
		$this->assign("projects_chlid_tids",$projects_chlid_tids);
		//分配所有移民项目子栏目的信息
		$this->assign("projects_all",$projects_all);

		$this->assign("eb5url",$eb5url);
		$this->assign("team_id",$team_id);
		$this->assign("teamurl",$teamurl);
		$this->assign("project_id",$project_id);
		$this->assign("wonderfulchilds",$wonderfulchilds);
		//分配移民资讯子页面信息
		$this->assign("ymzx_all",$ymzx_all);

		//分配关于我们栏目子导航
		$this->assign("aboutnavs",$aboutnavs);
		
		if(empty($term)){
		    header('HTTP/1.1 404 Not Found');
		    header('Status:404 Not Found');
		    if(sp_template_file_exists(MODULE_NAME."/404")){
		        $this->display(":404");
		    }
		    	
		    return ;
		}
		
		$tplname=$term["list_tpl"];
    	$tplname=sp_get_apphome_tpl($tplname, "list");
    	$this->assign($term);
    	$this->assign('cat_id', intval($_GET['id']));
    	$this->display(":$tplname");
	}
	
	public function nav_index(){
		$navcatname="文章分类";
		$datas=sp_get_terms("field:term_id,name");
		$navrule=array(
				"action"=>"List/index",
				"param"=>array(
						"id"=>"term_id"
				),
				"label"=>"name");
		exit(sp_get_nav4admin($navcatname,$datas,$navrule));
		
	}
    	
	//提交的数据插入到数据库中
    function post_displayinfo(){
    	$access = M('access');


    	//数据验证
    	$pattern = "/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/";
    	$pattern2 = "((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)";
    	$pattern3 = "/^[1-9][0-9]{4,9}$/";

    	$email = preg_match_all($pattern, $_POST['email'],$match);  
    	$qq = preg_match_all($pattern3, $_POST['qq'], $match);	
		$phone = preg_match_all($pattern2, $_POST['phone'],$match);


    	if(empty($_POST['name'])){
    		$this->error("对不起，姓名不能为空，请重试！");
    	}

    	if(empty($_POST['sex'])){
    		$this->error("对不起，性别不能为空，请重试！");
    	}

    	if(empty($_POST['age'])){
    		$this->error("对不起，年龄不能为空，请重试！");
    	}

    	if($phone == "0"){
    		$this->error("对不起，电话号码格式错误，请重试！");
    	}

    	if($qq == "0"){
    		$this->error("对不起，QQ格式错误，请重试！");
    	}

    	if($email == "0"){
    		$this->error("对不起，邮箱格式错误，请重试！");
    	}

    	//将数据插入提交到数据库中
   		if(IS_POST){
    		$_POST = I('post.');
			if ($access->create()) {
				$_POST['commit_time'] = date('Y-m-d :H:i',time());
				if ($access->add()!==false) {
					$this->success("恭喜您，提交成功！");
				} else {
					$this->error("对不起，提交失败，请重试！");
				}
			} else {
				$this->error($access->getError());
			}
		}
    }


}
