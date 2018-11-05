<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>成功加入购物车 - 东东商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/buy-success.css">
</head>
<body>


<div class="page-main">
      <div class="top">
        <div class="goods-img"> 
        	<a href="${ctx}/detail/${product.productNumber}"><img src="${ctximg}/${product.picImg}" title="${product.name}" width="200" height="180"> </a>
        </div>
        <div class="goods-info">
         <span class="name" style="font-size: 20px;">${product.name}
          <h3 style="margin-left: 100px;font-size: 30px;color: red;">已成功加入购物车！</h3>
        </div>
      </div>
      <div class="bottom">
       	<a href="${ctx}/index" class="btn btn-line-gray" >继续购物</a>
       	<a href="${ctx}/cart/list" class="btn btn-primary">去购物车结算</a> 
       </div>
</div>
</body>
</html>