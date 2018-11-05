<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>东东商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/product_detail.css">
</head>
<body>

<!-- 如果存在商品 -->
<c:if test="${not empty product}"> 
<div class="product_detail">
  <!--     详情页顶部导航栏 begin       -->
	<div class="nav">
		<div class="top_productName"><a href='${ctx}/index'>首页</a>
      	<%-- <c:forEach items="${upperCategories}" var="upperCategory"><span class="sep">&gt;</span><a href="${ctx}/list?categoryId=${upperCategory.categoryId}">${upperCategory.name}</a></c:forEach> --%>
      	<span class="sep">&gt;</span><a href="${ctx}/detail/${product.productNumber}">${product.name}</a>
    	</div>
 	</div>
	<!-- 商品详情 begin -->
  	<div class="goods-detail"> 
  	
		<div class="goods-detail-left">
                 <img src="${ctximg}/${product.picImg}" alt="${product.name}" title="${product.name}" >
		</div>	
		
		<div class="goods-detail-right">
                <dl id="J_goodsInfoBlock">
                  <dt id="goodsName" class="goods-name"> ${product.name} </dt>
                  <dd class="goods-subtitle">
                    <p> ${product.introduce} </p>
                  </dd>
                  <dd class="goods-info-head-tip">
                    <ul>
                    </ul>
                  </dd>
                  <dd class="goods-price">
                  	 <span> ${product.showPrice}</span> 
                   	 <i>&nbsp;元</i> 
                   </dd>
                  <c:forEach items="${kindVOs}" var="kindVO">
                    <dd class="goods-size"  data-sid="${kindVO.specificationId}"> 
                    <span class="style-label">${kindVO.name}：</span>
                    	<c:if test="${empty kindVO.kindAttributes}">
                 			<h3 style="color: red;">暂无信息</h3>
                		</c:if>
                      <ul class="kindAttributes">
                        <c:forEach items="${kindVO.kindAttributes}" var="kindAttribute">
                          <li data-aid="${kindAttribute.specAttrId}">
                          <a href="javascript:;" class="item goodsStyle" title="${kindAttribute.name}">${kindAttribute.name}</a></li>
                        </c:forEach>
                      </ul>
                    </dd>
                       <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
                  </c:forEach>
               <dd class="goods-info-head-cart" id="goodsDetailBtnBox"> 
                  <a href="javascript:void(0)" onclick="add_cart(this)" id="goodsDetailAddCartBtn" class="btn btn-primary goods-add-cart-btn" data-product-spec-number=""> <i class="glyphicon glyphicon-shopping-cart"></i>加入购物车 </a> <a id="goodsDetailCollectBtn" data-pid="${product.productNumber}" data-isfavorite="false" class=" btn btn-gray  goods-collect-btn" href="javascript:void(0)" onclick="add_favorite(this);"> <i class="glyphicon glyphicon-heart-empty"></i>&nbsp;喜欢&nbsp; </a> 
                  </dd>
                  <dd class="goods-info-head-cart" id="goodsDetailBtnBoxForInform" style="display: none;">
                   
                </dl>
  	</div>
  	  <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
    <!-- 商品简介end-->
    
    <!-- 商品详情中部导航栏，包括详情描述和规格参数 -->
    <div class="goods-detail-nav">
        <ul class="detail-list" >
          <li class="detail-nav"> 
             <a href="#goodsDesc" data-index='0'>详情描述</a> 
          </li>
          <li class="detail-nav">
          	 <a href="#goodsParam" data-index='1'>规格参数</a>
          </li>
        </ul>
    </div>
    <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
    <!-- 商品详情内容 -->
    <div class="goods-detail-desc" id="goodsDesc" style="display: block;">
        <div class="shape-container">
          <p class="detailBlock"> ${detail.description} </p>
        </div>
    </div>
     <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
    <!-- 规格导航栏 -->
    <div class="goods-detail-nav-name-block">
        <h2 class="nav-name">规格参数</h2>
    </div>
    <!--规格内容-->
    <div class="goods-detail-param">
        <div class="param-list">
          	<li class='goods-img'> 
         	 	<img alt="${pruduct.name}" src="${ctximg}/${product.picImg}" title="${pruduct.name}">
           	</li>
         </div>
         <div class="param-list2">
         	<c:if test="${empty productParameter}">
         		<h1 style="color: red;">暂无信息</h1>
         	</c:if>
                 <c:forEach items="${productParameter}" var="productParameter">
                 	<li> ${productParameter.name}：${productParameter.value} </li>
                  </c:forEach>
     	  </div>
    </div>
           <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
    
    <!-- 售后服务导航栏 -->
    <div class="goods-detail-nav-name-block " id="goodsService">
        <h2 class="nav-name">售后服务与退换货流程</h2>
    </div>
    
    <!--售后服务与退换货流程内容-->
    <div class="goods-detail-service-block">
      <div class="container-fluid">
        <div class="row">
          <div class="span8 service-day-img"> <img src="${ctxsta}/os/images/timg.jpg" alt="售后服务与退换货流程"> </div>
          <div class="span11 service-detail-block">
            <div class="service-detail-content" id="J_serviceCon">
              <h3 class="title"></h3>
              <h4 class="sub-title"><span class="tit">A</span>phone飞车: </h4>
              <p class="content"> 1）产品自签收后7天内无理由退货，14日内保修<br>
                2）以下情况不能申请售后服务：<br>
                a. 未经授权的修理、改装、改动、碰撞、误用、进水、及不正确的使用所造成的问题。<br>
                b. 商品的外包装、附件、说明书不完整；发票缺失或涂改。<br>
                c. 产品已使用（产品自身质量问题除外）。<br>
                d. 其他不符合售后流程的情况。<br>
                3）产品自身质量问题范围：<br>
                a. 汽车不正常工作且不存在电量低、电池松动或接触点未连好、电池没电、电子部件损坏、开关键处于关的情况。<br>
                b. 电池不能充电且不存在电池连接点接触不好的情况。<br>
                c. 玩用时间短且不存在电池能量低、能量耗尽的情况。<br>
                d. 低速度且不存在电池没电、玩用的地面不平的情况。<br>
                e. wifi链接失败且不存在电量不足、超出遥控范围的情况。<br>
                3）小米之家暂不办理自提和退换货业务，现阶段仅提供网上办理及电话办理两种方式<br>
              </p>
              <h4 class="sub-title"><span class="tit">A</span>米兔积木机器人: </h4>
              <p class="content"> 1.产品自签收后7天内无理由退货；7天内质量问题，可以退货、换货；15日内产品质量问题可以换货或者维修；1年内，主控、电机、适配器产品质量问题可以维修，积木件不保。<br>
                2.以下情况不能申请售后服务：<br>
                a. 未经授权的修理、改装、改动、碰撞、误用、进水、及不正确的使用所造成的问题;<br>
                b. 已超过三包有效期；<br>
                c. 因不可抗力造成的损坏；<br>
                d. 不符合《产品性能故障表》所列性能故障的情况；<br>
                e. 因人为原因导致本产品及其配件产生《产品性能故障表》所列性能故障。<br>
                3.积木件超出15天，1年内：自您签收日起12个月内，积木件缺失、损坏可享受一次免费补换件的机会，补换件数量不超过10个。请联系北京爱其科技有限公司服务热线：400-012-6281。<br>
                4.小米之家暂不办理自提和退换货业务，现阶段仅提供网上办理及电话办理两种方式。<br>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  
