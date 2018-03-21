package com.can.myapi;

public class Area  implements java.io.Serializable {
	private Long count;
	private String location;

	public Area(Long count, String location) {
		this.count = count;
		this.location = location;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}