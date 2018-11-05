<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>选择在线支付方式 - 东东商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/order_buy_confirm.css">
</head>
<body>

<div class="page-main">
     	<div class="ordermassage">
               <li>
              		<span>订单号：</span>
             	 	<span> ${order.orderNumber }</span>
            	</li>
            	
            	<li>
              		<span>商品名称：</span>
              		<span>
                		<c:forEach items="${orderProducts}" var="orderProduct">
                		<img src="${ctximg}/${orderProduct.picImg}" alt="${shoppingCart.name}" width="30" height="30"> 
                		 ${orderProduct.name}&nbsp;
                		 ${orderProduct.productSpecName} <br>
                		</c:forEach>
             		 </span>
           		 </li>
           		 
           		 <li>
              		<span>收货信息：</span>
              		<span> 
              			${orderShipment.userName} ${orderShipment.userPhone}&nbsp;&nbsp;
                		&nbsp;&nbsp;${orderShipment.userAdress}
                	</span>
            	</li>
            	</div>
            	
            	<div class="put-succeed">
           			 <h2 class="title">订单提交成功,我们将尽快为您发货！</h2>
           	 			<span class="goshopping"><a   href="javascript:void(0);" onclick="goshopping()">继续购物</a></span>
            			<span class="orderlist"><a href="${ctx}/buy/list">查看订单</a></span>
 	 			</div>
     	</div>
</div>
<myfooter>
	  	    <script src="${ctxsta}/os/js/order_buy_confirm.js"></script> 
</myfooter>
</body>
</html>