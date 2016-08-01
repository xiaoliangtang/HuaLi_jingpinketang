<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0019)http://www.immi.cn/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">		
	<meta http-equiv="X-UA-Compatible" content="IE=8">
	<meta name="renderer" content="webkit">
	<title><?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
	<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>">
	<meta name="description" content="<?php echo ($site_seo_description); ?>">
	<link href="/immigration/tpl/immagration/Public/css/index_new.css" rel="stylesheet" type="text/css">
	<!--<base target="_blank">-->
	<base href="." target="_blank">
	<link rel="stylesheet" href="/immigration/tpl/immagration/Public/css/1001.css" type="text/css" charset="utf-8">
	<link rel="stylesheet" type="text/css" href="/immigration/tpl/immagration/Public/css/wei.css">
</head>

<body>
<!--头部开始-->
<?php
 $theme_config = sp_get_plugin_config('Config'); $theme_config3 = sp_get_plugin_config('Image'); ?>

<!-- 头部代码 -->
<link href="/immigration/tpl/immagration/Public/css/common_aojia.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="/immigration/tpl/immagration/Public/images/favicon.ico"> 
<script async="" type="text/javascript" src="/immigration/tpl/immagration/Public/js/ca-pub-8129816473729933.js"></script>
<script src="/immigration/tpl/immagration/Public/js/hm.js"></script>
<script charset="utf-8" src="/immigration/tpl/immagration/Public/js/b.js"></script>
<!-- <script charset="utf-8" src="/immigration/tpl/immagration/Public/js/lxb.js"></script> -->
<script type="text/javascript" src="/immigration/tpl/immagration/Public/js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="http://www.immi.cn/statics/js/main.js"></script> -->
<!--<base target="_blank">-->
<base href="." target="_blank">
<!--阻止IE下报错JS-->
<script>window.onerror=function(){return true;}</script>

<!--头部文件 开始-->
<div class="head">
		<div class="center">
    		
        <div class="right">
        	<ul>
            	<li>
	            	<a onclick="shoucang(document.title,window.location)" rel="sidebar">加入收藏</a>
	            	<a class="last" href="<?php echo UU('portal/sitemap/index');?>" title="网站地图">网站地图</a>
            	</li>
           </ul>
        </div>
        
    </div>
</div>
<div id="logo_row-wrap">
<div id="logo_row">
	<div class="left">
    	<h1>
    	<a href="<?php echo ($site_host); ?> "><img src="<?php echo sp_get_asset_upload_path($theme_config3['logo_img']);?>" width="254" height="54" alt="<?php echo ($site_name); ?>" title="<?php echo ($site_name); ?>"></a>
    	</h1>
    </div>
    
     
    <div class="right">
		<img src="/immigration/tpl/immagration/Public/images/pinpai.png" width="404" height="17">
		<!--咨询评估-->
        <div class="console">
	        <?php if(is_array($zpnavs)): foreach($zpnavs as $key=>$vo): ?><a href="<?php echo ($vo["href"]); ?>"><?php echo ($vo["label"]); ?></a><?php endforeach; endif; ?>
		</div>
    </div>
</div>
</div>
		<div id="box1">
			<!--导航-->
			<div class="nav">
				<!--导航条-->
				<ul class="nav-main">
				<?php if(is_array($navs)): foreach($navs as $key=>$vo): ?><li><a href="<?php echo ($vo["href"]); ?>" target="<?php echo ($vo["target"]); ?>"><?php echo ($vo["label"]); ?></a></li><?php endforeach; endif; ?>
				</ul>
				
			</div>

		</div>
	
   <script type="text/javascript"> 
// 加入收藏 兼容360和IE6 
function shoucang(sTitle,sURL) 
{ 
try 
{ 
window.external.addFavorite(sURL, sTitle); 
} 
catch (e) 
{ 
try 
{ 
window.sidebar.addPanel(sTitle, sURL, ""); 
} 
catch (e) 
{ 
alert("加入收藏失败，请使用Ctrl+D进行添加"); 
} 
} 
} 
</script> 





<!--头部结束-->	

