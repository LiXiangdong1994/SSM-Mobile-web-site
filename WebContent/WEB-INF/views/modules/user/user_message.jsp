<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>账户注册 | 东东网 - 毕业设计</title>
<meta name="author" content="东东Morning. - 毕业设计" /><!--告诉搜索引擎你的站点的制作的作者  -->
<meta name="keywords" content="东东商城,东东Morning,东东公益商城,公益,电子商城,东东社区,公益商城,在线购物,社会责任"><!--keywords： 向搜索引擎说明你的网页的关键词 -->
<meta name="description" content="东东Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。"><!--description：  告诉搜索引擎你的站点的主要内容-->
<link rel="shortcut icon" href="${ctximg}/default/ico/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctxsta}/os/css/user_message.css" />
<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body>
<jsp:include page="/WEB-INF/layouts/web/header.jsp" />
 <div id="div1">
		<div class="menu">
       	 <!--router-link 相当于就是超链   to 相当于就是 href-->
        	<p><a href="${ctx}/pass/user_address" target="mainframe">收货地址</a></p>
        	<p><a href="${ctx}/cart/list" target="_blank">购物车</a></p>
        	<p><a href="${ctx}/buy/list" target="_blank">订单</a></p>
        	<p><a href="${ctx}/pass/user_modifyPassword"  target="mainframe" >修改密码</a></p>
    	</div>
    	
    	<!-- 右边主页 -->
		<div class="workingRoom" >
			<iframe  name="mainframe" class="mainframe" frameborder="0" scrolling="no" ></iframe>
		</div>
	</div>

<script src="${ctxsta}/common/jquery/jquery-2.1.4.min.js"></script> 
<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script> 
</body>
</html>