package com.can.hibernate;

import java.sql.Timestamp;

/**
 * Messageboard entity. @author MyEclipse Persistence Tools
 */
public class Messageboard extends AbstractMessageboard implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Messageboard() {
	}

	/** minimal constructor */
	public Messageboard(Timestamp messbTime) {
		super(messbTime);
	}

	/** full constructor */
	public Messageboard(User userByMessbFromUserid, User userByMessbToUserid,
			Timestamp messbTime, String messbContent, Short messbType,
			Short messbStatus) {
		super(userByMessbFromUserid, userByMessbToUserid, messbTime,
				messbContent, messbType, messbStatus);
	}

}
