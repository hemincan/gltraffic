package com.can.myapi;

public class Type {
	private Long count;
	private String type;
	
	public Type(Long count, String type) {
		super();
		this.count = count;
		this.type = type;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
