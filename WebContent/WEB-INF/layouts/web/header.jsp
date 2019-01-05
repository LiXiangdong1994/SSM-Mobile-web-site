<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<link rel="stylesheet" href="${ctxsta}/os/css/default.css">
</head>
<body>
<!--导航栏  -->
<div class="main-top1">	
   <c:if test="${empty user.userNumber}">
 			<div class="main-top1-left"> 
   					<li class="li1"><a rel="nofollow" class="link" href="${ctx}/pass/login">登录</a></li>
   					<li class="li1"><a href="${ctx}/pass/register">注册</a></li>  
   					<li class="li1"><a href='${ctx}/index'>首页</a></li>
   					<li class="li1"><a href="#">手机版商城</a></li>    					
			</div>
		</c:if>
		 <c:if test="${not empty user.userNumber}">
			<div class="main-top1-left"> 
   					<li class="li1" style="font-size:20px;color:#636363;"><span class="name">${user.userName}</span>&nbsp;&nbsp;</li>
   					<li class="li1"><a rel="nofollow" href="${ctx}/pass/logout">退出登录</a></li>  
   					<li class="li1"><a href='${ctx}/index'>首页</a></li>
   					<li class="li1"><a href="#">手机版商城</a></li>   
   					<li class="li1"><a href="${ctx}/root/productlist" target="_blank";>后台管理</a></li>  					
			</div>
			<div class="main-top1-right">
				<li class="li2">
					<a href="${ctx}/pass/user_message" target="_blank">我的商城</a>
					<div class="dropdownlist">
						<a href="user_show_userDetails.action">个人资料</a>
      					<a href="order_finduserid.action">已买的商品</a>     					
    				</div>
				</li>
				<li class="li2"><a href="${ctx}/cart/list">购物车</a></li> 
			<li class="li2">
			 	<a href="#nowhere">收藏夹</a> 
				<div class="dropdownlist">
					<a href="user_show_userDetails.action">收藏的店铺</a>
      				<a href="order_finduserid.action">收藏的商品</a>     					
    			</div>
    		</li>
    		
    		
    		<li class="li2">
            <a href="${ctx}/buy/list">订单</a> 
            </li>
            <li class="li2">
            <a href="#nowhere">卖家中心</a> 
            <div class="dropdownlist">
					<a href="user_show_userDetails.action">免费开店</a>
      				<a href="order_finduserid.action">体检中心</a>     					
    			</div>
    		</li>
    		<li class="li2">
    		<a href="#nowhere">联系客服</a>
    		  <div class="dropdownlist">
					<a href="user_show_userDetails.action">消费者客服</a>
      				<a href="order_finduserid.action">卖家客服</a>     					
    			</div>
    		</li>
            <li class="li2">
				<a href="#">网站导航</a>
				<div class="dropdownlist">
					<a href="#">主题市场</a>
      				<a href="#">特色市场</a>
      				<a href="#">阿里APP</a>
      				<a href="#">精彩推荐集</a>       					
    			</div>
			</li>
			</div>
			</c:if>
 		</div>
</body>
</html>