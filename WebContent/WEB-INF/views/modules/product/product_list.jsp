<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>东东商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/product_list.css">
</head>
<body>

<c:if test="${not empty category}"> 
<div class="product_list">
  <!--     分类导航栏 begin       -->
  <div class="nav">
    <a href='${ctx}/index'>首页</a>
      <c:forEach items="${upperCategories}" var="upperCategory"><span class="sep">&gt;</span><a href="${ctx}/list?categoryId=${upperCategory.categoryId}">${upperCategory.name}</a></c:forEach>
  </div>
  
  <!--     产品分类目录begin       -->
  <div class="category">
            <p>分类：</p>
			<div class="categorys">          
            	<li><a href="${ctx}/list?categoryId=1">全部</a></li>
            	<c:forEach items="${lowerCategories}" var="lowerCategoriy">
              		<li>
              			<a href="${ctx}/list?categoryId=${lowerCategoriy.categoryId}">${lowerCategoriy.name }</a>
              		</li>
           		 </c:forEach>
          			<li><a>更多<i class="glyphicon glyphicon-chevron-down"></i></a></li>
			</div>  
  </div>
  
  <!--     产品分类内容begin       -->
  <div class="content">
  		<!-- 按条件排序 -->
      <div class="order-list-box clearfix">
        <ul class="order-list">
          <li ><a href="${ctx}/list?categoryId=${category.categoryId}&sort=0" rel="nofollow">推荐</a></li>
          <li ><a href="${ctx}/list?categoryId=${category.categoryId}&sort=1" rel="nofollow">新品</a></li>
          <li><a href="${ctx}/list?categoryId=${category.categoryId}&sort=2" rel="nofollow">销量</a></li>
          <li><a href="${ctx}/list?categoryId=${category.categoryId}&sort=6" rel="nofollow">价格 <i class="glyphicon glyphicon-arrow-up"></i></a></li>
          <li><a href="${ctx}/list?categoryId=${category.categoryId}&sort=7" rel="nofollow">价格 <i class="glyphicon glyphicon-arrow-down"></i></a></li>
          <li><a href="${ctx}/list?categoryId=${category.categoryId}&sort=3"  rel="nofollow">评论最多</a></li>
        </ul>
      </div>
      
      <div class="goods-list-box">
        <div class="goods-list clearfix">
          <c:forEach items="${products}" var="product">
            <div class="goods-item">
              <div class="figure figure-img"><a title="${product.introduce}" href="${ctx}/detail/${product.productNumber}"><img src="${ctximg}/${product.picImg}" title="${product.introduce}" width="200" height="200" alt="${product.name}" /></a></div>
              <p class="desc"></p>
              <h2 class="title"><a title="${product.name}" href="${ctx}/detail/${product.productNumber}">${product.name}</a></h2>
              <p class="price">${product.showPrice}元</p>

              <div class="actions">  <a class="btn-buy" data-gid="${product.productNumber}" href="${ctx}/detail/${product.productNumber}"><span>加入购物车</span> <i class="glyphicon glyphicon-shopping-cart"></i></a> </div>
              <div class="flags">
              </div>
              <div class="notice"></div>
            </div>
          </c:forEach>
        </div>
        	<!-- 页数 -->
        <div class="page">
          <c:if test="${pageInfo.total gt pageInfo.limit and not empty products}">
            <div id="pager" data-pager-href="${ctx}/list?categoryId=${category.categoryId}&sort=${sort}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-current="${pageInfo.current}"></div>
          </c:if>
        </div>
        
      </div>
      
  	</div>
  </div>
</c:if>
<myfooter> 
  <!-- 分页 javascript --> 
  <script src="${ctxsta}/common/pager/jquery.pager.js"></script> 
  <script src="${ctxsta}/os/js/product-list.js"></script> 

</myfooter>
</body>
</html>