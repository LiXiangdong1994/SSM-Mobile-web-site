<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/layouts/base.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>购物车</title>
<link type="text/css" rel="stylesheet" href="${ctxsta}/os/css/订单.css">

<script src="${ctxsta}/common/jquery/jquery-3.2.0.min.js"></script> 
	<script src="${ctxsta}/os/js/订单.js"></script>
</head>
<body>
<center>
		<div class="top">
           <p class="p1">订单号</p>
           <p class="p2">商品名称</p>
           <p class="p2">数量</p>
           <p class="p2">金额</p>
           <p class="p2">共计</p>
           <p class="p2">操作</p>
         </div>
          <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
     	<c:forEach items="${orderVOs}" var="orderVO">
     		<div class="bottom" data-sia="${orderVO.orderId}">
                  		<div class="orderNumber"><p class="p3">${orderVO.orderNumber}</p></div>
                		<c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                		<div class="param">
                			<p  class="p4">
                		 		<img src="${ctximg}/${orderProduct.picImg}" alt="${shoppingCart.name}" width="30" height="30"> 
                		 		${orderProduct.name}&nbsp;
                		 		${orderProduct.productSpecName} <br>
                		 	</p>
							<p class="p4 p5">${orderProduct.buyNumber}</p>
							<p class="p4 p6">${orderProduct.productAmount}</p>
						</div>
                	</c:forEach>
                		<p class="p7">${orderVO.payAmount}</p>
              		 		<a id="J_cancelOrder" title="取消订单"  onclick="order_list_delete(this,${orderVO.orderId})">
              					<i class="glyphicon glyphicon-remove"></i>
             				</a> 
             		 	
         	</div>
         	 <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
    	</c:forEach>
  </center>

</body>
</html>