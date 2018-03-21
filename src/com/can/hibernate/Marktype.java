package com.can.hibernate;

import java.util.Set;

/**
 * Marktype entity. @author MyEclipse Persistence Tools
 */
public class Marktype extends AbstractMarktype implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Marktype() {
	}

	/** full constructor */
	public Marktype(String typeName, String typeDescribe, String typeImage,
			Set trafficlearns) {
		super(typeName, typeDescribe, typeImage, trafficlearns);
	}

}
