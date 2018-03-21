package com.can.hibernate;

import java.sql.Timestamp;

/**
 * AbstractArticle entity provides the base persistence definition of the
 * Article entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractArticle implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private String articleTiltle;
	private String articleContent;
	private Timestamp articlePublictime;
	private Integer articleState;
	private Integer articleReaded;

	// Constructors

	/** default constructor */
	public AbstractArticle() {
	}

	/** minimal constructor */
	public AbstractArticle(Timestamp articlePublictime) {
		this.articlePublictime = articlePublictime;
	}

	/** full constructor */
	public AbstractArticle(User user, String articleTiltle,
			String articleContent, Timestamp articlePublictime,
			Integer articleState, Integer articleReaded) {
		this.user = user;
		this.articleTiltle = articleTiltle;
		this.articleContent = articleContent;
		this.articlePublictime = articlePublictime;
		this.articleState = articleState;
		this.articleReaded = articleReaded;
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

	public String getArticleTiltle() {
		return this.articleTiltle;
	}

	public void setArticleTiltle(String articleTiltle) {
		this.articleTiltle = articleTiltle;
	}

	public String getArticleContent() {
		return this.articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

	public Timestamp getArticlePublictime() {
		return this.articlePublictime;
	}

	public void setArticlePublictime(Timestamp articlePublictime) {
		this.articlePublictime = articlePublictime;
	}

	public Integer getArticleState() {
		return this.articleState;
	}

	public void setArticleState(Integer articleState) {
		this.articleState = articleState;
	}

	public Integer getArticleReaded() {
		return this.articleReaded;
	}

	public void setArticleReaded(Integer articleReaded) {
		this.articleReaded = articleReaded;
	}

}