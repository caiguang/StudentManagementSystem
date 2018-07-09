<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.caiweb.student.model.*,cn.caiweb.student.service.*, java.util.*, cn.caiweb.student.util.PageInfo" %>
<%@ include file="../user/User_validate.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String strNo = request.getParameter("pageNo");
int pageNo = 1;
if(strNo != null) {
	pageNo = Integer.parseInt(strNo);
}

List<Student> students = new ArrayList<Student>();
PageInfo pi = StudentService.getInstance().getStudents(students, pageNo, 3);
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/default.css" />
	<link rel="stylesheet" type="text/css" href="css/query_success.css" />
</head>
<body>
<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;学生管理<span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="student/Student_query_success.jsp">学生列表</a><span>&nbsp;
	</div>
</div>
<div id="tips">
	<div id="buttonGroup">
		<div class="button" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
			<a href="student/Student_add.jsp">添加学生</a>
		</div>
		<div class="button" onmouseout="this.style.backgroundColor='';this.style.fontWeight='normal'" onmouseover="this.style.backgroundColor='#77D1F6';this.style.fontWeight='bold'">
			<a>查找学生</a>
		</div>
	</div>
</div>
<div id="mainContainer">
<!-- 从session中获取学生集合 -->

<table class="default" width="100%">
	<col width="10%">
	<col width="20%">
	<col width="5%">
	<col width="20%">
	<col width="30%">
	<col width="15%">
	<tr class="title">
		<td>学号</td>
		<td>姓名</td>
		<td>性别</td>
		<td>出生日期</td>
		<td>地址</td>
		<td>操作</td>
	</tr>
	
	<!-- 遍历开始 -->
	<%
	for(Student s : students) {
	%>
	<tr class="list">
		<td><%=s.getId() %></td>
		<td><a href="student/Student_modify.jsp?id=<%=s.getId()%>"><%=s.getName() %></a></td>
		<td><%=s.getGender() %></td>
		<td><%=s.getBirthday() %></td>
		<td><%=s.getAddress() %></td>
		<td><a href="student/Student_delete?id=<%=s.getId() %>" onclick="javascript: return confirm('真的要删除吗？');">删除</a></td>
	</tr>
	<%
	}
	%>

	<!-- 遍历结束 -->
</table>
共<%=pi.getTotalPage() %>页&nbsp;第<%=pi.getCurrentPage() %>页&nbsp;&nbsp;
&nbsp;<a href="student/Student_query_success.jsp?pageNo=<%=pi.getPageUp()%>">上一页</a>
&nbsp;<a href="student/Student_query_success.jsp?pageNo=<%=pi.getPageDown()%>">下一页</a>
</div>
</body>
</html>