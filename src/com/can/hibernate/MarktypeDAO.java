package com.can.hibernate;

import java.util.List;
import java.util.Set;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Marktype entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.can.hibernate.Marktype
 * @author MyEclipse Persistence Tools
 */
public class MarktypeDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(MarktypeDAO.class);
	// property constants
	public static final String TYPE_NAME = "typeName";
	public static final String TYPE_DESCRIBE = "typeDescribe";
	public static final String TYPE_IMAGE = "typeImage";

	public void save(Marktype transientInstance) {
		log.debug("saving Marktype instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Marktype persistentInstance) {
		log.debug("deleting Marktype instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Marktype findById(java.lang.Integer id) {
		log.debug("getting Marktype instance with id: " + id);
		try {
			Marktype instance = (Marktype) getSession().get(
					"com.can.hibernate.Marktype", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Marktype instance) {
		log.debug("finding Marktype instance by example");
		try {
			List results = getSession()
					.createCriteria("com.can.hibernate.Marktype")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Marktype instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Marktype as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTypeName(Object typeName) {
		return findByProperty(TYPE_NAME, typeName);
	}

	public List findByTypeDescribe(Object typeDescribe) {
		return findByProperty(TYPE_DESCRIBE, typeDescribe);
	}

	public List findByTypeImage(Object typeImage) {
		return findByProperty(TYPE_IMAGE, typeImage);
	}

	public List findAll() {
		log.debug("finding all Marktype instances");
		try {
			String queryString = "from Marktype";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Marktype merge(Marktype detachedInstance) {
		log.debug("merging Marktype instance");
		try {
			Marktype result = (Marktype) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Marktype instance) {
		log.debug("attaching dirty Marktype instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Marktype instance) {
		log.debug("attaching clean Marktype instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}