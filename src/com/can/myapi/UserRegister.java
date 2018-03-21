package com.can.myapi;
public class UserRegister{
	private String month;
	private String count;
	
	public UserRegister(String month, String count) {
		super();
		this.month = month;
		this.count = count;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	
}