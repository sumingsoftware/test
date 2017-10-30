package com.hsbc.hktools.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Contacts {
    private int id;
    
    private String name;
    
    private String sex;
    
    private Date birthday;
    
    private int groupId;
    
    private String telephone;
    
    private String qq;
    
    private String email;
    
    private String workplace;
    
    private String address;
    
    private String groupName;
    
    private String birthDayStr;
    
    private int leftDays;
    
	public String getAddress() {
		return address;
	}

	public Date getBirthday() {
		return birthday;
	}

	public String getBirthDayStr() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日");
		this.birthDayStr = dateFormat.format(this.getBirthday());
		return birthDayStr;
	}

	public String getEmail() {
		return email;
	}

	public int getGroupId() {
		return groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public int getId() {
		return id;
	}

	public int getLeftDays() {
		return leftDays;
	}

	public String getName() {
		return name;
	}

	public String getQq() {
		return qq;
	}

	public String getSex() {
		return sex;
	}

	public String getTelephone() {
		return telephone;
	}

	public String getWorkplace() {
		return workplace;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public void setBirthDayStr(String birthDayStr) {
		this.birthDayStr = birthDayStr;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setLeftDays(int leftDays) {
		this.leftDays = leftDays;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}
}
