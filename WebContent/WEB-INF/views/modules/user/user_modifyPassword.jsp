<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>修改密码 - 东东商城</title>
<meta name="author" content="东东Morning. - 毕业设计" /><!--告诉搜索引擎你的站点的制作的作者  -->
<meta name="keywords" content="东东商城,东东Morning,东东公益商城,公益,电子商城,东东社区,公益商城,在线购物,社会责任"><!--keywords： 向搜索引擎说明你的网页的关键词 -->
<meta name="description" content="东东Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。"><!--description：  告诉搜索引擎你的站点的主要内容-->
<link rel="shortcut icon" href="${ctximg}/default/ico/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body>
<div style="font-size: 25px;margin-left: 100px;">
	<div style="margin-top: 50px;">
  		请输入原密码：<input name="password" id="password" type="password" style="height: 25px; width: 200px"/><br>
 		请输入新密码：<input name="newpassword"  id="newpassword"  type="password" style="height: 25px;  width: 200px" />
 	</div>
 	<div class="actions" style="margin-top: 20px;"> 
       <a href="javascript:void(0);" class="modify" style="margin-left: 180px;">确认修改</a> 
    </div>
</div>
<myfooter>
	<script src="${ctxsta}/common/jquery/jquery-2.1.4.min.js"></script> 
	<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script> 
	<script src="${ctxsta}/os/user/js/register.js"></script> 
</myfooter>
</body>
</html>
