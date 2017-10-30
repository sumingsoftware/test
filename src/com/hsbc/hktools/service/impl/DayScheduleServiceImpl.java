package com.hsbc.hktools.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hsbc.hktools.dao.DayScheduleDao;
import com.hsbc.hktools.entity.DaySchedule;
import com.hsbc.hktools.service.DayScheduleService;

@Service
public class DayScheduleServiceImpl implements DayScheduleService {
    @Resource
    private DayScheduleDao dayScheduleDao;

	@Override
	public void insertDaySchedule(DaySchedule daySchedule) {
		dayScheduleDao.insertDaySchedule(daySchedule);
	}

	@Override
	public List<DaySchedule> getDayScheduleList(int startPos, int pageSize) {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("startPos", startPos);
		paramMap.put("pageSize", pageSize);
		return dayScheduleDao.getDayScheduleList(paramMap);
	}

	@Override
	public int getDayScheduleCount() {
		return dayScheduleDao.getDayScheduleCount();
	}

	@Override
	public DaySchedule getDayScheduleById(int dayScheduleId) {
		return dayScheduleDao.getDayScheduleById(dayScheduleId);
	}

	@Override
	public List<DaySchedule> getAllDayScheduleList() {
		return dayScheduleDao.getAllDayScheduleList();
	}

	@Override
	public void updateDaySchedule(DaySchedule daySchedule) {
		dayScheduleDao.updateDaySchedule(daySchedule);
	}

	@Override
	public void deleteDaySchedule(int dayScheduleId) {
		dayScheduleDao.deleteDaySchedule(dayScheduleId);
	}

	@Override
	public List<DaySchedule> getDayScheduleListByTitle(String title) {
		return dayScheduleDao.getDayScheduleListByTitle(title);
	}
}
