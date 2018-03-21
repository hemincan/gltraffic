package com.can.hibernate;

import java.sql.Timestamp;

/**
 * Notice entity. @author MyEclipse Persistence Tools
 */
public class Notice extends AbstractNotice implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Notice() {
	}

	/** minimal constructor */
	public Notice(Timestamp noticePublicTime) {
		super(noticePublicTime);
	}

	/** full constructor */
	public Notice(User user, String noticeTiltle, String noticeContent,
			Timestamp noticePublicTime, Integer noticeReaded, Short noticeState) {
		super(user, noticeTiltle, noticeContent, noticePublicTime,
				noticeReaded, noticeState);
	}

}
