package com.hsbc.hktools.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hsbc.hktools.dao.UserDao;
import com.hsbc.hktools.entity.User;
import com.hsbc.hktools.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User getUser(String name) {
		return userDao.getUser(name);
	}

	@Override
	public User insertUser(String name, Integer age) {
		User user = new User(name, age);
		return userDao.insertUser(user);
	}

}
