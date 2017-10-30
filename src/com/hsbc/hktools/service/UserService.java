package com.hsbc.hktools.service;

import com.hsbc.hktools.entity.User;

public interface UserService {
	public User getUser(String name);
	
	public User insertUser(String name, Integer age);
}
