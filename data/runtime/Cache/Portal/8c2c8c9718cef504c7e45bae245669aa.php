<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0027)http://www.immi.cn/special/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta name="renderer" content="webkit"> 
    <title><?php echo ($name); ?> <?php echo ($seo_title); ?> <?php echo ($site_name); ?></title>
    <meta name="keywords" content="<?php echo ($seo_keywords); ?>">
    <meta name="description" content="<?php echo ($seo_description); ?>">
    <link href="/immigration/tpl/immagration/Public/css/special.css" rel="stylesheet" type="text/css">
    <script src="/immigration/tpl/immagration/Public/js/hm.js"></script>
    <script charset="utf-8" src="/immigration/tpl/immagration/Public/js/b.js"></script>
    <!--<script charset="utf-8" src="/immigration/tpl/immagration/Public/js/lxb.js"></script>-->
    <script type="text/javascript" src="/immigration/tpl/immagration/Public/js/jquery.min.js"></script>
    <script type="text/javascript" src="/immigration/tpl/immagration/Public/js/special.js"></script>
</head>

<body>
<link href="/immigration/tpl/immagration/Public/css/common_aojia.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="/immigration/favicon.ico"> 
<script type="text/javascript" src="/immigration/tpl/immagration/Public/js/jquery.min.js"></script>
<!-- <script type="text/javascript" src="http://www.immi.cn/statics/js/main.js"></script> -->
<!--<base target="_blank">-->
<base href="." target="_blank">
<!--阻止IE下报错JS-->
<script>window.onerror=function(){return true;}</script>


<!--头部文件 开始-->
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





<!--头部文件 结束-->

<div class="top_title">
	<h2>最新资讯</h2>
    <div class="right"></div>
</div>

<!--banner-->
    <div class="banner" id="banner">
        <div class="banner_show" id="banner_show">
            
            <!-- $theme_config['model1_slide']实现动态修改幻灯片的标识 -->
            <?php $ymzx_slides=sp_getslide($theme_config['model4_ymslide']); ?>

            <?php if(is_array($ymzx_slides)): foreach($ymzx_slides as $key=>$vo): ?><img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" title="<?php echo ($vo["slide_name"]); ?>" _link="<?php echo ($vo["slide_url"]); ?>" width="1024" height="380" alt="<?php echo ($vo["slide_name"]); ?>" style="display: none;"><?php endforeach; endif; ?>
           
        </div>
        <div class="banner_title_bg"></div>
        <div class="banner_title" id="banner_title">
            <!-- 标题显示 -->
            <h5><a href="" title=""></a></h5>
            <!-- 显示图片轮播进度小圆点 -->
            <ul>
            <?php if(is_array($ymzx_slides)): foreach($ymzx_slides as $key=>$vo): ?><li class=""></li><?php endforeach; endif; ?>
            </ul>
        </div>

        <div></div>
        <div class="banner_btnl" id="banner_btnl"></div>
        <div class="banner_btnr" id="banner_btnr"></div>
    </div>



<!--part01--> 
<?php if(is_array($ymzx_all)): $i = 0; $__LIST__ = $ymzx_all;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div class="part">
	<div class="title01">
    	<div class="left"><span>美国</span><?php echo ($v["label"]); ?></div>
        <div class="right"><a href="<?php echo ($v["href"]); ?>">more</a></div>
    </div>


    <!--文章列表页-->
    <?php $cat_id = $v['cat_id']; $lists = sp_sql_posts_paged("cid:$cat_id;where:recommended=1 || istop=1;order:post_date DESC;",3); ?>
    <?php if(!empty($lists['posts'])): ?><div class="tuwen">
        <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
    	        <dl>
                <?php if(!empty($smeta['thumb'])): ?><dt><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><img src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" width="315" height="155" alt="<?php echo ($vo["post_title"]); ?>"></a>
                    </dt><?php endif; ?>
                    <dd>
                        <h3><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_title"]); ?></a></h3>
                        <p><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_excerpt"]); ?></a></p>
                    </dd>
                </dl><?php endforeach; endif; else: echo "" ;endif; ?>    		         
    </div><?php endif; ?> 

    <ul class="outer">
            <?php $cat_id = $v['cat_id']; $lists = sp_sql_posts_paged("cid:$cat_id;order:post_date DESC;",15); ?>
            <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
    	        <li>
                <a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>">
                <i></i><?php echo ($vo["post_title"]); ?></a>
                </li><?php endforeach; endif; else: echo "" ;endif; ?>
     </ul>
</div><?php endforeach; endif; else: echo "" ;endif; ?>


<!--底部开始-->
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
<!--底部结束-->

</body></html>