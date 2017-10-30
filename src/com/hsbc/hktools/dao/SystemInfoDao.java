package com.hsbc.hktools.dao;

import com.hsbc.hktools.entity.SystemInfo;

public interface SystemInfoDao {
	public SystemInfo getSystemInfo(int id);
	
	public void updateSystemInfo(SystemInfo systemInfo);
	
	public SystemInfo getSystemOneInfo();
}
