package com.hsbc.hktools.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hsbc.hktools.dao.AdminPassWordDao;
import com.hsbc.hktools.entity.AdminPassWord;
import com.hsbc.hktools.service.AdminPassWordService;

@Service
public class AdminPassWordServiceImpl implements AdminPassWordService {
	
    @Resource
    private AdminPassWordDao adminPassWordDao;

	@Override
	public void updateAdminPassWord(String password) {
		AdminPassWord adminPassWord = new AdminPassWord(password);
		adminPassWordDao.updateAdminPassWord(adminPassWord);
	}
}