<!--banner-->
<!-- 幻灯片 -->
	<div class="banner" id="banner">
		<div class="banner_show" id="banner_show">
			
			<!-- $theme_config['model1_slide']实现动态修改幻灯片的标识 -->
			<?php $home_slides=sp_getslide($theme_config['model1_slide']); ?>
			<a href="" title="">	
				<?php if(is_array($home_slides)): foreach($home_slides as $key=>$vo): ?><img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" title="<?php echo ($vo["slide_name"]); ?>" _link="<?php echo ($vo["slide_url"]); ?>" width="1024" height="380" alt="<?php echo ($vo["slide_name"]); ?>" style=""><?php endforeach; endif; ?>
 			</a> 

		</div>
		<div class="banner_title_bg"></div>
		<div class="banner_title" id="banner_title">
			<!-- 标题显示 -->
			<h5><a href="" title=""></a></h5>
			<!-- 显示图片轮播进度小圆点 -->
			<ul>
			<?php if(is_array($home_slides)): foreach($home_slides as $key=>$vo): ?><li class=""></li><?php endforeach; endif; ?>
            </ul>
		</div>

		<div></div>
		<div class="banner_btnl" id="banner_btnl"></div>
		<div class="banner_btnr" id="banner_btnr"></div>
	</div>

	<ul class="push">
		<!--最新文章-->
	    <?php $lists = sp_sql_posts_paged("order:post_date DESC;",1); ?>
        <?php if(!empty($lists['posts'])): if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>">最新：<?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; endif; ?>
		<!--置顶文章-->
	    <?php $lists = sp_sql_posts_paged("where:istop=1;order:post_date DESC;",1); ?>
        <?php if(!empty($lists['posts'])): if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>">置顶：<?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; endif; ?>
		<!--推荐文章-->
	    <?php $lists = sp_sql_posts_paged("where:recommended=1;order:post_date DESC;",1); ?>
        <?php if(!empty($lists['posts'])): if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>">推荐：<?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; endif; ?>
    </ul>
		
		
		<!--移民国家-->
		<div class="ym_country">
			<ol>
				<li class="zuo">
					<h2><span class="red">移民</span>国家</h2>
				  	<ul class="coun">
						<li><a href="/immigration">美国</a></li>
					</ul>
						<ol class="pinggu">
							<?php $class = array(1=>'pg',2=>'rx');$i=0; ?>
							<?php if(is_array($zpnavs)): $i = 0; $__LIST__ = $zpnavs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo ($vo["href"]); ?>"><i class="<?php echo ($class[$i]); ?>"></i><b><?php echo ($vo["label"]); ?></b></a></li>
							<?php $i = $i++; endforeach; endif; else: echo "" ;endif; ?>
							<li><i class="ct"></i><b style="line-height: 25px;">资讯热线1<br>020-82905849</b></li>
							<li><i class="ct"></i><b style="line-height: 25px;">资讯热线2<br>020-37634589</b></li>					
						</ol>				
				</li>

				<!--新闻资讯-->
				<li class="zho">

				    <!--推荐文章列表页-->
			        <?php $lists = sp_sql_posts_paged("cid:$newsid;where:recommended=1;order:post_date DESC;",2); ?>
			        <?php if(!empty($lists['posts'])): if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
						<h3 class="fnt18 one"><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><span></span><?php echo ($vo["post_title"]); ?></a></h3>
						<p><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_excerpt"]); ?></a></p><?php endforeach; endif; else: echo "" ;endif; endif; ?>
				 	
				 	<!--按时间发布的文章列表-->
					<ul>
					<?php $lists = sp_sql_posts_paged("cid:$newsid;order:post_date DESC;",5); ?>
			        <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_title"]); ?></a>	
						</li><?php endforeach; endif; else: echo "" ;endif; ?>			     	
					</ul>
				</li>


				<li class="you">
					<h2><span class="red">公司</span>活动   
					<a href="<?php echo ($activityurl); ?>">more</a></h2>

					<!--推荐活动-->
			        <?php $lists = sp_sql_posts_paged("cid:$activityid;where:recommended=1;order:post_date DESC;",1); ?>
			        <?php if(!empty($lists['posts'])): if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
						<dl>
						<?php if($smeta['thumb']): ?><dt><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><img src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" width="142" height="106" alt="<?php echo ($vo["post_title"]); ?>"></a>
		                    </dt><?php endif; ?>
		                    <dd>
			                    <h4><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_title"]); ?></a></h4>
			                    <p><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_excerpt"]); ?></a></p>
		                    </dd>
	                	</dl><?php endforeach; endif; else: echo "" ;endif; endif; ?>


                    <!--按时间发布的活动列表页--> 
                    <ul>  
				        <?php $lists = sp_sql_posts_paged("cid:$activityid;order:post_date DESC;",7); ?>
				        <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><i></i><?php echo ($vo["post_title"]); ?></a>
                        	</li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
				</li>
			</ol>
		</div>

		<!--移民热点项目-->
		<div class="redian w1024">
			<div class="gwbt" style="margin-bottom:10px;">
				<strong style="margin-bottom:10px;"><span class="red">移民</span>热点项目</strong>
			</div>

			<div class="daDiv">
				<div class="daDiv_left">
				<!--name来改变滑动状态-->
				<?php $n = 0; ?>
				<?php if(is_array($projects_all)): $i = 0; $__LIST__ = $projects_all;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if($n%2 == 1): ?><div style="float: right; " name="<?php echo $n; ?>" class="daDiv_left_1">
							<div><a target="_blank" title="<?php echo ($vo["label"]); ?>" class="daDiv_left_2" id="bai" href="<?php echo ($vo["href"]); ?>"><?php echo ($vo["label"]); ?></a>
							</div>
						</div>
					<?php else: ?>
						<!--显示hover的判断-->
						<?php if($n == 0): ?><div style="float: left; " name="<?php echo $n; ?>" class="daDiv_left_1 hover">
								<div><a target="_blank" title="<?php echo ($vo["label"]); ?>" class="daDiv_left_2" id="bai" href="<?php echo ($vo["href"]); ?>"><?php echo ($vo["label"]); ?></a>
							</div>
						<?php else: ?>
							<div style="float: left; " name="<?php echo $n; ?>" class="daDiv_left_1">
								<div><a target="_blank" title="<?php echo ($vo["label"]); ?>" class="daDiv_left_2" id="bai" href="<?php echo ($vo["href"]); ?>"><?php echo ($vo["label"]); ?></a>
							</div><?php endif; ?>
					</div><?php endif; ?>
					<?php $n = ++$n; endforeach; endif; else: echo "" ;endif; ?>
				</div>


				<!--获取对应的页面的文章-->
				<div class="daDiv_right">

				<?php if(is_array($projects_all)): $i = 0; $__LIST__ = $projects_all;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div style="display: block;">
						<div style="float:left;margin-left:10px">
							<img width="374" height="320" alt="广东华立移民留学服务公司" src="/immigration/tpl/immagration/Public/images/ym_0<?php echo rand(1,6); ?>.jpg">
						</div>
						<div class="daDiv_r2">
							<div class="daDiv_r2t">
								<?php echo ($vo["label"]); ?>移民项目
							</div>
							<div class="daDiv_r2n">
								<ul>
								    <!--文章列表页-->
							        <?php $cid = $vo['tid']; $lists = sp_sql_posts_paged("cid:$cid;order:post_date DESC;",20); ?>
							        <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="n_tp">&nbsp;&nbsp;&nbsp;&nbsp;<a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>"><?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>

								</ul>
							</div>
						</div>
					</div><?php endforeach; endif; else: echo "" ;endif; ?>


				</div>


			</div>
		</div>
		<!--移民流程-->
		<div class="liucheng ">
			<div class="lleft">
				<b>移民<br>流程</b>
			</div>
			<div class="rright">
				<ul>
					<li><a>资金<br>账户</a>
					</li>
					<li class="wu">----</li>
					<li><a>准备<br>材料</a>
					</li>
					<li class="wu">----</li>
					<li><a>递交<br>申请表</a>
					</li>
					<li class="wu">----</li>
					<li><a>移民局<br>批准</a>
					</li>
					<li class="wu">----</li>
					<li><a>领事<br>馆面试</a>
					</li>
					<li class="wu">----</li>
					<li><a style="line-height: 38px;">登陆</a>
					</li>
					<li class="wu">----</li>
					<li><a>登陆<br>安家</a>
					</li>
				</ul>
			</div>
		</div>
		<!--成功案例-->

		<!--专家团队-->
		<div class="zj w1024">

			<div class="gwbt" style="margin-bottom:10px; border: none;">
				<strong style="margin-bottom:10px;"><span class="red">移民</span>专家团队</strong>
				<a href="<?php echo ($teamurl); ?>">more</a>
			</div>

	 <div class="vod">
	<div id="move_vod">
		<div id="movecon_vod">
			<div style="width: 4420px; left: -975px;">

			    <!--专家团队列表-->
                <?php $lists = sp_sql_posts_paged("cid:$team_id;order:post_date DESC;"); ?>
                <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>

                    <dl>					
					<dt>
                        <a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" target="_blank" title="<?php echo ($vo["post_title"]); ?>">
                        <img src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" height="233" width="167" title="<?php echo ($vo["post_title"]); ?>" alt="<?php echo ($vo["post_title"]); ?>">
                        </a>
                    </dt>  
					<dd><span><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" target="_blank" title=" Mia">&nbsp;<?php echo ($vo["post_title"]); ?></a></span><?php echo ($vo["post_keywords"]); ?>
					</dd>
					</dl><?php endforeach; endif; else: echo "" ;endif; ?>
												
			</div>
		</div>

		</div>
		</div>
	</div>

		<!--移民资讯-->
		<div id="box2">

			<div class="biao tab" id="biao">

				<div class="biao_show tab_show">
					<!--移民资讯-->
					<div class="biao_cont" style="display:block;">

						<div class="neirong">
							<div class="left">


							<?php $i = 0; ?>
							<?php if(is_array($ymzx_all)): $i = 0; $__LIST__ = $ymzx_all;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vol): $mod = ($i % 2 );++$i; if($i%2 == 1): ?><div class="inner" style="margin-right: 10px;">
									<div class="up">
										<h4><?php echo ($vol["label"]); ?></h4>
										
									</div>
									<?php $cat_id = $vol['cat_id']; $lists = sp_sql_posts_paged("cid:$cat_id;where:recommended=1 || istop=1;order:post_date DESC;",1); ?>
							        <?php if(!empty($lists['posts'])): if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?> 
									<dl>
									<?php if(!empty($smeta['thumb'])): ?><dt><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>">
					                    <img src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" width="135" height="85" alt="<?php echo ($vo["post_title"]); ?>"></a>
					                    </dt><?php endif; ?>
					                    <dd>
					                        <h6><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_title"]); ?></a></h6>
					                        <p><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_excerpt"]); ?></a></p>
					                    </dd>
					                </dl><?php endforeach; endif; else: echo "" ;endif; endif; ?>
                                               

                                    <ul>
	                                    <?php $cat_id = $vol['cat_id']; $lists = sp_sql_posts_paged("cid:$cat_id;order:post_date DESC;",5); ?>
								        <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><i></i><?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>

                                    </ul>
								</div>
								<?php else: ?>


								<div class="inner">
									<div class="up">
										<h4><?php echo ($vol["label"]); ?></h4>
										
									</div>
									<?php $cat_id = $vol['cat_id']; $lists = sp_sql_posts_paged("cid:$cat_id;where:recommended=1 || istop=1;order:post_date DESC;",1); ?>
							        <?php if(!empty($lists['posts'])): if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?> 
									<dl>
									<?php if(!empty($smeta['thumb'])): ?><dt><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>">
					                    <img src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" width="135" height="85" alt="<?php echo ($vo["post_title"]); ?>"></a>
					                    </dt><?php endif; ?>
					                    <dd>
					                        <h6><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_title"]); ?></a></h6>
					                        <p><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_excerpt"]); ?></a></p>
					                    </dd>
					                </dl><?php endforeach; endif; else: echo "" ;endif; endif; ?>
                                               

                                    <ul>
	                                    <?php $cat_id = $vol['cat_id']; $lists = sp_sql_posts_paged("cid:$cat_id;order:post_date DESC;",5); ?>
								        <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><i></i><?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>

                                    </ul>
								</div><?php endif; ?>
								<?php $i = ++$i; endforeach; endif; else: echo "" ;endif; ?>


						</div>

						<div class="right">
							<div class="inner">
								<!--微信平台-->
								<?php echo hook('weixin');?>
							</div>
							<div class="inner">
								<!--移民微博-->  
						        <?php echo hook('weibo');?>
							</div>
						</div>


					</div>
				</div>
			</div>

		</div>

		<p style="height:40px"></p>
		<!--公司荣誉-->
		<div class="teacher_team">
			<div class="biaoti">
				<h2><span class="red">公司</span>荣誉</h2>
			</div>

			<div id="move_vod2" class="scroll_wrap clearfix">
				<div id="lbtn_vod2"><span></span>
				</div>
				<div id="movecon_vod2">
					<div style="width: 2268px; left: -928px;">

	                    <!-- $theme_config['model1_slide']实现动态修改幻灯片的标识 -->
	                    <?php $ry_slides=sp_getslide($theme_config['model18_reputationslide']); ?>
	                    <?php if(is_array($ry_slides)): $i = 0; $__LIST__ = $ry_slides;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><dl>
								<a title="<?php echo ($vo["slide_name"]); ?>">
									<dt><img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" width="176" height="117" alt="<?php echo ($vo["slide_name"]); ?>"></dt>
									<dd></dd>
								</a>
							</dl><?php endforeach; endif; else: echo "" ;endif; ?>

					</div>
				</div>
				<!--movecon_vod end-->
				<div id="rbtn_vod2"><span></span>
				</div>
			</div>
			<!--move_vod end-->
	</div>
	
		

