package com.hsbc.hktools.entity;

public class SystemInfo {
	private int id;
    private String systemName;
	private String author;
	private String nick;
    private String qq;
    private String telephoneNumber;
    private String email;
    private String webAddress;
    private String webName;
	public String getAuthor() {
		return author;
	}
	public String getEmail() {
		return email;
	}
	public int getId() {
		return id;
	}
	public String getNick() {
		return nick;
	}
	public String getQq() {
		return qq;
	}
	public String getSystemName() {
		return systemName;
	}
	public String getTelephoneNumber() {
		return telephoneNumber;
	}
	public String getWebAddress() {
		return webAddress;
	}
	public String getWebName() {
		return webName;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
	}
    public void setWebAddress(String webAddress) {
		this.webAddress = webAddress;
	}
    public void setWebName(String webName) {
		this.webName = webName;
	}
}
