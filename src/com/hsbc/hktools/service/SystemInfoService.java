package com.hsbc.hktools.service;

import com.hsbc.hktools.entity.SystemInfo;

public interface SystemInfoService {
	public SystemInfo getSystemInfo(int id);
	
	public void updateSystemInfo(SystemInfo systemInfo);
	
	public SystemInfo getSystemOneInfo();
}
