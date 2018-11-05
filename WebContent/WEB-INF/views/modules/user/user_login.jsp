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
<link rel="stylesheet" href="${ctxsta}/os/css/登录.css" />
<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body>
<jsp:include page="/WEB-INF/layouts/web/header.jsp" />
 <div style="width: 100%;height: 100px; background-color:white; float: left;" class="div0">
 	<span class="span2"><font>为确保您账户的安全及正常使用，依《网络安全法》相关要求，6月1日起会员账户需绑定手机。如您还未绑定，请尽快完成，感谢您的理解及支持！</font></span>
 </div>
<div style="background:url('${ctxsta}/os/user/images/52.png');" class="div1">
		 <di v class="div2">
			<div class="div3" >
				<font>用户登录&nbsp&nbsp&nbsp</font>
	 			<font><a href="管理员登录.jsp" style="text-decoration: none;color: #5d5d5d;">&nbsp&nbsp&nbsp管理员登录</a></font>
			</div>
	 		<div class="div4" >
	  			<font class="font1">用户名:</font>  
      			<input id="name" type="text" name="loginName" placeholder="手机号码" style="height:35px; width:200px" />
	 		</div>
			<div class="div5" >
	  			<span class="font1">&nbsp&nbsp&nbsp密码: </span>  
      			<input  type="password" id="password" name="loginPassword" style="height:35px;width:200px"/>
	 		</div>
	  		<div class="div7"  >
	  		<input type="button"  id="btn_login"  value="立即登录" "/>
	 		</div>
	 		<div class="div6">
	 			 <span><a href="#" style="text-decoration: none;">忘记密码？</a></span>  
			</div>
	</div>
</div> 
<script src="${ctxsta}/common/jquery/jquery-2.1.4.min.js"></script> 
<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script> 
<script src="${ctxsta}/os/user/js/register.js"></script> 
</body>
</html>