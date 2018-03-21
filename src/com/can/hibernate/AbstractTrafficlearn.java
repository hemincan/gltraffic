package com.can.hibernate;

/**
 * AbstractTrafficlearn entity provides the base persistence definition of the
 * Trafficlearn entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractTrafficlearn implements java.io.Serializable {

	// Fields

	private Integer id;
	private Marktype marktype;
	private String image;
	private String describe;
	private String name;

	// Constructors

	/** default constructor */
	public AbstractTrafficlearn() {
	}

	/** full constructor */
	public AbstractTrafficlearn(Marktype marktype, String image,
			String describe, String name) {
		this.marktype = marktype;
		this.image = image;
		this.describe = describe;
		this.name = name;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Marktype getMarktype() {
		return this.marktype;
	}

	public void setMarktype(Marktype marktype) {
		this.marktype = marktype;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}