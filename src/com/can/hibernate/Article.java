package com.can.hibernate;

import java.sql.Timestamp;

/**
 * Article entity. @author MyEclipse Persistence Tools
 */
public class Article extends AbstractArticle implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Article() {
	}

	/** minimal constructor */
	public Article(Timestamp articlePublictime) {
		super(articlePublictime);
	}

	/** full constructor */
	public Article(User user, String articleTiltle, String articleContent,
			Timestamp articlePublictime, Integer articleState,
			Integer articleReaded) {
		super(user, articleTiltle, articleContent, articlePublictime,
				articleState, articleReaded);
	}

}
