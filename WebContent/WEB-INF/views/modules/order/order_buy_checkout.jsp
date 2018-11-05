<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>填写订单信息 - 东东商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/order_buy_checkout.css">
</head>
<body>
<div class="page-main">
 <h3 class="title">收货地址</h3>
      <div class="address-section" id="J_addressList">
          <c:if test="${not empty addresses}">
          <c:forEach items="${addresses}" var="address">
               		<div class="addressmassage" 
               			data-address_id="${address.addressId}" data-consignee="${address.userName}"
               		 	data-tel="${address.userPhone}" 	   data-zipcode="${address.userZipcode}" 
               		 	data-address="${address.userAdress}"   data-tag_name="${address.userTag}">
               		<div class="address-name-phone"> 
               			收货人：<span class="address-name-phone-left">${address.userName}</span>(<span class="tag">${address.userTag}</span> )
                		<span class="address-name-phone-right"> ${address.userPhone} </span>
                	</div>
                		<div class="address">
                 			收货地址： ${address.userAdress} (${address.userZipcode}) 
                  		</div>
              	  <div class="actions"> 
              			<a href="javascript:void(0);" class="modify">修改</a> 
              	  		<a class="J_addressDel" href="javascript:void(0);" onclick="address_delete(this,${address.addressId})" data-id="${address.addressId}">删除</a>
              	  </div>
              	  </div>
          </c:forEach>
          </c:if>
          <c:if test="${empty addresses}">
           <div style="margin-left: 400px;font-size: 20px;"><i class="glyphicon glyphicon-plus"></i><a href="javascript:void(0);" class="address-item-new">添加收货地址</a>  </div> 
     	 </c:if>
      </div>
          <div class="address-edit-box">
          	<div class="box-main">
              	<input type="text" id="user_name" name="userName" placeholder="收货人姓名" value="${address.userName}">
              	<input type="text" id="user_phone" name="user_phone" placeholder="11位手机号">
              	<textarea type="text" id="user_address" name="user_adress" placeholder="详细地址，路名或街道名称，门牌号"></textarea>
              	<input type="text" id="user_zipcode" name="user_zipcode" placeholder="邮政编码">
              	<input type="text" id="user_tag" name="user_tag" placeholder="如&quot;家&quot;、&quot;公司&quot;。限5个字内">
          		<div class="form-confirm clearfix">
           	 		<input class="input-text J_addressInput" type="hidden" id="address_id" name="address_id">
            		<a href="javascript:void(0);" class="btn btn-primary" id="J_save" >保存</a> <a href="javascript:void(0);" class="btn btn-gray" id="J_cancel">取消</a> 
            	</div>
        	</div>
        </div>
       <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
      
      <div class="goods">
        <div class="goods-header"  >
          <span style="font-size: 27px;">商品</span>
          <span class="returncart" style="font-size: 15px;"> <a href="${ctx}/cart/list">返回购物车<i class="iconfont"><i class="glyphicon glyphicon-chevron-right"></i></i></a> </span>
        </div>
            <c:forEach items="${cart.shoppingCartVOs}" var="shoppingCart">
              <div class="goods-param">
                <div class="goods-param-left">
                	 <img src="${ctximg}/${shoppingCart.picImg}" alt="${shoppingCart.name}" width="30" height="30"> 
                     <span>
                		 <a href="${ctx}/item/${shoppingCart.productNumber}" target="_blank"> ${shoppingCart.name}
                  			<c:forEach items="${shoppingCart.specificationName}" var="specificationName">&nbsp;${specificationName}</c:forEach>
                 		 </a> 
                	</span>
                </div>
				<div class="goods-param-right">
                	<span> ${shoppingCart.price}元  x ${shoppingCart.buyNumber} </span>
                	<span> 有货 </span>
                	<span> ${shoppingCart.buyNumber * shoppingCart.price}元 </span>
              	</div>
              </div>
            </c:forEach>
      </div>
      
       <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
        
        <div class="money-box">
          <ul>
            <li class="">
              <label>商品件数：</label>
              <span class="val">${cart.totalNumber}件</span> </li>
            <li class="">
              <label>金额合计：</label>
              <span class="val">${cart.totalPrice}元</span> </li>
            <li class="">
              <label>运费：</label>
              <span class="val"><i data-id="J_postageVal">0</i>元</span> </li>
            <li class="total-price">
              <label>应付总额：</label>
              <span class="val"><em>${cart.totalPrice}</em>元</span> </li>
          </ul>
      </div>
      
       <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
      
      <div class="section-bar">
        <div class="fr"> 
        	<a href="javascript:void(0);" class="btn btn-primary" id="J_checkoutToPay" >去结算</a> 
        </div>
    </div>
</div>
<myfooter>
  	<script src="${ctxsta}/common/layer/layer.js"></script> 
  	    <script src="${ctxsta}/os/js/checkout.js"></script> 
  	    </myfooter>
</body>
</html>