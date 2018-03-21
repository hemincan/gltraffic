package com.can.hibernate;

/**
 * AbstractMyfollowId entity provides the base persistence definition of the
 * MyfollowId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractMyfollowId implements java.io.Serializable {

	// Fields

	private User user;
	private Topic topic;

	// Constructors

	/** default constructor */
	public AbstractMyfollowId() {
	}

	/** full constructor */
	public AbstractMyfollowId(User user, Topic topic) {
		this.user = user;
		this.topic = topic;
	}

	// Property accessors

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Topic getTopic() {
		return this.topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractMyfollowId))
			return false;
		AbstractMyfollowId castOther = (AbstractMyfollowId) other;

		return ((this.getUser() == castOther.getUser()) || (this.getUser() != null
				&& castOther.getUser() != null && this.getUser().equals(
				castOther.getUser())))
				&& ((this.getTopic() == castOther.getTopic()) || (this
						.getTopic() != null && castOther.getTopic() != null && this
						.getTopic().equals(castOther.getTopic())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		result = 37 * result
				+ (getTopic() == null ? 0 : this.getTopic().hashCode());
		return result;
	}

}