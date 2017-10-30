package com.hsbc.hktools.service;

import java.util.List;

import com.hsbc.hktools.entity.DaySchedule;

public interface DayScheduleService {
	public DaySchedule getDayScheduleById(int dayScheduleId);
	
	public void insertDaySchedule(DaySchedule daySchedule);
	
	public List<DaySchedule> getDayScheduleList(int startPos, int pageSize);
	
	public List<DaySchedule> getAllDayScheduleList();
	
	public int getDayScheduleCount();
	
	public void updateDaySchedule(DaySchedule daySchedule);
	
	public void deleteDaySchedule(int dayScheduleId);
	
	public List<DaySchedule> getDayScheduleListByTitle(String title);
}
