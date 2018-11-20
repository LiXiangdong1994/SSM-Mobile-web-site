<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>收货地址 - 东东商城</title>
<meta name="author" content="东东Morning. - 毕业设计" /><!--告诉搜索引擎你的站点的制作的作者  -->
<meta name="keywords" content="东东商城,东东Morning,东东公益商城,公益,电子商城,东东社区,公益商城,在线购物,社会责任"><!--keywords： 向搜索引擎说明你的网页的关键词 -->
<meta name="description" content="东东Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。"><!--description：  告诉搜索引擎你的站点的主要内容-->
<link rel="shortcut icon" href="${ctximg}/default/ico/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctxsta}/os/css/user_address.css">
<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body>
  <div class="address-section" id="J_addressList">
          <c:if test="${not empty addresses}">
          <c:forEach items="${addresses}" var="address">
               		<div class="addressmassage" 
               			data-address_id="${address.addressId}" data-consignee="${address.userName}"
               		 	data-tel="${address.userPhone}" 	   data-zipcode="${address.userZipcode}" 
               		 	data-address="${address.userAdress}"   data-tag_name="${address.userTag}">
               		<div class="address-name-phone"> 
               			收货人：<span class="address-name-phone-left">${address.userName}</span>(<span class="tag">${address.userTag}</span> )
                		<span class="address-name-phone-right" > ${address.userPhone} </span>
                	</div>
                		<div class="address">
                 			收货地址： ${address.userAdress} (${address.userZipcode}) 
                  		</div>
              	  <div class="actions"> 
              			<a href="javascript:void(0);" class="modify">修改</a> 
              			<a class="J_addressDel"href="javascript:void(0);" onclick="address_delete(this,${address.addressId})" data-id="${address.addressId}">删除</a>
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
            		<a href="javascript:void(0);" class="btn btn-primary" id="J_save" >保存</a> 
            		<a href="javascript:void(0);" class="btn btn-gray" id="J_cancel">取消</a> 
            	</div>
        	</div>
        </div>
<myfooter>
	<script src="${ctxsta}/common/jquery/jquery-2.1.4.min.js"></script> 
	<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script> 
  	<script src="${ctxsta}/common/layer/layer.js"></script> 
  	<script src="${ctxsta}/os/js/address.js"></script> 
</myfooter>
</body>
</html>
