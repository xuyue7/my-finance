package com.doing.src.service;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doing.src.dao.UserDao;
import com.doing.src.entity.User;

@Service("userService")
public class UserService {
	
	@Resource(name = "userDao")
	private UserDao userDao;

	public User findByUserName(String username) {
		return userDao.findByUserName(username);
	}
	
	public void updatePd(User user){
		userDao.updatePd(user);
	}
	
}