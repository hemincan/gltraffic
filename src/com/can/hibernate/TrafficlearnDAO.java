package com.can.hibernate;

import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Trafficlearn entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.can.hibernate.Trafficlearn
 * @author MyEclipse Persistence Tools
 */
public class TrafficlearnDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(TrafficlearnDAO.class);
	// property constants
	public static final String IMAGE = "image";
	public static final String DESCRIBE = "describe";
	public static final String NAME = "name";

	public void save(Trafficlearn transientInstance) {
		log.debug("saving Trafficlearn instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Trafficlearn persistentInstance) {
		log.debug("deleting Trafficlearn instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Trafficlearn findById(java.lang.Integer id) {
		log.debug("getting Trafficlearn instance with id: " + id);
		try {
			Trafficlearn instance = (Trafficlearn) getSession().get(
					"com.can.hibernate.Trafficlearn", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Trafficlearn instance) {
		log.debug("finding Trafficlearn instance by example");
		try {
			List results = getSession()
					.createCriteria("com.can.hibernate.Trafficlearn")
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
		log.debug("finding Trafficlearn instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Trafficlearn as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByImage(Object image) {
		return findByProperty(IMAGE, image);
	}

	public List findByDescribe(Object describe) {
		return findByProperty(DESCRIBE, describe);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findAll() {
		log.debug("finding all Trafficlearn instances");
		try {
			String queryString = "from Trafficlearn";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Trafficlearn merge(Trafficlearn detachedInstance) {
		log.debug("merging Trafficlearn instance");
		try {
			Trafficlearn result = (Trafficlearn) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Trafficlearn instance) {
		log.debug("attaching dirty Trafficlearn instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Trafficlearn instance) {
		log.debug("attaching clean Trafficlearn instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}