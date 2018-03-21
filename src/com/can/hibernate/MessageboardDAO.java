package com.can.hibernate;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Messageboard entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.can.hibernate.Messageboard
 * @author MyEclipse Persistence Tools
 */
public class MessageboardDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(MessageboardDAO.class);
	// property constants
	public static final String MESSB_CONTENT = "messbContent";
	public static final String MESSB_TYPE = "messbType";
	public static final String MESSB_STATUS = "messbStatus";

	public void save(Messageboard transientInstance) {
		log.debug("saving Messageboard instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Messageboard persistentInstance) {
		log.debug("deleting Messageboard instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Messageboard findById(java.lang.Integer id) {
		log.debug("getting Messageboard instance with id: " + id);
		try {
			Messageboard instance = (Messageboard) getSession().get(
					"com.can.hibernate.Messageboard", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Messageboard instance) {
		log.debug("finding Messageboard instance by example");
		try {
			List results = getSession()
					.createCriteria("com.can.hibernate.Messageboard")
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
		log.debug("finding Messageboard instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Messageboard as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMessbContent(Object messbContent) {
		return findByProperty(MESSB_CONTENT, messbContent);
	}

	public List findByMessbType(Object messbType) {
		return findByProperty(MESSB_TYPE, messbType);
	}

	public List findByMessbStatus(Object messbStatus) {
		return findByProperty(MESSB_STATUS, messbStatus);
	}

	public List findAll() {
		log.debug("finding all Messageboard instances");
		try {
			String queryString = "from Messageboard";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Messageboard merge(Messageboard detachedInstance) {
		log.debug("merging Messageboard instance");
		try {
			Messageboard result = (Messageboard) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Messageboard instance) {
		log.debug("attaching dirty Messageboard instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Messageboard instance) {
		log.debug("attaching clean Messageboard instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}