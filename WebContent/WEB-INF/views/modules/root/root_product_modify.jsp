<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 <div class="product-edit-box" style="margin-left: 400px; width: 400px;height: 100%; font-size: 20px;" >
          		<div class="box-main">
          			<input type="text" value="${product.productId}" id="product_productId" name="product_productId" style="display: none;"><br>
         	<div style="width: 500px;float: left;">
         	<div style="width: 350px;float: left;">
         	<p style="float: left;">商品分类：</p>
         	 	<input type="text" value="${osCategory.name}" id="osCategory_name" name="osCategory_name" readonly="readonly">
         	 <input type="text" value="${osCategory.categoryId}" id="osCategory_categoryId" name="osCategory_categoryId" style="display: none;">
         	</div>
         	 <div class="input-group-btn" style="height: 50px;width: 30px;float: left;">
				 <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
           			 分类<span class="caret"></span>
     			</button>
				 <ul id="project" class="dropdown-menu">
			         <c:forEach items="${categorys}" var="category">
			 			<li><a href="#">${category.categoryId}、${category.name}</a></li>
			           </c:forEach>
			  	 </ul>
  			</div><br>
  			</div>
              		商品名称：<input type="text" value="${product.name}" id="product_name" name="product_name"><br>
					价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：<input type="text" value="${product.showPrice}" id="product_showPrice" name="product_showPrice"><br>
					商品图片：<input type="text" value="${ctximg}/${product.picImg}" id="product_picImg2" name="product_picImg2"><br>
						<input type="file" value="${ctximg}/${product.picImg}" id="product_picImg" name="product_picImg"><br>
					商品标题：<input type="text" value="${product.pageTitle}" id="product_pageTitle" name="product_pageTitle"><br>
						介&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;绍：<br><textarea type="text" id="product_introduce"  name="product_introduce"  style="margin-left: 100px;">${product.introduce}</textarea><br>
					商品描述：<br><textarea type="text" id="product_pageDescription" style="margin-left: 100px; height: 200px;">${product.pageDescription}</textarea><br>
					详情图片：<input type="text" value="${ctximg}/${product.detailImg}" id="product_detailImg2" name="product_detailImg2"><br>
						<input type="file" value="${ctximg}/${product.detailImg}" id="product_detailImg" name="product_detailImg"><br>
					<div class="actions" style="margin-left: 100px;"> 
				         <a href="javascript:void(0);" class="btn btn-primary" id="J_save" >保存</a> 
            		<a href="javascript:void(0);" class="btn btn-gray" id="J_cancel" >取消</a> 
					</div>
        		</div>
      </div>
     <myfooter>
  	    <script src="${ctxsta}/os/js/root_product.js"></script> 
  	 </myfooter>
</body>
</html>