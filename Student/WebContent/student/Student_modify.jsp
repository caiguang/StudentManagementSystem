<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.caiweb.student.model.Student, cn.caiweb.student.service.StudentService" %>
<%@ include file="../user/User_validate.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String id = request.getParameter("id");
Student s = StudentService.getInstance().getStudent(id);
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="css/default.css" />
    <link rel="stylesheet" type="text/css" href="css/modify.css" />
    <script type="text/javascript" src="js/Calendar3.js"></script>
</head>
<body>

<div id="navi">
	<div id='naviDiv'>
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;学生管理<span>&nbsp;
		<span><img src="images/arror.gif" width="7" height="11" border="0" alt=""></span>&nbsp;<a href="student/Student_query_success.jsp">学生列表</a><span>&nbsp;
	</div>
</div>
<div id="tips">
</div>
<div id="mainContainer">
<!-- 从session中获取学生集合 -->
<strong>修改学生资料</strong>
<br>
<br>

<form name="modifyForm" action="student/Student_modify_success.jsp" method="post">
<input type="hidden" name="action" value="modify"/>
<table width="400" >
  <tr>
    <td width="30%">学号：</td>
    <td><input type="text" name="id" value='<%=s.getId() %>'  readonly="readonly"/></td>
  </tr>
  <tr>
    <td width="30%">姓名：</td>
    <td><input type="text" name="name" value='<%=s.getName() %>'/></td>
  </tr>
  <tr>
    <td>性别：</td>
    <td>
        <input type="radio" name="gender" value="男" <%=s.getGender().equals("男")? "checked='checked'" : "" %>/>男
        <input type="radio" name="gender" value="女" <%=s.getGender().equals("女")? "checked='checked'" : "" %>/>女
    </td>
  </tr>
  <tr>
    <td>出生日期：</td>
    <td><input name="birthday" type="text" id="control_date" size="20"
      maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" 
      value="<%=s.getBirthday() %>"
      />
    </td>
  </tr>
  <tr>
    <td>地址：</td>
    <td><input type="text" name="address" value='<%=s.getAddress() %>'/></td>
  </tr>
  <tr>
    <td colspan="2" align="center"><input class="button" type="submit" value="修改"></td>
  </tr>
</table>
</form>


</div>
</body>
</html>