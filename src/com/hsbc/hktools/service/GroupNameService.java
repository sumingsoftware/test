package com.hsbc.hktools.service;

import java.util.List;

import com.hsbc.hktools.entity.GroupName;

public interface GroupNameService {
	public List<GroupName> getGroupNames();
	
	public void insertGroupName(GroupName groupName);
}
