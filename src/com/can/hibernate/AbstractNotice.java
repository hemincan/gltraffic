package com.can.hibernate;

import java.sql.Timestamp;

/**
 * AbstractNotice entity provides the base persistence definition of the Notice
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractNotice implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private String noticeTiltle;
	private String noticeContent;
	private Timestamp noticePublicTime;
	private Integer noticeReaded;
	private Short noticeState;

	// Constructors

	/** default constructor */
	public AbstractNotice() {
	}

	/** minimal constructor */
	public AbstractNotice(Timestamp noticePublicTime) {
		this.noticePublicTime = noticePublicTime;
	}

	/** full constructor */
	public AbstractNotice(User user, String noticeTiltle, String noticeContent,
			Timestamp noticePublicTime, Integer noticeReaded, Short noticeState) {
		this.user = user;
		this.noticeTiltle = noticeTiltle;
		this.noticeContent = noticeContent;
		this.noticePublicTime = noticePublicTime;
		this.noticeReaded = noticeReaded;
		this.noticeState = noticeState;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getNoticeTiltle() {
		return this.noticeTiltle;
	}

	public void setNoticeTiltle(String noticeTiltle) {
		this.noticeTiltle = noticeTiltle;
	}

	public String getNoticeContent() {
		return this.noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Timestamp getNoticePublicTime() {
		return this.noticePublicTime;
	}

	public void setNoticePublicTime(Timestamp noticePublicTime) {
		this.noticePublicTime = noticePublicTime;
	}

	public Integer getNoticeReaded() {
		return this.noticeReaded;
	}

	public void setNoticeReaded(Integer noticeReaded) {
		this.noticeReaded = noticeReaded;
	}

	public Short getNoticeState() {
		return this.noticeState;
	}

	public void setNoticeState(Short noticeState) {
		this.noticeState = noticeState;
	}

}