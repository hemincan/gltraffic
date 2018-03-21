package com.can.hibernate;

import java.sql.Timestamp;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(Timestamp userRegistertime, Timestamp userLastLogintime) {
		super(userRegistertime, userLastLogintime);
	}

	/** full constructor */
	public User(String userId, String userName, String userHeadimg,
			String userPassword, String userIndentity, String userSex,
			Timestamp userRegistertime, Timestamp userLastLogintime,
			Short userState, Set comments, Set myfollows, Set topics,
			Set articles, Set messageboardsForMessbFromUserid,
			Set messageboardsForMessbToUserid) {
		super(userId, userName, userHeadimg, userPassword, userIndentity,
				userSex, userRegistertime, userLastLogintime, userState,
				comments, myfollows, topics, articles,
				messageboardsForMessbFromUserid, messageboardsForMessbToUserid);
	}

}
