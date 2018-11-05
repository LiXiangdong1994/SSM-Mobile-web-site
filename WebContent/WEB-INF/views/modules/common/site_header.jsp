<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<div class="divv">
<!-- 包括导航栏和搜索框 -->
 	<%-- <div class="main-top">
<!-- 搜索框 -->
		<%@ include file="/WEB-INF/layouts/web/搜索栏.jsp"%>   
	</div> --%>
<!--包括商品分类、滚动图和公告部分  -->
	<div class="main-center">
	<marquee style="font-size: 25px;color: red" scrollAmount="15" onmouseout=this.start() onmouseover=this.stop() behavior="scroll" direction="left" width="100%" height="40px" SCROLLDELAY="320" >新平台上线，所有店铺大优惠！    暑假大长假，活动根本停不下来</marquee>  
	<div class="nav2" >
          <a href="#nowhere" style="margin-left:100px; background-color: #f6430b">主题市场</a>
            <a href="#nowhere" style="margin-left:102px;">天猫</a> 
            <a href="#nowhere">聚划算</a> 
            <a href="#nowhere">天猫超市</a>
            <span>|</span>
            <a href="#nowhere">海抢购</a>  
            <a href="#nowhere">电器城</a> 
            <a href="#nowhere">司法拍卖</a> 
            <a href="#nowhere">中国制造</a> 
            <a href="#nowhere">兴农扶贫</a> 
            <span>|</span>
            <a href="#nowhere">飞猪旅行</a>  
            <a href="#nowhere">智能生活</a> 
            <a href="#nowhere">苏宁易购</a> 
        
        </div>
<!-- 商品分类 -->
		<div class="main-center-left" style="text-align: center">
		<div class="header-nav">
      		<ul class="category_ul">
         	 <div class="category">
           		<ul class="category-list">
             	 <c:forEach items="${categorys}" var="category">
                <li class="category-item"> <a class="title" href="${ctx}/list?categoryId=${category.categoryId}">${category.name}<i class="glyphicon glyphicon-chevron-right"></i></a>
                 <c:choose>
                    <c:when test="${fn:length(category.products)<=12}">
                      <div class="children clearfix children-col-2">
                        <ul class="children-list children-list-col children-list-col-1">
                          <c:forEach items="${category.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-2">
                          <c:forEach items="${category.products}" var="product" begin="6" end="11">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:when>
                  </c:choose>
                </li>
              </c:forEach>
            </ul>
          </div>
          <!--     轮播top菜单导航end       --> 
        				</li>
        				<c:forEach items="${indexClassify}" var="indexClassify">
         		 		<li class="nav-item"> <a class="link" href="${indexClassify.href}" target="${indexClassify.target}"><span class="text">${indexClassify.name}</span><span class="arrow"></span></a> </li>
        		</c:forEach>
     			 </ul>
    		</div>
		</div>
<!-- 滚动图 -->
		<div class="main-center-center" >
						<img alt="暂无图片" src="${ctxsta}/os/user/images/50.png" style="width: 460px; height:400px;float: left;">
						<link rel="stylesheet" href="${ctxsta}/os/css/购物滚动图.css">						
				<div class="csslider1 autoplay">
						<input name="cs_anchor1" autocomplete="off" id="cs_slide1_0" type="radio" class="cs_anchor slide" >
						<input name="cs_anchor1" autocomplete="off" id="cs_slide1_1" type="radio" class="cs_anchor slide" >
						<input name="cs_anchor1" autocomplete="off" id="cs_slide1_2" type="radio" class="cs_anchor slide" >
						<input name="cs_anchor1" autocomplete="off" id="cs_play1" type="radio" class="cs_anchor" checked>
						<input name="cs_anchor1" autocomplete="off" id="cs_pause1" type="radio" class="cs_anchor" >
						<ul>
							<div style="width: 100%; visibility: hidden; font-size: 0px; line-height: 0;">
								<img src="${ctxsta}/os/user/images/13.jpg" style="width: 100%;height:400px">
							</div>
							<li class="num0 img">
								<img src="${ctxsta}/os/user/images/14.jpg" style="width:100%;height:400px"/>
							</li>
							<li class="num1 img">
								<img src="${ctxsta}/os/user/images/15.jpg" style="width:100%;height:400px"/ />
							</li>
							<li class="num2 img">
								<img src="${ctxsta}/os/user/images/16.jpg" style="width:100%;height:400px"//>
							</li>
						</ul>
				</div>
					
					<hr width="100%" color=#f6430b SIZE=1>
					<a target="_blank" href="#">
					<img alt="暂无图片" src="${ctxsta}/os/user/images/46.png" style="width: 290px; height:195px;float: left: ;">
					</a>
					<a href="#" target="_blank">
					<img alt="暂无图片" src="${ctxsta}/os/user/images/47.png" style="width: 200px; height:195px;float: left;">
					</a>
					<a href="#" target="_blank">
					<img alt="暂无图片" src="${ctxsta}/os/user/images/48.png" style="width: 200px; height:195px;float: left;">
					</a>
					<a href="#" target="_blank">
					<img alt="暂无图片" src="${ctxsta}/os/user/images/49.png" style="width: 200px; height:195px;float: left;">
					</a>
</div>
<!--公告  -->
		<div class="main-center-right" style="text-align: center;">
			<font style="font-size:27px;color: #5d5d5d;">公告</font>
			<hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="80%" color=#987cb9 SIZE=1>
			<div class="announcement">
				<li class="announcement1"><a onclick="gg1()">公告1</a></li>
				<li class="announcement2"><a onclick="gg2()">公告2</a></li>
				<li class="announcement3"><a onclick="gg3()">公告3</a></li>
			</div>
		</div>
</div>
 <hr style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#636363 SIZE=1>
</div>
