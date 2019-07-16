<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<body>
	<!--导航栏class="active-menu-->
	<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
	<ul class="nav" id="main-menu">
		<li><a href="<%=basePath %>statistical">
		<i class="fa fa-table"></i>图表展示</a></li>
		<li><a href="<%=basePath %>flight">
		<i class="fa fa-table"></i>航班信息 </a></li>
		<li><a href="<%=basePath %>map">
		<i class="fa fa-table"></i>地图概览</a></li>
		<li><a href="<%=basePath %>predict">
		<i class="fa fa-superpowers"></i>准点预测</a></li>
	</ul>
	</div>
	</nav>
	</body>
</html>
