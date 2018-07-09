package cn.caiweb.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.caiweb.student.model.User;
import cn.caiweb.student.util.DBUtil;

public class UserDao {

	public User loginValidate(String username, String password) throws UsernameNotFoundException, PasswordErrorException {
		User user = null;
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstate = null;
		ResultSet result = null;
		try {
			pstate = conn.prepareStatement("select * from user where username = ?");
			pstate.setString(1, username);
			result = pstate.executeQuery();
			
			if(!result.next()) {
				throw new UsernameNotFoundException();
			} else if(!result.getString("password").equals(password)) {
				throw new PasswordErrorException();
			} else {
				int id = result.getInt("id");
				user = new User(id, username, password);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(result, pstate, conn);
		}
		return user;
	}

}
