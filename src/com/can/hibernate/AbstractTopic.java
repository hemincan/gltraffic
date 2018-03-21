package com.can.hibernate;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractTopic entity provides the base persistence definition of the Topic
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractTopic implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private String topicTiltle;
	private String topicContent;
	private String topicImages;
	private Integer topicEgg;
	private Timestamp topicPublicTime;
	private String topicType;
	private Timestamp topicLastUpdatetime;
	private Integer topicReaded;
	private Integer topicState;
	private String topicLocation;
	private Set myfollows = new HashSet(0);
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractTopic() {
	}

	/** minimal constructor */
	public AbstractTopic(User user, Integer topicEgg,
			Timestamp topicPublicTime, Timestamp topicLastUpdatetime,
			Integer topicReaded, Integer topicState) {
		this.user = user;
		this.topicEgg = topicEgg;
		this.topicPublicTime = topicPublicTime;
		this.topicLastUpdatetime = topicLastUpdatetime;
		this.topicReaded = topicReaded;
		this.topicState = topicState;
	}

	/** full constructor */
	public AbstractTopic(User user, String topicTiltle, String topicContent,
			String topicImages, Integer topicEgg, Timestamp topicPublicTime,
			String topicType, Timestamp topicLastUpdatetime,
			Integer topicReaded, Integer topicState, String topicLocation,
			Set myfollows, Set comments) {
		this.user = user;
		this.topicTiltle = topicTiltle;
		this.topicContent = topicContent;
		this.topicImages = topicImages;
		this.topicEgg = topicEgg;
		this.topicPublicTime = topicPublicTime;
		this.topicType = topicType;
		this.topicLastUpdatetime = topicLastUpdatetime;
		this.topicReaded = topicReaded;
		this.topicState = topicState;
		this.topicLocation = topicLocation;
		this.myfollows = myfollows;
		this.comments = comments;
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

	public String getTopicTiltle() {
		return this.topicTiltle;
	}

	public void setTopicTiltle(String topicTiltle) {
		this.topicTiltle = topicTiltle;
	}

	public String getTopicContent() {
		return this.topicContent;
	}

	public void setTopicContent(String topicContent) {
		this.topicContent = topicContent;
	}

	public String getTopicImages() {
		return this.topicImages;
	}

	public void setTopicImages(String topicImages) {
		this.topicImages = topicImages;
	}

	public Integer getTopicEgg() {
		return this.topicEgg;
	}

	public void setTopicEgg(Integer topicEgg) {
		this.topicEgg = topicEgg;
	}

	public Timestamp getTopicPublicTime() {
		return this.topicPublicTime;
	}

	public void setTopicPublicTime(Timestamp topicPublicTime) {
		this.topicPublicTime = topicPublicTime;
	}

	public String getTopicType() {
		return this.topicType;
	}

	public void setTopicType(String topicType) {
		this.topicType = topicType;
	}

	public Timestamp getTopicLastUpdatetime() {
		return this.topicLastUpdatetime;
	}

	public void setTopicLastUpdatetime(Timestamp topicLastUpdatetime) {
		this.topicLastUpdatetime = topicLastUpdatetime;
	}

	public Integer getTopicReaded() {
		return this.topicReaded;
	}

	public void setTopicReaded(Integer topicReaded) {
		this.topicReaded = topicReaded;
	}

	public Integer getTopicState() {
		return this.topicState;
	}

	public void setTopicState(Integer topicState) {
		this.topicState = topicState;
	}

	public String getTopicLocation() {
		return this.topicLocation;
	}

	public void setTopicLocation(String topicLocation) {
		this.topicLocation = topicLocation;
	}

	public Set getMyfollows() {
		return this.myfollows;
	}

	public void setMyfollows(Set myfollows) {
		this.myfollows = myfollows;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}