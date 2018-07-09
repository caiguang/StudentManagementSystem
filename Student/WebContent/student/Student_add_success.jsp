<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, cn.caiweb.student.model.Student, cn.caiweb.student.service.StudentService,java.text.SimpleDateFormat" %>
<%@ include file="../user/User_validate.jsp" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8");
String action = request.getParameter("action");
if(action != null && action.equals("add")) {
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	Date birthday = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("birthday"));
	String address = request.getParameter("address");
	
	Student s = new Student(name, gender, birthday, address);
	StudentService.getInstance().add(s);
}
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/default.css" />
	<link rel="stylesheet" type="text/css" href="css/add_success.css" />
</head>
<body>
<div id="navi">
	<!-- 导航空白 -->
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;学生管理<span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="student/Student_query_success.jsp">学生列表</a><span>&nbsp;
	</div>
</div>
<div id="tips">
	<!-- 导航空白 -->
</div>
<div id="mainContainer">
   <strong>添加成功，<a href="student/Student_add.jsp">继续添加？</a></strong>
   <!--数据表格空白 -->
</div>
</body>
</html>