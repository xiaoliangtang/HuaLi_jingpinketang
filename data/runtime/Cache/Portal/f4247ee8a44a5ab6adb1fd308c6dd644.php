<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0026)http://www.immi.cn/assess/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
  造成360浏览器画廊出错 
  <meta http-equiv="X-UA-Compatible" content="IE=8">
  <meta name="renderer" content="webkit">  
-->	
  <title><?php echo ($name); ?> <?php echo ($seo_title); ?> <?php echo ($site_name); ?></title>
  <meta name="keywords" content="<?php echo ($seo_keywords); ?>">
  <meta name="description" content="<?php echo ($seo_description); ?>">


  <link href="/immigration/tpl/immagration/Public/css/page_about_us.css" rel="stylesheet" type="text/css">
  <link href="/immigration/tpl/immagration/Public/css/project.css" rel="stylesheet" type="text/css">
  <link href="/immigration/tpl/immagration/Public/css/bootstrap.css" rel="stylesheet" type="text/css">
  <link href="/immigration/tpl/immagration/Public/css/imgstyle.css" rel="stylesheet" type="text/css" media="all">
  <link href="/immigration/tpl/immagration/Public/css/swipebox.css" rel="stylesheet" type="text/css">
  <link href="/immigration/tpl/immagration/Public/css/animate.css" rel="stylesheet" type="text/css">
  <!--<link href='http://fonts.useso.com/css?family=Oswald:400,700,300|Open+Sans:300italic,400italic,600italic,400,300,600,700' rel='stylesheet' type='text/css'>-->


  <!--<script charset="utf-8" src="/immigration/tpl/immagration/Public/js/lxb.js"></script>
  <script type="text/javascript" src="/immigration/tpl/immagration/Public/js/assessment_new.js"></script>-->


  <script src="/immigration/tpl/immagration/Public/js/wow.min.js"></script>
  <script>
    new WOW().init();
  </script>
  <!--Light-Box-->
    <script type="text/javascript" src="/immigration/tpl/immagration/Public/js/jquery-1.11.0.min.js"></script>
      <link rel="stylesheet" href="/immigration/tpl/immagration/Public/css/swipebox.css">
      <script src="/immigration/tpl/immagration/Public/js/jquery.swipebox.min.js"></script> 
      <script type="text/javascript">
      jQuery(function($) {
        $(".swipebox").swipebox();
      });
    </script>
      <!--End-Light-Box-->
     <!--Script-for-gallery-Here-->
          <script type="text/javascript" src="/immigration/tpl/immagration/Public/js/jquery.mixitup.min.js"></script>
            <script type="text/javascript">
            $(function () {
              
              var filterList = {
              
                init: function () {
                
                  // MixItUp plugin
                  // http://mixitup.io
                  $('#portfoliolist').mixitup({
                    targetSelector: '.portfolio',
                    filterSelector: '.filter',
                    effects: ['fade'],
                    easing: 'snap',
                    // call the hover effect
                    onMixEnd: filterList.hoverEffect()
                  });       
                
                },
                
                hoverEffect: function () {
                
                  // Simple parallax effect
                  $('#portfoliolist .portfolio').hover(
                    function () {
                      $(this).find('.label').stop().animate({bottom: 0}, 200, 'easeOutQuad');
                      $(this).find('img').stop().animate({top: -30}, 500, 'easeOutQuad');       
                    },
                    function () {
                      $(this).find('.label').stop().animate({bottom: -40}, 200, 'easeInQuad');
                      $(this).find('img').stop().animate({top: 0}, 300, 'easeOutQuad');               
                    }   
                  );        
                
                }
          
              };
              
              // Run the show!
              filterList.init();   
        }); 
  </script>
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

<div class="sur_nav">
  <h2 class="case_logo"><a href="">
    <img src="/immigration/tpl/immagration/Public/images/wonderful_logo.jpg" width="213" height="74" alt="精彩瞬间" title="精彩瞬间"></a>
  </h2>
  <div class="right">
    <ul>
      <!--移民项目-->
      <?php if(is_array($wonderfulchilds)): foreach($wonderfulchilds as $key=>$vo): ?><li><a href="<?php echo ($vo["href"]); ?>"><?php echo ($vo["label"]); ?></a></li><?php endforeach; endif; ?>
      </ul>    
  </div>
</div>

  <!--视频播放-->
  <p style="height:45px"></p>
  <center>
  <div>
    <?php $cid = $theme_config['model19_videoid']; $listvideos = sp_sql_posts_paged("cid:$cid;order:post_date DESC;",1); ?>
        <?php ?>
    <!--如果没有缩略图，则是视频-->
    <?php if(empty($smeta['thumb'])): if(is_array($listvideos['posts'])): $i = 0; $__LIST__ = $listvideos['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; echo ($vo["post_content"]); endforeach; endif; else: echo "" ;endif; endif; ?>
    <p id="videotitle"><?php echo ($vo["post_title"]); ?></p>
    </div>
  </center>

  <!--分页显示-->
  <center>
  <div id="pages" class="text-c" style="margin-left:350px">
      <a class="a1" target="_self"><?php echo ($listvideos['count']); ?>条</a> 

      <?php echo ($listvideos['page']); ?>
  </div> 
  </center>


  <div id="wrap_pg">
  	<!--照片-->
    <div class="container">
      <div class="gallery">
        <!-- portfolio -->
        <div class="portfolio-section" id="portfolio">      
          <!-- head-section -->
          <div class="head-section text-center">
            <h2><?php echo ($site_name); ?>精彩瞬间</h2>
          </div>
          <!-- /head-section -->
          <div id="portfoliolist">

          <?php $cid = $theme_config['model19_imagesid']; $lists = sp_sql_posts_paged("cid:$cat_id,$cid;order:post_date DESC;",24); ?>
          <?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); ?>

            <!--判断是否存在图片，若不存在则不显示-->
            <?php if(!empty($smeta['thumb'])): ?><div class="portfolio card mix_all  wow bounceIn" data-wow-delay="0.4s" data-cat="card" style="display: inline-block; opacity: 1;">
              <div class="portfolio-wrapper grid_box">    
                <a href="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" class="swipebox"  title="<?php echo ($vo["post_title"]); ?>">
                <div width="500px" height="320px">
                  <img width="500px" height="320px" src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" class="img-responsive" alt="">
                   </div>
                  <span class="zoom-icon"> 
                  </span>
                </a>
              </div>
            </div><?php endif; endforeach; endif; else: echo "" ;endif; ?>

          <div class="clearfix"> </div>         
          </div>  


        <!--分页显示-->
        <div id="pages" class="text-c" style="margin-left:200px">
            <a class="a1" target="_self"><?php echo ($lists['count']); ?>条</a> 

            <?php echo ($lists['page']); ?>
        </div>    

    </div>     
  </div>
  <!--照片结束-->

  <!--<script type="text/javascript" src="/immigration/tpl/immagration/Public/js/move-top.js"></script>-->
  <script type="text/javascript" src="/immigration/tpl/immagration/Public/js/easing.js"></script>
  <script type="text/javascript">
            jQuery(document).ready(function($) {
              $(".scroll").click(function(event){   
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
              });
            });
  </script>
  <!--start-smoth-scrolling-->
  <script type="text/javascript">
        $(document).ready(function() {
          /*
          var defaults = {
              containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear' 
          };
          */
          
          $().UItoTop({ easingType: 'easeOutQuart' });
          
        });
  </script>

  <!--<script src="/immigration/tpl/immagration/Public/js/tw_pinggu.js" type="text/javascript"></script> -->

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

</body>
</html>