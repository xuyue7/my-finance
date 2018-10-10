package com.doing.src.dao;

import org.springframework.stereotype.Repository;

import com.doing.src.entity.User;

@Repository("userDao")
public interface UserDao {

	public User findByUserName(String username);

	public void updatePd(User user);

}
