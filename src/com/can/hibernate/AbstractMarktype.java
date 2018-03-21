package com.can.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractMarktype entity provides the base persistence definition of the
 * Marktype entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractMarktype implements java.io.Serializable {

	// Fields

	private Integer id;
	private String typeName;
	private String typeDescribe;
	private String typeImage;
	private Set trafficlearns = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractMarktype() {
	}

	/** full constructor */
	public AbstractMarktype(String typeName, String typeDescribe,
			String typeImage, Set trafficlearns) {
		this.typeName = typeName;
		this.typeDescribe = typeDescribe;
		this.typeImage = typeImage;
		this.trafficlearns = trafficlearns;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getTypeDescribe() {
		return this.typeDescribe;
	}

	public void setTypeDescribe(String typeDescribe) {
		this.typeDescribe = typeDescribe;
	}

	public String getTypeImage() {
		return this.typeImage;
	}

	public void setTypeImage(String typeImage) {
		this.typeImage = typeImage;
	}

	public Set getTrafficlearns() {
		return this.trafficlearns;
	}

	public void setTrafficlearns(Set trafficlearns) {
		this.trafficlearns = trafficlearns;
	}

}