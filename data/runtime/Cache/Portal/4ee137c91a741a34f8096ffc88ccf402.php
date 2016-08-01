<?php if (!defined('THINK_PATH')) exit(); function _sp_get_path($cid,$title=''){ $term = sp_get_term($cid); $html="<a href=\"/immigration\">首页</a> <span class=\"divider\">/&nbsp;</span>"; $parent = sp_get_term($term['parent']); if($parent){ $url=UU('portal/list/index',array('id'=>$term['parent'])); $html.="<a href=\"$url\">".$parent['name']."</a> <span class=\"divider\">/&nbsp;</span>"; } $fparent = sp_get_term($parent['parent']); if($fparent){ $url=UU('portal/list/index',array('id'=>$term['fparent'])); $html.="<a href=\"$url\">".$fparent['name']."</a>"; } if(empty($title)){ $html.="<a class=\"active\">".$term['name']."</a>"; }else{ $url=UU('portal/list/index',array('id'=>$cid)); $html.="<a href=\"$url\">".$term['name']."</a><span class=\"divider\">&nbsp;/&nbsp;</span>"; $html.="$title"; } echo $html; } function _sp_get_pid($id){ $data = M('term_relationships')->where(array('tid'=>$id))->field('term_id')->select(); $pid = $data[0]['term_id']; return $pid; } ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0045)http://www.immi.cn/activity/20151009/547.html -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="”renderer”content=”webkit|ie-comp|ie-stand”">
  <meta http-equiv="X-UA-Compatible" content="IE=8">

  <title><?php echo ($post_title); ?> <?php echo ($site_name); ?></title>
  <meta name="keywords" content="<?php echo ($post_keywords); ?>">
  <meta name="description" content="<?php echo ($post_excerpt); ?>">
  <link rel="stylesheet" href="/immigration/tpl/immagration/Public/css/show_ajbaili_usa.css" type="text/css" <base="" target="_blank"> 
  <!--阻止IE下报错JS-->
  <script src="/immigration/tpl/immagration/Public/js/hm.js"></script>
  <script charset="utf-8" src="/immigration/tpl/immagration/Public/js/b.js"></script>
  <!--<script charset="utf-8" src="/immigration/tpl/immagration/Public/js/lxb.js"></script>-->
  <script>window.onerror=function(){return true;}</script>
  <link rel="stylesheet" href="/immigration/tpl/immagration/Public/css/1001.css" type="text/css" charset="utf-8">
  <script type="text/javascript" charset="utf-8" src="/immigration/tpl/immagration/Public/js/bpa.js"></script>
  <script src="/immigration/tpl/immagration/Public/js/logger.js"></script>
  <link href="/immigration/tpl/immagration/Public/css/bdsstyle.css" rel="stylesheet" type="text/css">
</head>

<body>

<!--分享代码-->


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
   
<div class="wrap">
	<!--主体开始-->
<div class="container">
		<!--广告条-->
	
<div class="wrap" style="margin-top: 40px;">
<div class="container">	
  <div class="contentbox">
       <!--左边开始-->
    	<div class="sideLeft">
          <!--面包屑导航-->
        	<div id="CL_top">
        		  <div class="lan">
                <?php $pid = _sp_get_pid($_GET['id']);_sp_get_path($pid,$post_title); ?>  
              </div>         
          </div>
       <!--主体内容-->
          <div class="main">
             <h1 id="CLM_one"><?php echo (msubstr($post_title,0,25)); ?></h1>
             <div id="CLM_two">
             <span style="float:left">
             <?php if(!empty($post_source)): ?>信息来源：<?php echo ($post_source); endif; ?>
             &nbsp;&nbsp;发布时间:<?php echo ($post_date); ?></span>
             </div>

          <?php if(!empty($post_excerpt)): ?><div id="CLM_three">
            <div id="CLMT_A">           
                  <span class="lilit">摘 要：</span>
                  <p><?php echo ($post_excerpt); ?></p>
            </div>
          </div><?php endif; ?>

          <?php if(!empty($post_keywords)): ?><div id="CLM_three1">
            <div id="CLMT_A1">
              <span class="lilit">关键字：</span>
              <p><?php echo ($post_keywords); ?></p>
            </div>
          </div><?php endif; ?>

          <div class="center_main">
            <?php echo ($post_content); ?>
          </div>
          