</c:if>
<!-- 如果不存在商品 -->
<c:if test="${empty product}">
  <div class="container-fluid">
    <div class="xm-box ">
      <div class="bd">
        <div class="shop-global-error">
          <h2>你所查找的商品不存在</h2>
          <p class="shop-global-error-tips"></p>
          <p class="shop-global-error-btn"> <a href="${ctx }/index" class="btn btn-primary">去首页</a> <a href="javascript:;" onclick="history.go(-1);" class="btn btn-line-gray">返回上一页</a> </p>
        </div>
      </div>
    </div>
  </div>
</c:if>
<myfooter> 
</div>
  <!-- layer javascript --> 
  <script src="${ctxsta}/os/js/product_detail.js"></script> 
  <script>
//价格json
  var sys_item=${productSpecifications};
  var default_price=${product.showPrice};
  var productNumber=${product.productNumber};
  var productId=${product.productId};
  console.log(sys_item);
// 判断是否收藏商品
$(function(){
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : baselocation + '/favorite/' + productNumber,
		success : function(result) {
			if (result.success == true) {
				if(result.data != null) {
					$('#goodsDetailCollectBtn').attr('data-isfavorite',true);
					$('#goodsDetailCollectBtn i').addClass("red");
				}else {
					$('#goodsDetailCollectBtn').attr('data-isfavorite',false);
					$('#goodsDetailCollectBtn i').removeClass("red");
				}
			} else {
				$('#goodsDetailCollectBtn').attr('data-isfavorite',false);
				$('#goodsDetailCollectBtn i').removeClass("red");
			}
		}
	})	
})
// 收藏商品
function add_favorite(obj) {
	var productNumber = $(obj).attr("data-pid");
	var result = Boolean($(obj).attr('data-isfavorite'));
	if(result) {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : baselocation + '/favorite/' + productNumber,
			success : function(result) {
				if (result.success == true) {
					$('#goodsDetailCollectBtn i').toggleClass("red");
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		})			
	}else {
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : baselocation + '/favorite/' + productNumber,
			success : function(result) {
				if (result.success == true) {
					$('#goodsDetailCollectBtn i').toggleClass("red");
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		})			
	}
}
</script> 
</myfooter>
</body>
</html>