<!--底部开始-->
﻿<!-- 底部代码 -->

<!--在线咨询钩子调用-->
<?php echo hook('consultation1');?>

<link href="/immigration/tpl/immagration/Public/css/common_aojia.css" rel="stylesheet" type="text/css">

<div id="footer">
  <!-- 友情链接 -->
  <div class="friend_link">
  <div class="wrap_center">
      <div class="center">
            <h2><span class="red">友情</span>链接</h2>
      </div>
    </div>
    <div class="con_link">
      <ul>
          <?php $links=sp_getlinks(); ?>
      <?php if(is_array($links)): foreach($links as $key=>$vo): ?><li><a href="<?php echo ($vo["link_url"]); ?>" target="<?php echo ($vo["link_target"]); ?>"><?php echo ($vo["link_name"]); ?></a></li><?php endforeach; endif; ?>  
        </ul>
    </div>
  </div>

<div id="foot">
    <div class="top2">
    <h3><?php echo ($site_name); ?></h3>
  </div>
    <div class="under_con">
      <p>地址:广东省广州市增城华立科技园华立路1号</p>
      <p>广州市越秀区中山一路57号南方铁道大厦十五层1501-1502室 </p>
    <p>咨询电话：020-82905849   020-37634589</p>
    <!-- 备案信息 -->
    <p><?php echo ($site_icp); ?></p>
    <!-- 版权信息、统计代码 -->
    <p><?php echo ($site_copyright); ?> <?php echo ($site_tongji); ?>   </p>
    </div>
    </div>
