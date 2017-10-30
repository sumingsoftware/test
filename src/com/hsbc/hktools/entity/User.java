package com.hsbc.hktools.entity;

public class User {
    private String name;
    
    private Integer age;
    
	public Integer getAge() {
		return age;
	}
	
	public User(String name, Integer age) {
		super();
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}
	
	public void setAge(Integer age) {
		this.age = age;
	}
	
	public void setName(String name) {
		this.name = name;
	}
}
