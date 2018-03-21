package com.can.hibernate;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractUser entity provides the base persistence definition of the User
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userId;
	private String userName;
	private String userHeadimg;
	private String userPassword;
	private String userIndentity;
	private String userSex;
	private Timestamp userRegistertime;
	private Timestamp userLastLogintime;
	private Short userState;
	private Set comments = new HashSet(0);
	private Set myfollows = new HashSet(0);
	private Set topics = new HashSet(0);
	private Set articles = new HashSet(0);
	private Set messageboardsForMessbFromUserid = new HashSet(0);
	private Set messageboardsForMessbToUserid = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractUser() {
	}

	/** minimal constructor */
	public AbstractUser(Timestamp userRegistertime, Timestamp userLastLogintime) {
		this.userRegistertime = userRegistertime;
		this.userLastLogintime = userLastLogintime;
	}

	/** full constructor */
	public AbstractUser(String userId, String userName, String userHeadimg,
			String userPassword, String userIndentity, String userSex,
			Timestamp userRegistertime, Timestamp userLastLogintime,
			Short userState, Set comments, Set myfollows, Set topics,
			Set articles, Set messageboardsForMessbFromUserid,
			Set messageboardsForMessbToUserid) {
		this.userId = userId;
		this.userName = userName;
		this.userHeadimg = userHeadimg;
		this.userPassword = userPassword;
		this.userIndentity = userIndentity;
		this.userSex = userSex;
		this.userRegistertime = userRegistertime;
		this.userLastLogintime = userLastLogintime;
		this.userState = userState;
		this.comments = comments;
		this.myfollows = myfollows;
		this.topics = topics;
		this.articles = articles;
		this.messageboardsForMessbFromUserid = messageboardsForMessbFromUserid;
		this.messageboardsForMessbToUserid = messageboardsForMessbToUserid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserHeadimg() {
		return this.userHeadimg;
	}

	public void setUserHeadimg(String userHeadimg) {
		this.userHeadimg = userHeadimg;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserIndentity() {
		return this.userIndentity;
	}

	public void setUserIndentity(String userIndentity) {
		this.userIndentity = userIndentity;
	}

	public String getUserSex() {
		return this.userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public Timestamp getUserRegistertime() {
		return this.userRegistertime;
	}

	public void setUserRegistertime(Timestamp userRegistertime) {
		this.userRegistertime = userRegistertime;
	}

	public Timestamp getUserLastLogintime() {
		return this.userLastLogintime;
	}

	public void setUserLastLogintime(Timestamp userLastLogintime) {
		this.userLastLogintime = userLastLogintime;
	}

	public Short getUserState() {
		return this.userState;
	}

	public void setUserState(Short userState) {
		this.userState = userState;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

	public Set getMyfollows() {
		return this.myfollows;
	}

	public void setMyfollows(Set myfollows) {
		this.myfollows = myfollows;
	}

	public Set getTopics() {
		return this.topics;
	}

	public void setTopics(Set topics) {
		this.topics = topics;
	}

	public Set getArticles() {
		return this.articles;
	}

	public void setArticles(Set articles) {
		this.articles = articles;
	}

	public Set getMessageboardsForMessbFromUserid() {
		return this.messageboardsForMessbFromUserid;
	}

	public void setMessageboardsForMessbFromUserid(
			Set messageboardsForMessbFromUserid) {
		this.messageboardsForMessbFromUserid = messageboardsForMessbFromUserid;
	}

	public Set getMessageboardsForMessbToUserid() {
		return this.messageboardsForMessbToUserid;
	}

	public void setMessageboardsForMessbToUserid(
			Set messageboardsForMessbToUserid) {
		this.messageboardsForMessbToUserid = messageboardsForMessbToUserid;
	}

}