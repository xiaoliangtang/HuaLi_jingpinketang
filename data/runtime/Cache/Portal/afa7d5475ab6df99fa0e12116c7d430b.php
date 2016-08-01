<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0023)http://www.immi.cn/usa/ -->
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=8">
    <meta name="renderer" content="webkit"> 
    <title><?php echo ($name); ?> <?php echo ($seo_title); ?> <?php echo ($site_name); ?></title>
    <meta name="keywords" content="<?php echo ($seo_keywords); ?>">
    <meta name="description" content="<?php echo ($seo_description); ?>">
    <link href="/immigration/tpl/immagration/Public/css/category_usa.css" rel="stylesheet" type="text/css">
    <!--<base target="_blank">-->
    <base href="." target="_blank">
    <link rel="stylesheet" href="/immigration/tpl/immagration/Public/css/1001.css" type="text/css" charset="utf-8">
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

<!--栏目导航开始-->
    <div class="wrap w1024">
	<div class="sec_nav">
    	<div class="left1">
        	<h1>美国移民</h1>
            <p>US Immigration</p>
        </div>
        <div class="right">
        	<ul>
    
            </ul>
        </div>
    </div>
<!--栏目导航结束-->
     


<div class="usa_top">
   
<!--幻灯片-->  	
<!--banner-->
    <div class="banner-wrap1">
    		<div class="banner" id="banner">

                <div class="banner_show" id="banner_show">
                    
                    <!-- $theme_config['model1_slide']实现动态修改幻灯片的标识 -->
                    <?php $ymzx_slides=sp_getslide($theme_config['model4_usymslide']); ?>

                    <?php if(is_array($ymzx_slides)): foreach($ymzx_slides as $key=>$vo): ?><img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" title="<?php echo ($vo["slide_name"]); ?>" _link="<?php echo ($vo["slide_url"]); ?>" width="604" height="290" alt="<?php echo ($vo["slide_name"]); ?>"><?php endforeach; endif; ?>
                   
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
    </div>


<div class="zho">
    <!--文章列表页-->
        <?php $lists = sp_sql_posts_paged("cid:$cat_id;where:recommended=1 || istop=1;order:post_date DESC;",1); ?>
        <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
            <?php if(!empty($lists['posts'])): ?><h3><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_title"]); ?></a></h3>
    			<p><a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><?php echo ($vo["post_excerpt"]); ?></a></p><?php endif; endforeach; endif; else: echo "" ;endif; ?>
										          	
			
			<ul>
                <?php $lists = sp_sql_posts_paged("cid:$cat_id;order:post_date DESC;",5); ?>
                <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>
		    	     <li>
                        <a href="<?php echo leuu('article/index',array('id'=>$vo['tid']));?>" title="<?php echo ($vo["post_title"]); ?>"><i></i><?php echo ($vo["post_title"]); ?></a>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>                                            
		    </ul>
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


<!--EB-5投资项目-->
<div class="rx w1024">
    <div class="gwbt" style="margin-bottom:10px;">
        <strong style="margin-bottom:10px;"><span class="red">EB-5投资</span>项目</strong>
        <a href="<?php echo ($eb5url); ?>">more</a>
    </div>
    <div class="cen">
    	 <div class="example">
         <img src="/immigration/tpl/immagration/Public/images/usa_1.jpg" width="364" height="250" title="EB-5投资" alt="EB-5投资">
		
        </div>
        <div class="tiaojian">
           	<h3>移民条件： <a href="<?php echo ($eb5url); ?>">更多</a></h3>
            <ul class="lf">  	
        		<li><i></i>申请人需年满18周岁，申请排期2年；</li>
        		<li><i></i>通过官方文件，证明资金的合法来源；</li>
        		<li><i></i>证明申请人有足够的资金（可包括配偶的资产，继承、赠与、博彩也被认可）；</li>
        		<li><i></i>应有相关部门的健康和无犯罪记录的证明。</li>	    	
            </ul>
        </div>
        <div class="tiaojian">
        <h3>申请流程：<a href="<?php echo ($eb5url); ?>">更多</a></h3>
         <ul class="lf">    	
            <li><i></i>认购项目</li>
        	<li><i></i>存入投资款到监管账户</li>
        	<li><i></i>律师递交I-526移民申请表</li>
        	<li><i></i>美国移民局批准I-526</li>
        	<li><i></i>广州领事馆面试或免面试——登录（得到签证后的180天内）</li>
            <li><i></i>由一般合伙人监督并向移民局报告进度</li>
            <li><i></i>由律师向移民局提出I-829申请取消签证条件</li>
            <li><i></i>投资人可申请成为美国公民</li>
        </ul>
        </div>  
    </div>
</div>	


<p style="height:95px"></p>


<div class="rx w1024">

    <div class="cen">
         <div class="example">
         <img src="/immigration/tpl/immagration/Public/images/usa_2.jpg" width="364" height="250" title="EB-5投资" alt="EB-5投资">
        
        </div>
        <div class="tiaojian">
            <h3>项目优势： <a href="<?php echo ($eb5url); ?>">更多</a></h3>
            <ul class="lf">     
                <li><i></i>申请条件宽松：无年龄、经商、学历、英语能力等要求；</li>
                <li><i></i>快捷：约12-15个月办成，是获得美国永久移民身份的最快方式；</li>
                <li><i></i>无移民监：申请人只需每半年入境美国一次，便可维持绿卡的有效性；</li>
                <li><i></i>材料准备简单、快捷；</li>  

                <li><i></i>子女免费就读美国公立名校；</li>
                <li><i></i>可自由选择居住地；</li>
                <li><i></i>投资50万美元，5年期满返还本金；</li>          
            </ul>
        </div>
        <div class="tiaojian">
        <h3>优质项目推荐：<a href="<?php echo ($eb5url); ?>">更多</a></h3>
         <ul class="lf">        
            <li><i></i>New Empire Development LLC 新帝国</li>
            <li><i></i>Thompson B EB-5 Manager, LLC.汤姆森教育中心项目</li>
            <li><i></i>Lam’s American Dream美国林氏酒店投资项目</li>
        </ul>
        </div>  
    </div>
</div>


<!--L1投资项目-->

<!--banner广告条-->
<p style="height:80px"></p>

<!--专家团队-->
<div class="zj w1024">

    <div class="gwbt" style="margin-bottom:10px; border: none;">
        <strong style="margin-bottom:10px;"><span class="red">移民</span>专家团队</strong>
        <a href="<?php echo ($teamurl); ?>">more</a>
    </div>
   
 <div class="vod">
	<div id="move_vod">
		<div id="movecon_vod">
			<div style="width: 4420px; left: -2040px;">
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
<!--底部结束-->

<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?7f31ed826facf8a5472b3aef79fc7e44";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<script type="text/javascript" src="/immigration/tpl/immagration/Public/js/jquery.luara.0.0.1.min.js"></script>
<script type="text/javascript" src="/immigration/tpl/immagration/Public/js/special.js"></script>
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