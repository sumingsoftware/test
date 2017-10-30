package com.hsbc.hktools.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hsbc.hktools.dao.GroupNameDao;
import com.hsbc.hktools.entity.GroupName;
import com.hsbc.hktools.service.GroupNameService;

@Service
public class GroupNameServiceImpl implements GroupNameService {
    @Resource
    private GroupNameDao groupNameDao;

	@Override
	public List<GroupName> getGroupNames() {
		return groupNameDao.getGroupNames();
	}

	@Override
	public void insertGroupName(GroupName groupName) {
		groupNameDao.insertGroupName(groupName);
	}
}
