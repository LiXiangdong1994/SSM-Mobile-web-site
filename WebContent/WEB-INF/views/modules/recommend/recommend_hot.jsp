<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<!--     主产品区热门分类 begin       -->
    <div class="row J_recommend_hot">
      <div>
        <div class="home-brick-box">
          <div class="box-bd J_brickBd">
            <div class="row">
              <div class="span16">
                <div class="tab-container">
                    <ul class="brick-list">
                     <div class="row">
                        <c:forEach items="${newproductVOs}" var="productVO">
                        <!-- 下面是新产品 -->
                       
    <div class="col"><li class="newProduct" style="margin-left: 150px;"">
                              <div class="flag">新品</div>
                              <!--  一个商品，跳转商品详情-->
                            <div> 
                            	<a target="_blank" title="${productVO.name}" href="${ctx}/detail/${productVO.productNumber}"> 
                            		<img src="${ctximg}/${productVO.picImg}" width="160" height="160" alt="${productVO.name}"> 
                            	</a> 
                            </div>
                            <h3 class="title"><a target="_blank" title="${productVO.name}" href="${ctx}/detail/${productVO.productNumber}">${productVO.name}</a></h3>
                            <p class="price"> <span class="num">${productVO.showPrice}</span>元 </p>
                          </li>
                          </div>
                      </c:forEach>
                      </div>
                      
                      <div class="row">
                        <c:forEach items="${hotproductVOs}" var="hotproductVO">
                        <!-- 下面是热销产品 -->
    				<div class="col">
    				<li class="hotProduct" style="margin-left: 150px;"">
                              <div class="flag">热销</div>
                              <!--  一个商品，跳转商品详情-->
                            <div> 
                            	<a target="_blank" title="${hotproductVO.name}" href="${ctx}/detail/${hotproductVO.productNumber}"> 
                            		<img src="${ctximg}/${hotproductVO.picImg}" width="160" height="160" alt="${hotproductVO.name}"> 
                            	</a> 
                            </div>
                            <h3 class="title"><a target="_blank" title="${hotproductVO.name}" href="${ctx}/detail/${hotproductVO.productNumber}">${hotproductVO.name}</a></h3>
                            <p class="price"> <span class="num">${hotproductVO.showPrice}</span>元 </p>
                          </li>
                          </div>
                      </c:forEach>
                      </div>
                      </div>
                    </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
         <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
      </div>
