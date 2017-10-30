package com.hsbc.hktools.entity;

public class AdminPassWord {
	
	private String adminName;
	
	private String adminPassword;

	public AdminPassWord(String adminName, String adminPassword) {
		super();
		this.adminName = adminName;
		this.adminPassword = adminPassword;
	}

	public String getAdminName() {
		return adminName; 
	}

	public AdminPassWord() {
		super();
	}

	public AdminPassWord(String adminPassword) {
		super();
		this.adminPassword = adminPassword;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
}
