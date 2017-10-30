package com.hsbc.hktools.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hsbc.hktools.dao.SystemInfoDao;
import com.hsbc.hktools.entity.SystemInfo;
import com.hsbc.hktools.service.SystemInfoService;

@Service
public class SystemInfoServiceImpl implements SystemInfoService {
	
    @Resource
    private SystemInfoDao systemInfoDao;

	@Override
	public SystemInfo getSystemInfo(int id) {
		return systemInfoDao.getSystemInfo(id);
	}

	@Override
	public void updateSystemInfo(SystemInfo systemInfo) {
		systemInfoDao.updateSystemInfo(systemInfo);
	}
	
	@Override
	public SystemInfo getSystemOneInfo() {
		return systemInfoDao.getSystemOneInfo();
	}
}
