package com.can.myapi;

public class AreaAndType {
	private long count;
	private String type;
	private String location;
	public AreaAndType(long count, String type, String location) {
		super();
		this.count = count;
		this.type = type;
		this.location = location;
	}
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
}
