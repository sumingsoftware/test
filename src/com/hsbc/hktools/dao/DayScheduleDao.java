package com.hsbc.hktools.dao;

import java.util.List;
import java.util.Map;

import com.hsbc.hktools.entity.DaySchedule;

public interface DayScheduleDao {
	
	public void insertDaySchedule(DaySchedule daySchedule);
	
	public List<DaySchedule> getDayScheduleList(Map<String, Integer> paramMap);
	
	public List<DaySchedule> getAllDayScheduleList();
	
	public int getDayScheduleCount();
	
	public DaySchedule getDayScheduleById(int dayScheduleId);
	
	public void updateDaySchedule(DaySchedule daySchedule);
	
	public void deleteDaySchedule(int dayScheduleId);
	
	public List<DaySchedule> getDayScheduleListByTitle(String title);
}
