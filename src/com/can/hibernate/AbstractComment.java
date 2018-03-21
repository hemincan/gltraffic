package com.can.hibernate;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractComment entity provides the base persistence definition of the
 * Comment entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractComment implements java.io.Serializable {

	// Fields

	private Integer id;
	private Topic topic;
	private User user;
	private Comment comment;
	private String commentContent;
	private Timestamp commentTime;
	private Short commentState;
	private Short commentStateQuote;
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractComment() {
	}

	/** minimal constructor */
	public AbstractComment(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

	/** full constructor */
	public AbstractComment(Topic topic, User user, Comment comment,
			String commentContent, Timestamp commentTime, Short commentState,
			Short commentStateQuote, Set comments) {
		this.topic = topic;
		this.user = user;
		this.comment = comment;
		this.commentContent = commentContent;
		this.commentTime = commentTime;
		this.commentState = commentState;
		this.commentStateQuote = commentStateQuote;
		this.comments = comments;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Topic getTopic() {
		return this.topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Comment getComment() {
		return this.comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public String getCommentContent() {
		return this.commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Timestamp getCommentTime() {
		return this.commentTime;
	}

	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}

	public Short getCommentState() {
		return this.commentState;
	}

	public void setCommentState(Short commentState) {
		this.commentState = commentState;
	}

	public Short getCommentStateQuote() {
		return this.commentStateQuote;
	}

	public void setCommentStateQuote(Short commentStateQuote) {
		this.commentStateQuote = commentStateQuote;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}