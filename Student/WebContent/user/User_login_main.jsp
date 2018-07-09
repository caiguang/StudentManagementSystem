<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="User_validate.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/default.css" />
	<link rel="stylesheet" type="text/css" href="css/user_login_main.css"/>
</head>
<body>
<div id="navi">
	<!-- 导航空白 -->
</div>
<div id="tips">
	<!-- 导航空白 -->
</div>
<div id="mainContainer">
   <img src="images/welcome.jpg">
   <!--数据表格空白 -->
</div>
</body>
</html>