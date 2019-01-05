<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>东东商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/购物样式.css">
<link rel="stylesheet" href="${ctxsta}/os/css/index.css">
</head>
<body>
<div class="search">
		
		<div id="J_recommend_search">
		</div>
<div style="width:1300px;margin-left: 120px;" class="site_header">
	<!-- 左边列表 -->
	<jsp:include page="/WEB-INF/views/modules/common/site_header.jsp" />
	
	</div>
		<!--     主产品  begin    -->
	<div class="page-main home-main" style="margin-left:100px;">
		<div class="container-fluid">
			<div class="row">
					<div id="J_hotCategory" class="home-recm-box home-brick-box xm-plain-box">
				</div>
				
			</div>
		</div>
	</div>
</div>
	<myfooter> <script src="${ctxsta}/os/js/index.js"></script>
	</myfooter>
</body>
</html>