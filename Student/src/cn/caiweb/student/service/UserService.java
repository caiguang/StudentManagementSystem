package cn.caiweb.student.service;

import cn.caiweb.student.dao.PasswordErrorException;
import cn.caiweb.student.dao.UserDao;
import cn.caiweb.student.dao.UsernameNotFoundException;
import cn.caiweb.student.model.User;

public class UserService {

	private static UserService us;
	private UserDao dao;
	
	private UserService() {}
	
	public static UserService getInstance() {
		if(us == null) {
			us = new UserService();
			us.dao = new UserDao();
		}
		return us;
	}
	
	public User loginValidate(String username, String password) throws UsernameNotFoundException, PasswordErrorException {
		return dao.loginValidate(username, password);
	}
}
