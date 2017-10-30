package com.hsbc.hktools.dao;

import com.hsbc.hktools.entity.User;

public interface UserDao {
	public User getUser(String name);
	
	public User insertUser(User user);
}
