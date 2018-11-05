<!-- 基础jsp，用于指定根路径 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	/* 获取根路径 
	比如，页面内部有一个连接，完整的路径应该是 http://localhost:8080/myblog/authen/login.do 
	其中http://localhost/是服务器的基本路径，myblog是当前应用程序的名字，
	那么，我的根路径应该是那么http://localhost:8080/myblog/。*/
	String projectPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
	String staticPath = projectPath + "/static";
	String imagePath = projectPath + "/uploads";
%>
<%--项目路径 --%>
<c:set var="basePath" value="<%=projectPath%>"></c:set>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- ${pageContext.request.contextPath}用于解决使用相对路径时出现的问题，它的作用是取出所部署项目的名字 -->
<%--静态资源路径 --%>
<c:set var="ctxsta" value="${pageContext.request.contextPath}/static"/><!--表明静态资源在WebContent下的static，用ctxsta代替  -->
<%--页面显示图片的前缀路径--%>
<c:set var="ctximg" value="${pageContext.request.contextPath}/uploads"/>


