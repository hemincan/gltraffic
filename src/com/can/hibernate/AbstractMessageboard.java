package com.can.hibernate;

import java.sql.Timestamp;

/**
 * AbstractMessageboard entity provides the base persistence definition of the
 * Messageboard entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractMessageboard implements java.io.Serializable {

	// Fields

	private Integer id;
	private User userByMessbFromUserid;
	private User userByMessbToUserid;
	private Timestamp messbTime;
	private String messbContent;
	private Short messbType;
	private Short messbStatus;

	// Constructors

	/** default constructor */
	public AbstractMessageboard() {
	}

	/** minimal constructor */
	public AbstractMessageboard(Timestamp messbTime) {
		this.messbTime = messbTime;
	}

	/** full constructor */
	public AbstractMessageboard(User userByMessbFromUserid,
			User userByMessbToUserid, Timestamp messbTime, String messbContent,
			Short messbType, Short messbStatus) {
		this.userByMessbFromUserid = userByMessbFromUserid;
		this.userByMessbToUserid = userByMessbToUserid;
		this.messbTime = messbTime;
		this.messbContent = messbContent;
		this.messbType = messbType;
		this.messbStatus = messbStatus;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUserByMessbFromUserid() {
		return this.userByMessbFromUserid;
	}

	public void setUserByMessbFromUserid(User userByMessbFromUserid) {
		this.userByMessbFromUserid = userByMessbFromUserid;
	}

	public User getUserByMessbToUserid() {
		return this.userByMessbToUserid;
	}

	public void setUserByMessbToUserid(User userByMessbToUserid) {
		this.userByMessbToUserid = userByMessbToUserid;
	}

	public Timestamp getMessbTime() {
		return this.messbTime;
	}

	public void setMessbTime(Timestamp messbTime) {
		this.messbTime = messbTime;
	}

	public String getMessbContent() {
		return this.messbContent;
	}

	public void setMessbContent(String messbContent) {
		this.messbContent = messbContent;
	}

	public Short getMessbType() {
		return this.messbType;
	}

	public void setMessbType(Short messbType) {
		this.messbType = messbType;
	}

	public Short getMessbStatus() {
		return this.messbStatus;
	}

	public void setMessbStatus(Short messbStatus) {
		this.messbStatus = messbStatus;
	}

}