<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>商品管理</title>
<link rel="stylesheet" href="${ctxsta}/os/css/root_product.css">
</head>
<body>
  <div class="input-group-btn" style="float: left;width: 100%;margin-left: 130px;">
     <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
            分类<span class="caret"></span>
     </button>
	 <ul id="project" class="dropdown-menu">
         <c:forEach items="${categorys}" var="category">
 			<li><a href="${ctx}/root/productlist_2?categoryId=${category.categoryId}">${category.name}</a></li><%--   --%>
           </c:forEach>
  	 </ul>
  </div>
	<table id="productTable"  border="1" class="table table-hover" style="float: left; width: 1400px;margin-left: 130px;" >  
        <tr>  
            <th style="width: 80px;">商品id</th>  
            <th>商品编号</th>
            <th style="width: 100px;">商品名称</th>  
            <th>价格</th>  
            <th>介绍</th>   
            <th>商品图片</th>  
            <th style="width: 100px;">商品标题</th>
            <th>商品描述</th>
             <th>详情图片</th>
            <th style="width: 80px;">操作</th>  
        </tr>  
       <c:forEach items="${products}" var="product">
            <tr class="productmessage"
            	data-productId="${product.productId}" data-productNumber="${product.productNumber}"
            	data-name="${product.name}"
            	data-showPrice="${product.showPrice}"
            	data-introduce="${product.introduce}"
            	data-picImg="${product.picImg}"
            	data-pageTitle="${product.pageTitle}"
            	data-pageDescription="${product.pageDescription}">  
                <td>${product.productId}</td>  
                <td>${product.productNumber}</td>  
                <td>${product.name}</td>  
                <td>${product.showPrice}</td> 
                <td>${product.introduce}</td>   
                <td>${product.picImg}</td>  
                <td>${product.pageTitle}</td>  
                <td>${product.pageDescription}</td>  
                 <td>${product.detailImg}</td>  
                <td class="td4">
					<div class="col-action">
              			<a href="javascript:void(0);" title="删除" class="del J_delGoods"  data-sid="${product.productId}" onclick="root_product_delete(this,${product.productId})">
              				<i class="glyphicon glyphicon-remove"></i>
             			</a> 
              			<a href="${ctx}/root/modify/${product.productNumber}" title="修改" class="modify"  data-sid="${product.productNumber}">
              				<i class="glyphicon glyphicon-edit"></i>
             			</a> 
             		</div>
				</td>    
            </tr>  
        	</c:forEach>
    <tr style="background-color: white;">  
        <td colspan="10" align=center>
        <a href="${ctx}/root/Add" title="添加" class="Add" >添加</a> 
        </td>  
    </tr>  
    </table>  
      <myfooter>
  	    <script src="${ctxsta}/os/js/root_product.js"></script> 
  	 </myfooter>
</body>
</html>