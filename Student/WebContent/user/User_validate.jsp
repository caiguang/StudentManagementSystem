<%@ page import="cn.caiweb.student.model.User" %>
<%
User user = (User)session.getAttribute("user");
if(user == null) {
	response.sendRedirect("/Student/user/User_login.jsp");
	return;
}
%>