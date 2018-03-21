package com.can.hibernate;

import java.sql.Timestamp;
import java.util.Set;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */
public class Comment extends AbstractComment implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** minimal constructor */
	public Comment(Timestamp commentTime) {
		super(commentTime);
	}

	/** full constructor */
	public Comment(Topic topic, User user, Comment comment,
			String commentContent, Timestamp commentTime, Short commentState,
			Short commentStateQuote, Set comments) {
		super(topic, user, comment, commentContent, commentTime, commentState,
				commentStateQuote, comments);
	}

}
