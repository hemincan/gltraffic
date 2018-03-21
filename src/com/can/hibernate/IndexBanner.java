package com.can.hibernate;

import java.sql.Timestamp;

/**
 * IndexBanner entity. @author MyEclipse Persistence Tools
 */
public class IndexBanner extends AbstractIndexBanner implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public IndexBanner() {
	}

	/** full constructor */
	public IndexBanner(String image, String content, Timestamp time) {
		super(image, content, time);
	}

}
