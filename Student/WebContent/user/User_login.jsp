<%@page import="cn.caiweb.student.dao.PasswordErrorException"%>
<%@page import="cn.caiweb.student.dao.UsernameNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.caiweb.student.service.*, cn.caiweb.student.model.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%!
String errorMessage = "";
%>
<%
User u = (User)session.getAttribute("user");
if(u != null) {
	response.sendRedirect("/Student/user/User_login_success.jsp");
	return;
}

request.setCharacterEncoding("utf-8");
String action = request.getParameter("action");
if(action != null && action.equals("login")) {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	User user = null;
	try {
		user = UserService.getInstance().loginValidate(username, password);
	} catch(UsernameNotFoundException e) {
		errorMessage = "用户名不存在！";
	} catch(PasswordErrorException e) {
		errorMessage = "密码错误！";
	}
	
	if(user != null) {
		session.setAttribute("user", user);
		response.sendRedirect("/Student/user/User_login_success.jsp");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8" />
    <title>用户登录</title>
	<link rel="stylesheet" type="text/css" href="css/user_login.css" />
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo"></div>
		<div id="heading">
			<div id="title">后台管理系统</div>
			<div id="subTitle">Ver 1.0</div>
		</div>
	</div>
	<div id="main">
		<div id="mainBg">
			<div id="mainPanel">
				<div id="left">
					<div id="image"></div>
				</div>
				<div id="right">
					
					<form name="loginForm" action="user/User_login.jsp" method="post">
						<input type="hidden" name="action" value="login"/>
					<!-- start of login form -->
					<div id="welcome">
						<span id="welcome-text">管&nbsp;理&nbsp;登&nbsp;录</span>
					</div>
					<div id="user-name">
						<span class="item">用户名:</span>
						<span><input type="text" name="username" value="张三" class="form-input"></span>
					</div>
					<div id="user-password">
						<span class="item">密&nbsp;&nbsp;&nbsp;码:</span>
						<span class="input"><input type="password" name="password" value="123456" class="form-input"></span>
					</div>
					<div id="button-group">
						<input type="submit" class="btn" value="登录"/>
						<input type="reset" class="btn" value="重置"/>
					</div>
					<div>
						<%=errorMessage %>
					   <!-- 显示表单验证的出错信息 -->
					</div>
					<!-- end of form -->
					</form>
					
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div id="text">Copyright © 2018-2019 All Rights Reserved Powered By CaiSu</div>
	</div>
</div>
</body>
</html>