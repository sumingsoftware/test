package com.hsbc.hktools.dao;

import java.util.List;

import com.hsbc.hktools.entity.GroupName;

public interface GroupNameDao {
	public List<GroupName> getGroupNames();
	
	public void insertGroupName(GroupName groupName);
}