<!--分享开始-->
          <div class="text-c" id="pages"></div>
          <?php echo hook('share');?>
             
          <div style="margin-top:-20px">
            <div class="text-c" id="pages"></div>
            <div id="CLMF_left">
              <?php if(!empty($prev)): ?>上一篇：<a href="<?php echo U('article/index',array('id'=>$prev['tid']));?>"><?php echo ($prev['post_title']); ?></a><?php endif; ?>
            </div>       
           
            <div id="CLMF_right">
              <?php if(!empty($next)): ?>下一篇：<a href="<?php echo U('article/index',array('id'=>$next['tid']));?>"><?php echo ($next['post_title']); ?></a><?php endif; ?>
            </div>         
          </div>

          <!--资讯评估-->
          <div class="btonbox">
              <?php if(is_array($zpnavs)): foreach($zpnavs as $key=>$vo): ?><div class="bton"><a href="<?php echo ($vo["href"]); ?>"><?php echo ($vo["label"]); ?></a></div><?php endforeach; endif; ?>
          </div>

          <!--置顶资讯-->
          <?php $listss = sp_sql_posts_paged("cid:$activitymenuid,$newsid;where:istop=1;order:post_date DESC",6); ?>
          <?php if(!empty($listss['posts'])): ?><div class="other">
            	<div class="other_main">

                	<div class="other_tit">
                    <h2>置顶资讯</h2>
                  </div>
                  <ul class="lisclass">
                    <!--文章列表页-->
                    <?php if(is_array($listss['posts'])): $i = 0; $__LIST__ = $listss['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
                        <li>
                           <a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>" target="_blank"><?php echo ($vo["post_title"]); ?></a>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
              </div>
            </div><?php endif; ?>


    </div>

</div>
            <!--左边结束-->
		<div class="sideRight">
            <!--内容页轮播图-->
      <div class="logfocus1">
          <div class="sArea1">
            <!-- $theme_config['model1_slide']实现动态修改幻灯片的标识 -->
            <?php $article_slides=sp_getslide($theme_config['model7_slide']); ?>
            <ul>
            <?php if(is_array($article_slides)): foreach($article_slides as $key=>$vo): ?><li>
                <?php if(!empty($vo['slide_url'])): ?><a href="<?php echo ($vo["slide_url"]); ?>">
                  <img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" width="304" height="206" title="<?php echo ($vo["slide_name"]); ?>" alt="<?php echo ($vo["slide_name"]); ?>">
                  </a>
                <?php else: ?>
                  <img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" width="304" height="206" title="<?php echo ($vo["slide_name"]); ?>" alt="<?php echo ($vo["slide_name"]); ?>"><?php endif; ?>
              </li><?php endforeach; endif; ?>
            </ul>
          </div>
          <ul class="num_dd1">
            <?php if(is_array($article_slides)): foreach($article_slides as $key=>$vo): ?><li class=""></li><?php endforeach; endif; ?>
          </ul>    
      </div>    
    <!--轮播图 end-->
      <!--推荐资讯--> 
      <?php $listss = sp_sql_posts_paged("cid:$activitymenuid,$newsid;where:recommended=1;order:post_date DESC",8); ?>
      <?php if(!empty($listss['posts'])): ?><div class="anli">
          <h2><span class="red">推荐</span>资讯</h2>
          <div class="layout1_down">
          <!--文章列表页-->
              <ul class="ai">
              <?php if(is_array($listss['posts'])): $i = 0; $__LIST__ = $listss['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
                  <li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
              </ul>
          </div>
          </div><?php endif; ?>

			<!--最新资讯--> 
      <?php $listss = sp_sql_posts_paged("cid:$activitymenuid,$newsid;order:post_date DESC;",8); ?>
      <?php if(!empty($listss['posts'])): ?><div class="anli">
    			<h2><span class="red">最新</span>资讯</h2>
    			<div class="layout1_down">
              <ul class="ai">
                  <?php if(is_array($listss['posts'])): $i = 0; $__LIST__ = $listss['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
                 	<li><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>" alt="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
              </ul>
          </div>
  			</div><?php endif; ?>
		
       <!--微信平台-->  
        <?php echo hook('weixin');?>


			 <!--移民微博-->  
        <?php echo hook('weibo');?>
 

      </div>
		</div>
  </div>
</div>
</div>
</div>
  
<!--第一板块结束-->
<!--轮播图1-->

<script type="text/javascript">
var num1,h=0,wid1
function autoplay1() {
    h++
    if(h>=num1) h = 0
    $($(".logfocus1 .num_dd1 li")[h]).addClass("current1")
    $($(".logfocus1 .num_dd1 li")[h]).siblings().removeClass("current1")
    $($(".logfocus1 .sArea1 li")[h]).siblings().hide()
    $($(".logfocus1 .sArea1 li")[h]).fadeTo(500,1)
}
$(function(){
   num1 = $(".logfocus1 .sArea1 img").size()
   $(".logfocus1 .num_dd1 li:first").addClass("current1")
   $(".logfocus1 .sArea1 li:first").fadeTo(300,1)
   $(".logfocus1 .num_dd1 li").hover(
      function(){
          window.clearInterval(wid1)
          $(this).addClass("current1")
          $(this).siblings().removeClass("current1")
          h =  $(this).index()
          $($(".logfocus1 .sArea1 li")[h]).siblings().hide()
          $($(".logfocus1 .sArea1 li")[h]).fadeTo(500,1)
       },
       function(){wid1 = window.setInterval("autoplay1()",3000)}
      )
   wid1 = window.setInterval("autoplay1()",3000)
})
  </script> 
  <!--选项卡-->
 <script type="text/javascript">
$('.tab_box').each(function(i,v){
    var $v = $(v).find('.tab_tit');
    
    $v.mouseenter(function() {
       $(this).addClass('active').siblings('.tab_tit').removeClass('active').removeClass('on');
       $(v).find('.tab_con').hide().eq($(this).index()).stop().fadeIn(600);
    });
});
</script>
<!--底部文件 开始-->
<!-- 底部代码 -->

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

</body>
</html>