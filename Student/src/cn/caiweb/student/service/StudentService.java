package cn.caiweb.student.service;

import java.util.List;

import cn.caiweb.student.dao.StudentDao;
import cn.caiweb.student.model.Student;
import cn.caiweb.student.util.PageInfo;

public class StudentService {

	private static StudentService ss;
	private StudentDao dao;
	
	private StudentService() {}
	
	public static StudentService getInstance() {
		if(ss == null) {
			ss = new StudentService();
			ss.dao = new StudentDao();
		}
		return ss;
	}
	
	public List<Student> getStudents() {
		return dao.getStudents();
	}
	
	public void add(Student s) {
		dao.add(s);
	}
	
	public void delete(String id) {
		dao.delete(id);
	}
	
	public void update(Student s) {
		dao.update(s);
	}
	
	public Student getStudent(String id) {
		return dao.getStudent(id);
	}
	
	public PageInfo getStudents(List<Student> students, int pageNo, int pageCount) {
		return dao.getStudents(students, pageNo, pageCount);
	}
}
