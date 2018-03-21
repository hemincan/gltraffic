package com.can.hibernate;

/**
 * Trafficlearn entity. @author MyEclipse Persistence Tools
 */
public class Trafficlearn extends AbstractTrafficlearn implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Trafficlearn() {
	}

	/** full constructor */
	public Trafficlearn(Marktype marktype, String image, String describe,
			String name) {
		super(marktype, image, describe, name);
	}

}
