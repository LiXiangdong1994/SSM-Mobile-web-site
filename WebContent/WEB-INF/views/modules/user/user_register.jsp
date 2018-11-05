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
<link rel="stylesheet" type="text/css" href="${ctxsta}/os/css/注册.css"/>
<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body style="background: url('${ctxsta}/os/user/images/54.png');" >
	<div class="div0">
		<form method="post" id="verifyUser">
		<div class="div1">
			<span class="font2">&nbsp用&nbsp&nbsp户&nbsp&nbsp名：</span>
			<input type="text" name="userName" placeholder="请输入用户名" id="name" style="height:27px; width:170px"/>
			<div id="usernameError"  style="display:inline;  color:red;"></div>
		</div>
		<div class="div7">
			<span class="font2">&nbsp手机号码：</span>
			<input type="phone" name="telephone" placeholder="请输入电话号码" id="phone" style="height:27px; width:170px" />
			<div id="phoneError" style="display:inline;color:red;"></div>
		</div>
		<div class="div2">
			<span class="font2">&nbsp密&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码：</span>
			<input type="password" name="loginPassword" placeholder="请输入密码" id="password" style="height:27px; width:170px" />
			<div id="passwordError" style="display:inline;color:red;"></div>
		</div>
		<div class="div7">
			<span class="font2">&nbsp确认密码：</span>
			<input type="password" placeholder="请再次输入密码" id="againzfpassword" style="height:27px; width:170px" />
			<div id="againzfpasswordError" style="display:inline;color:red;"></div>
		</div>	
		 <div class="div2"> 
		 	<span class="font2">&nbsp验&nbsp&nbsp证&nbsp&nbsp码：</span>
                <input type="text" name="registerCode" maxlength="4" class="btn_part1" tabindex="4" style="width:167px" id="randCode" data-valid="isNonEmpty" data-error="验证码不能为空" />
                <label class="f-size12 c-999 f-fl f-pl10"> <img src="${ctx}/pass/captcha-image.jpg" id="kaptchaImage" /> </label>
            </div>
		<div class="div8">
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="checkbox"  value=1 name="check"  id="check" style="width:30px; heigth:10px"/>我已阅读并接受<a href="#">版权说明和隐私保护条款</a>
		</div>
		<div class="div5">
		    <a href="javascript:;" class="btn btn-blue f-r3" id="btn_part1" name="zhuce">下一步</a>
		</div>	
		</form>
		<div class="div6">	
		<a href="用户登录.jsp">已有帐号?立即登录</a>
		</div>
	</div>
	<script src="${ctxsta}/common/jquery/jquery-2.1.4.min.js"></script> 
<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script> 
	<script src="${ctxsta}/os/user/js/register.js"></script> 
	
</body>
</html>