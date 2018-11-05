<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<!--     主产品区热门分类 begin       -->
<c:if test="${not empty categorys}">
  <c:forEach items="${categorys}" var="category" varStatus="productCategoryStat">
    <div class="row J_recommend_hot">
      <div>
        <div class="home-brick-box" id="category-${productCategoryStat.index}">
          <!--一个种类  -->
          <div class="box-hd">
            <h2 class="title">${category.name}</h2>
            <!--  种类下的小分类-->
            <div class="more J_brickNav">
              <ul class="tab-list">
                <c:forEach items="${category.childrenCategorys}" var="childrenCategory">
                  <li>${childrenCategory.name}</li>
                </c:forEach>
              </ul>
            </div>
          </div>
          <div class="box-bd J_brickBd">
            <div class="row">
              <div class="span16">
                <div class="tab-container" id="category-${productCategoryStat.index}-content">
                  <c:forEach items="${category.childrenCategorys}" var="category" varStatus="categoryStat">
                    <ul class="brick-list">
                      <c:forEach items="${category.products}" var="product" varStatus="productStat">
                        <c:if test="${!productStat.last}">
                          <li class="brick-item" data-gid="${product.productNumber}">
                              <div class="flag">热销</div>
                              <!--  一个商品，跳转商品详情-->
                            <div> <a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}"> <img src="${ctximg}/${product.picImg}" width="160" height="160" alt="${product.name}"> </a> </div>
                            <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}">${product.name}</a></h3>
                            <p class="price"> <span class="num">${product.showPrice}</span>元 </p>
                          </li>
                        </c:if>
                        
                        <c:if test="${productStat.last}" >
                          <li class="brick-item" data-gid="${product.productNumber}">
                            <div> <a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}"> <img src="${ctximg}/${product.picImg}"  width="160" height="160" alt="${product.name}"> </a> </div>
                            <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}">${product.name}</a></h3>
                            <p class="price"> <span class="num">${product.showPrice}</span>元 </p>
                          </li>
                          <li class="brick-item2">
                            <div> <a target="_blank" href="${ctx}/list?categoryId=${category.categoryId}"><i class="glyphicon glyphicon-upload"></i></a> </div>
                            <a class="more" target="_blank" href="${ctx}/list?categoryId=${category.categoryId}">浏览更多<small>${category.name}</small></a>
                           </li>
                        </c:if>
                      </c:forEach>
                    </ul>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>
        </div>
         <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
      </div>
    </div>
  </c:forEach>
</c:if>


<!--   控制鼠标移动不同的小分类显示不同的商品  -->
<script type="text/javascript">
	/**
 	 * TAB-list
 	 */
	$(function() {
		var $elements = $('#J_hotCategory .J_recommend_hot');
		var len = $elements.length;
		for (var i = 0; i < len; i++) {
			$('#category-' + i + '-content .brick-list').eq(0).show().siblings().hide();
			$('#category-' + i + ' .tab-list li').eq(0).show();
			$('#category-' + i + ' .tab-list li').eq(0).addClass('tab-active');

			$('#category-' + i + ' .tab-list li').mouseover(function(e) {
				var that = $(this).parents('.home-brick-box').attr('id');
				$(this).addClass('tab-active').siblings().removeClass('tab-active');
				var index = $(this).index();
				$('#' + that + ' .brick-list').eq(index).show().siblings().hide();
			})
		}
	})
</script>