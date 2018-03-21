package com.can.hibernate;

import java.sql.Timestamp;
import java.util.Set;

/**
 * Topic entity. @author MyEclipse Persistence Tools
 */
public class Topic extends AbstractTopic implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Topic() {
	}

	/** minimal constructor */
	public Topic(User user, Integer topicEgg, Timestamp topicPublicTime,
			Timestamp topicLastUpdatetime, Integer topicReaded,
			Integer topicState) {
		super(user, topicEgg, topicPublicTime, topicLastUpdatetime,
				topicReaded, topicState);
	}

	/** full constructor */
	public Topic(User user, String topicTiltle, String topicContent,
			String topicImages, Integer topicEgg, Timestamp topicPublicTime,
			String topicType, Timestamp topicLastUpdatetime,
			Integer topicReaded, Integer topicState, String topicLocation,
			Set myfollows, Set comments) {
		super(user, topicTiltle, topicContent, topicImages, topicEgg,
				topicPublicTime, topicType, topicLastUpdatetime, topicReaded,
				topicState, topicLocation, myfollows, comments);
	}

}
