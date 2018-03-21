package com.can.hibernate;

import java.sql.Timestamp;

/**
 * Myfollow entity. @author MyEclipse Persistence Tools
 */
public class Myfollow extends AbstractMyfollow implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Myfollow() {
	}

	/** full constructor */
	public Myfollow(MyfollowId id, Timestamp followTime) {
		super(id, followTime);
	}

}
