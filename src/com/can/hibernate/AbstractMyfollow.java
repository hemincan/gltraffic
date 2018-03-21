package com.can.hibernate;

import java.sql.Timestamp;

/**
 * AbstractMyfollow entity provides the base persistence definition of the
 * Myfollow entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractMyfollow implements java.io.Serializable {

	// Fields

	private MyfollowId id;
	private Timestamp followTime;

	// Constructors

	/** default constructor */
	public AbstractMyfollow() {
	}

	/** full constructor */
	public AbstractMyfollow(MyfollowId id, Timestamp followTime) {
		this.id = id;
		this.followTime = followTime;
	}

	// Property accessors

	public MyfollowId getId() {
		return this.id;
	}

	public void setId(MyfollowId id) {
		this.id = id;
	}

	public Timestamp getFollowTime() {
		return this.followTime;
	}

	public void setFollowTime(Timestamp followTime) {
		this.followTime = followTime;
	}

}