package cn.caiweb.student.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.caiweb.student.model.Student;
import cn.caiweb.student.util.DBUtil;
import cn.caiweb.student.util.PageInfo;

public class StudentDao {

	public List<Student> getStudents() {
		List<Student> students = new ArrayList<>();
		Connection conn = DBUtil.getConnection();
		Statement state = null;
		ResultSet result = null;
		try {
			state = conn.createStatement();
			String sql = "select * from student";
			result = state.executeQuery(sql);
			while(result.next()) {
				String id = result.getString("id");
				String name = result.getString("name");
				String gender = result.getString("gender");
				Date birthday = result.getDate("birthday");
				String address = result.getString("address");
				
				Student s = new Student(id, name, gender, birthday, address);
				students.add(s);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(result, state, conn);
		}
		return students;
	}

	public void add(Student s) {
		Connection conn = DBUtil.getConnection();
		String id = generateKey(conn);
		PreparedStatement pstate = null;
		try {
			pstate = conn.prepareStatement("insert into student values (?, ?, ?, ?, ?)");
			pstate.setString(1, id);
			pstate.setString(2, s.getName());
			pstate.setString(3, s.getGender());
			pstate.setDate(4, new Date(s.getBirthday().getTime()));
			pstate.setString(5, s.getAddress());
			pstate.execute();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstate);
			DBUtil.close(conn);
		}
	}
	
	public void delete(String id) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstate = null;
		try {
			pstate = conn.prepareStatement("delete from student where id = ?");
			pstate.setString(1, id);
			pstate.execute();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstate);
			DBUtil.close(conn);
		}
	}
	
	public void update(Student s) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstate = null;
		try {
			pstate = conn.prepareStatement("update student set name = ?, gender = ?, birthday = ?, address = ? where id = ?");
			pstate.setString(1, s.getName());
			pstate.setString(2, s.getGender());
			pstate.setDate(3, new Date(s.getBirthday().getTime()));
			pstate.setString(4, s.getAddress());
			pstate.setString(5, s.getId());
			pstate.execute();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(pstate);
			DBUtil.close(conn);
		}
	}

	
	public String generateKey(Connection conn) {
		String key = null;
		Statement state = null;
		ResultSet result = null;
		
		try {
			state = conn.createStatement();
			result = state.executeQuery("select max(id) from student");
			if(result.next()) {
				key = result.getString(1);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(result);
			DBUtil.close(state);
		}
		
		if(key == null) {
			key = "S0000001";
		} else {
			int number = Integer.parseInt(key.substring(1));
			number++;
			String str = String.valueOf(number);
			int length = str.length();
			StringBuffer sb = new StringBuffer(str);
			
			for(int i=7; i>length; i--) {
				sb.insert(0, "0");
			}
			
			sb.insert(0,"S");
			
			key = sb.toString();
		}
		return key;
	}
	
	public Student getStudent(String id) {
		Student s = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstate = null;
		ResultSet result = null;
		try {
			String sql = "select * from student where id = ?";
			pstate = conn.prepareStatement(sql);
			pstate.setString(1, id);
			result = pstate.executeQuery();
			if(result.next()) {
				String name = result.getString("name");
				String gender = result.getString("gender");
				Date birthday = result.getDate("birthday");
				String address = result.getString("address");
				
				s = new Student(id, name, gender, birthday, address);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(result, pstate, conn);
		}
		return s;
	}
	//拿到带有分页信息的student集合
	public PageInfo getStudents(List<Student> students, int pageNo, int pageCount) {
		PageInfo page = new PageInfo();
		Connection conn = DBUtil.getConnection();
		Statement state = null;
		ResultSet result = null;
		try {
			state = conn.createStatement();
			result = state.executeQuery("select count(*) from student");
			result.next();
			int count = result.getInt(1);
			page.setTotalPage(count%pageCount == 0 ? count/pageCount : count/pageCount + 1); 
			
			if(pageNo < 1) {
				pageNo = 1;
			} else if(pageNo > page.getTotalPage()) {
				pageNo = page.getTotalPage();
			}
			
			int startPosition = pageNo * pageCount - pageCount;
			page.setCurrentPage(pageNo);
			
			DBUtil.close(result);
			
			result = state.executeQuery("select * from student order by birthday desc limit " + startPosition + ", " + pageCount);
			while(result.next()) {
				String id = result.getString("id");
				String name = result.getString("name");
				String gender = result.getString("gender");
				Date birthday = result.getDate("birthday");
				String address = result.getString("address");
				Student s = new Student(id, name, gender, birthday, address);
				students.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(result, state, conn);
		}
		return page;
	}

}
