package com.can.hibernate;

/**
 * MyfollowId entity. @author MyEclipse Persistence Tools
 */
public class MyfollowId extends AbstractMyfollowId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public MyfollowId() {
	}

	/** full constructor */
	public MyfollowId(User user, Topic topic) {
		super(user, topic);
	}

}
