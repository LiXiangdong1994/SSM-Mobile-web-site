<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<span style="float: left;">搜索到的商品：</span>
<c:forEach items="${OsProducts}" var="product" varStatus="productStat">
    <div class="row J_recommend_search" style="float: left;margin-top: 20px;">
      <div>
          <li class="brick-item" data-gid="${product.productNumber}">
          <div> 
             <a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}"> 
             	<img src="${ctximg}/${product.picImg}" width="160" height="160" alt="${product.name}"> 
             </a> 
           </div>
           <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}">${product.name}</a></h3>
            <p class="price"> <span class="num">${product.showPrice}</span>元 </p>
           </li>
       </div> 
     </div>
  </c:forEach>
