// JavaScript Document
//轮播
$(function(){
	$("#banner_btnl,#banner_btnr").hover(function(){
		$(this).toggleClass("banner_btn");		
	});
	
	var lengthB=$("#banner_show img").length; 
	var iNumB=0;
	var timerB=null;
	
	fnChangeB(0);
	function fnChangeB(iNumB){
		var $onImg=$("#banner_show img").eq(iNumB);
		var linkonImg=$onImg.attr("_link");
		var titleonImg=$onImg.attr("title");
		
		$("#banner_title li").eq(iNumB).addClass("hover").siblings().removeClass("hover");
		$("#banner_show img").not($onImg).hide();
		$onImg.fadeIn(300);
		
		$onImg.parent("a").attr("href",linkonImg);
		$onImg.parent("a").attr("title",titleonImg);
		
		$("#banner_title h5 a").text(titleonImg);
		$("#banner_title h5 a").attr("href",linkonImg);
		$("#banner_title h5 a").attr("title",titleonImg);
	}	
	
	function fnMoveB1(){
		if(iNumB<=0){
			iNumB=lengthB-1;
		}else{
			iNumB--;
		}
		fnChangeB(iNumB);	
	}
	
	function fnMoveB2(){
		if(iNumB>=lengthB-1){
			iNumB=0;
		}else{
			iNumB++;	
		}
		fnChangeB(iNumB);	
	}
	
	$("#banner_btnl").click(function(){
		fnMoveB1();	
	});
	
	$("#banner_btnr").click(function(){
		fnMoveB2();	
	});
	
	
	$("#banner").hover(function(){
		if(timerB){
			clearInterval(timerB);	
		}
	},function(){
		timerB=setInterval(fnMoveB2,3000);		
	}).trigger("mouseleave");
	
	$("#banner_title li").mouseover(function(){
		iNumB=$(this).index();
		fnChangeB(iNumB);	
	});			
});

//国家频道页滑动切换
$(function(){	
		   
	//设计案例切换
	$('.title-list li').mouseover(function(){
		var liindex = $('.title-list li').index(this);
		$(this).addClass('on').siblings().removeClass('on');
		$('.product-wrap div.product').eq(liindex).fadeIn(150).siblings('div.product').hide();
		var liWidth = $('.title-list li').width()+2;
		$('.rx .title-list p').stop(false,true).animate({'left' : liindex * liWidth + 'px'},300);
	});
	
	//设计案例hover效果
	$('.product-wrap .product li').hover(function(){
		$(this).css("border-color","#ff6600");
		$(this).find('p > a').css('color','#ff6600');
	},function(){
		$(this).css("border-color","#fafafa");
		$(this).find('p > a').css('color','#666666');
	});
	
});

//国家频道页滑动切换
$(function(){	
		   
	//设计案例切换
	$('.title-list1 li').mouseover(function(){
		var liindex = $('.title-list1 li').index(this);
		$(this).addClass('on').siblings().removeClass('on');
		$('.product-wrap1 div.product1').eq(liindex).fadeIn(150).siblings('div.product1').hide();
		var liWidth = $('.title-list1 li').width();
		$('.rx .title-list1 p').stop(false,true).animate({'left' : liindex * liWidth + 'px'},300);
	});
	
	//设计案例hover效果
	$('.product-wrap1 .product1 li').hover(function(){
		$(this).css("border-color","#ff6600");
		$(this).find('p > a').css('color','#ff6600');
	},function(){
		$(this).css("border-color","#fafafa");
		$(this).find('p > a').css('color','#666666');
	});
	
});