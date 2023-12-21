package com.vds;

import java.util.ArrayList;

public class User {
	private String uname;
	private String email;
	private String phone;
	private User mother;
	private User father;
	private ArrayList<User> children;
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public User getMother() {
		return mother;
	}
	public void setMother(User mother) {
		this.mother = mother;
	}
	public User getFather() {
		return father;
	}
	public void setFather(User father) {
		this.father = father;
	}
	public User(String uname, String email, String phone) {
		super();
		this.uname = uname;
		this.email = email;
		this.phone = phone;
	}
	
	
	
	
}