</div>


<!--统计及客服代码-->

<!--百度统计代码-->

<!--360后台统计数据-->
<script type="text/javascript" src="/immigration/tpl/immagration/Public/js/1105.js"></script>
<script type="text/javascript" src="/immigration/tpl/immagration/Public/js/special.js"></script>

<script type="text/javascript">
//移民国家项目
	$(function(){
	$(".daDiv_left>div").mouseover(function(e) {
	$(".daDiv_left>div").each(function(index, element) {
		$(this).css("background-color","#ededed");
		$(this).find(".daDiv_left_2").css("color","#000");
	});
	var index= $(this).attr("name");		
	$(this).css("background-color","#b30000");
	$(this).find(".daDiv_left_2").css("color","#fff");
	$(".daDiv_right>div").css("display","none");
	$(".daDiv_right>div").eq(index).css("display","block");
	});
	})
</script>
<!--底部轮刷-->
<script type="text/javascript">
	(function(){
		var oMorevod=document.getElementById('movecon_vod2');
		var oUlvod=oMorevod.getElementsByTagName('div')[0];
		var aLivod=oMorevod.getElementsByTagName('dl');
		var oLBtnvod=document.getElementById('rbtn_vod2');
		var oRBtnvod=document.getElementById('lbtn_vod2');
		var timervod=null;
		var iNum=0;
	
		oUlvod.innerHTML+=oUlvod.innerHTML;
		var oneWidth=parseInt(getStyle(aLivod[0], 'width'))+13;
		oUlvod.style.width=oneWidth*aLivod.length+'px';
		var iWvod=oneWidth*aLivod.length;
		iNum++;	
		
		doMovevod();	
		function doMovevod(){
			clearInterval(timervod);
			timervod=setInterval(function(){
				if(iNum==aLivod.length/2-1){
					iNum=0;
					oUlvod.style.left=0;
				}else{
					iNum++;	
				}
				startMove(oUlvod,{left:-iNum*oneWidth});
			},3000);
		}
			
		oRBtnvod.onmouseover=function(){
			  this.style.cursor='pointer';		
		 };
		  
		oLBtnvod.onmouseover=function(){
			this.style.cursor='pointer';		
		};	
		  
		oLBtnvod.onclick=function(){
			if(iNum==aLivod.length/2-1){
				iNum=0;
				oUlvod.style.left=0;
			}else{
				iNum++;	
			}
			startMove(oUlvod,{left:-iNum*oneWidth});
		};
		  
		oRBtnvod.onclick=function(){
			if(iNum==0){
				iNum=aLivod.length/2-1;
				oUlvod.style.left=-oUlvod.offsetWidth/2+'px';		
			}else{
				iNum--;	
			}
			startMove(oUlvod,{left:-iNum*oneWidth});
		};
		
		oLBtnvod.onmouseover=oRBtnvod.onmouseover=oMorevod.onmouseover=function(){
			clearInterval(timervod);
		};
		
		oLBtnvod.onmouseout=oRBtnvod.onmouseout=oMorevod.onmouseout=function(){
			doMovevod();
		};	
		
		
		$("#movecon_vod2 dl").mouseenter(function(){
			$(this).addClass("active");	
		});
		
		$("#movecon_vod2 dl").mouseleave(function(){
			$(this).removeClass("active");	
		});	
		
		
		
		
	})();	
	
	function startMove(obj,json,fn){
				clearInterval(obj.timer);
				obj.timer = setInterval(function(){
					 var bStop=true;
					 
					 for(var attr in json){
						  var iCur = 0;
			
						  if(attr == 'opacity'){
							  if( Math.round(getStyle(obj,attr)*100) == 0){
								  iCur = 0;
							  }else{
								  iCur = Math.round(getStyle(obj,attr)*100) || 100;
							  }
						  }else{
							  iCur = parseInt(getStyle(obj,attr)) || 0;
						  }
						  
						  var iSpeed = (json[attr] - iCur)/8;
						  iSpeed = iSpeed>0 ?  Math.ceil( iSpeed ) : Math.floor(iSpeed);					
						
						
						  if(iCur != json[attr]){		
							  bStop = false;
						  }
							  
						  if(attr == 'opacity'){
							  obj.style[attr] = (iCur + iSpeed)/100;
							  obj.style.filter = 'alpha(opacity='+(iCur + iSpeed)+')';
						  }else{
							  obj.style[attr] = iCur + iSpeed + 'px';
						  }					 
					 }
					 
					 if(bStop){
						 clearInterval(obj.timer);
						 if(fn){
						  	fn.call(obj);
						  }
						 
					}
				},15);
			}
			
			function getStyle(obj,attr){
				if(obj.currentStyle){
					return obj.currentStyle[attr];
				}else{
					return getComputedStyle(obj,false)[attr];
				}
	}
