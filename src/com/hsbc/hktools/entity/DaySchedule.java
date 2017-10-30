package com.hsbc.hktools.entity;

public class DaySchedule {
    private int dayScheduleId;
    private int leftDays;
    private String title;
	private String place;
	private String content;
    private String year;
    private String month;
    private String day;
    public String getContent() {
		return content;
	}
    public String getDay() {
		return day;
	}
	public int getDayScheduleId() {
		return dayScheduleId;
	}
	public int getLeftDays() {
		return leftDays;
	}
	public String getMonth() {
		return month;
	}
	public String getPlace() {
		return place;
	}
	public String getTitle() {
		return title;
	}
	public String getYear() {
		return year;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public void setDayScheduleId(int dayScheduleId) {
		this.dayScheduleId = dayScheduleId;
	}
	public void setLeftDays(int leftDays) {
		this.leftDays = leftDays;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setYear(String year) {
		this.year = year;
	}
}
