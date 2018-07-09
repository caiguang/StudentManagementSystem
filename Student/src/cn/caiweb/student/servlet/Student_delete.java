package cn.caiweb.student.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.caiweb.student.model.User;
import cn.caiweb.student.service.StudentService;

/**
 * Servlet implementation class Student_delete
 */
@WebServlet("/student/Student_delete")
public class Student_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			if(user != null) {
				String id = request.getParameter("id");
				StudentService.getInstance().delete(id);
				response.sendRedirect("/Student/student/Student_query_success.jsp");
			}
	}


}
