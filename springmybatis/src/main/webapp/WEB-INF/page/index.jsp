<%@page import="com.mybatistest.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setAttribute("domain", "http://127.0.0.1:8080/springmybatis/");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息系统</title>
<link rel="stylesheet" type="text/css" href="${domain }css/index.min.css">
</head>
<body>

	<!-- head -->
	<div id="page-header" class="wrap header">
		<header id="masthead" class="site-header" role="banner">
			<div class="hgroup">
				<h1 class="site-title">
					<a class="home-link" href="${domain }" title="代理IP提取系统" rel="home">用户信息系统</a>
				</h1>
			</div>
			<div class="clear"></div>
		</header>
	</div>

	<!-- menu -->
	<div id="primary-nav">
		<div class="wrap nav">
			<nav id="site-navigation" class="main-navigation" role="navigation">
				<h3 class="menu-toggle">Menu</h3>
				<a class="assistive-text" href="#content" title="Skip to content">Skip to content</a>
				<ul class="nav-menu">
					<li id="menu_index" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item">
						<a href="${domain }index.do">首页</a>
					</li>
					<li id="menu_api" class="menu-item menu-item-type-taxonomy menu-item-object-custom ">
						<a href="#">其他</a>
					</li>

				</ul>
			</nav>
		</div>
	</div>

<!-- body -->
<div class="wrap fullwidth">
	<div id="content" style="width: auto;">
	<div id="post-2" class="post-2 page type-page status-publish hentry">
		<div class="clear"></div>
		<div class="entry entry-content">
			<div class="entry-title">用户列表信息</div>
				 
				<div id="list">
					<table class="table">
						<thead>
							<tr>
								<th>ID</th>
								<th>姓名</th>
								<th>邮箱</th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach items="${pageParam.data }" var="item">
							<tr>
								<td>${item.id }</td>
								<td>${item.name }</td>
								<td>${item.email }</td>
							</tr>							
							</c:forEach>

						</tbody>
					</table>
					<div class="wp-pagenavi">
						<span>第</span>
						<%
						
							PageParam pageParam = (PageParam)request.getAttribute("pageParam");
							int currPage = pageParam.getCurrPage();
							int totalPage = pageParam.getTotalPage();
							for(int i = 1; i <= totalPage; i ++){
								if(i == currPage){
									%><span class="current"><%=currPage %></span><%
								}else{
									%><a href="index.html?page=<%=i %>"><%=i %></a><%
								}
							}
						%>
						<span>页</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div id="footer">
		<div class="copyright" style="display: none;">
			<span class="footerleft">Copyright © 2015</span>
			<span class="footerright">All rights reserved</span>
			<div class="clear"></div>
		</div>
	</div>
</div>


</body>
</html>