</script>

<!--精英团队--> 
<script language="javascript" type="text/javascript"> 
         var hsp = new HScrollPanel(); 
         hsp.width = 450; 
         hsp.delay = 30; 
         hsp.Bind("divHScroll"); 
      </script>
  <script type="text/javascript">
   
    var oMovevod=document.getElementById('movecon_vod');
    var oDivod=oMovevod.getElementsByTagName('div')[0];
    var aDlvod=oMovevod.getElementsByTagName('dl');
    var timer=null;
    var iNum=0;
    
    oDivod.innerHTML+=oDivod.innerHTML;
    var iW=aDlvod[0].offsetWidth*aDlvod.length;
    var iWidth=aDlvod[0].offsetWidth;
    oDivod.style.width=iW+'px';
    
    function doMovevod(){
        clearInterval(timer);
        timer=setInterval(function(){
            var iLeft=oDivod.offsetLeft-5;
            
            if(iLeft<=-iW/2){
                iLeft=0;
            }
            
            if(iLeft%iWidth==0&&iLeft!=0){
                clearInterval(timer);
                iNum++;
                
                setTimeout(doMovevod,2000);     
            }
            
            oDivod.style.left=iLeft+'px';
        },100); 
    }
    doMovevod();
    oMovevod.onmouseover=function(){
        clearInterval(timer);   
    };  
    
    oMovevod.onmouseout=function(){
        doMovevod();
    };  
</script> 
</body>
</html><!DOCTYPE html>