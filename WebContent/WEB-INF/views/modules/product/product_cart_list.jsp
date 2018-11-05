<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/layouts/base.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>购物车</title>
<link type="text/css" rel="stylesheet" href="${ctxsta}/os/css/购物车.css">
<script src="${ctxsta}/os/js/购物车.js"></script>
<script src="${ctxsta}/common/jquery/jquery-3.2.0.min.js"></script> 
</head>
<body>
<center>
<div>
			<c:if test="${not empty sessionScope.cart.shoppingCartVOs}">
    <table  class="table table-hover" id="cartTable">  
        <tr>  
        	
            <th class="th1"><input type="checkbox" class="all_check" style="width:50px; height:25px;">全选</th>  
            <th class="th2">商品名称</th>  
            <th class="th2">单价</th>  
            <th class="th2">数量</th>  
            <th class="th2">金额</th>  
            <th class="th2">操作</th>  
        </tr>  
         
		<c:forEach items="${sessionScope.cart.shoppingCartVOs}" var="shoppingCart">
           
            <tr class="tr2" data-sid="${shoppingCart.productSpecNumber}">  
                <td class="td1" ><input type="checkbox" style="width:50px; height:25px;"name="ids" value="false" class="son_check"  data-initial="true" data-sid="${shoppingCart.productSpecNumber}" data-check-status="1"/></td>  
                <td class="td2">
                	<a href="${ctx}/detail/${shoppingCart.productNumber}" target="_blank">
              			<img src="${ctximg}/${shoppingCart.picImg}" alt="${shoppingCart.name}" style="height: 150px;"/></a>
               			<a href="${ctx}/detail/${shoppingCart.productNumber}" target="_blank">
               			<span>${shoppingCart.name}
                			<c:forEach items="${shoppingCart.specificationName}" var="specificationName">&nbsp;${specificationName}</c:forEach>
                		</span>
                	</a>
                </td>  
                <td class="td3" id="price" ><p>${shoppingCart.price}</p></td>
                <td class="td3" id="amount_box">
              		<div class="change-goods-num ">
              		 <p>
             	  		<a href="" class="reduce">-</a>
                  		<input class="count-input " type="text" value="${shoppingCart.buyNumber}" readonly/>
                  		<a href="" class="add">+</a>
                    </p>
                   </div>
				</td>  			
                <td class="td4" id="sum_price" >
					<p>${shoppingCart.buyNumber * shoppingCart.price}</p>
				</td>  
                <td class="td4">
					<div class="col-action">
              			 <p>
              			<a href="javascript:void(0);" title="删除" class="del J_delGoods"  data-sid="${shoppingCart.productSpecNumber}" onclick="cart_list_delete(this,${shoppingCart.productSpecNumber})">
              				<i class="glyphicon glyphicon-remove"></i>
             			</a> 
             		 	</p>
             		</div>
				</td>                
            </tr>  
               </c:forEach>
              </table> 
               <div class="jiesuan"> 
				 	<div class="bar-right">
						<span class="piece">已选商品<strong class="piece_num" style="color:red">0</strong>件</span>
						<span class="totalMoney">共计: <strong class="total_text" name="total_text"  style="color:red">0.00</strong></span>
						<span class="calBtn"><a href="javascript:void(0);"  class="btn-primary" id="J_goCheckout" onclick="J_goCheckout();">结算</a></span>
					</div>
				</div> 
				</c:if>
				<c:if test="${empty sessionScope.cart.shoppingCartVOs}">
					<div class="others" style="font-size: 30px;">
						<span style="color: red">当前购物车无商品哦</span>
						<span class="other"><a href="javascript:void(0);" class="go" onclick="go()" >立即去购买？</a></span>
					</div>
				</c:if>
  </center>

</body>
</html>