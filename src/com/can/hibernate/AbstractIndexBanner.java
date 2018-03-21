package com.can.hibernate;

import java.sql.Timestamp;

/**
 * AbstractIndexBanner entity provides the base persistence definition of the
 * IndexBanner entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractIndexBanner implements java.io.Serializable {

	// Fields

	private Integer id;
	private String image;
	private String content;
	private Timestamp time;

	// Constructors

	/** default constructor */
	public AbstractIndexBanner() {
	}

	/** full constructor */
	public AbstractIndexBanner(String image, String content, Timestamp time) {
		this.image = image;
		this.content = content;
		this.time = time;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

}