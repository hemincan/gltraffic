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
 * Myfollow entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.can.hibernate.Myfollow
 * @author MyEclipse Persistence Tools
 */
public class MyfollowDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(MyfollowDAO.class);

	// property constants

	public void save(Myfollow transientInstance) {
		log.debug("saving Myfollow instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Myfollow persistentInstance) {
		log.debug("deleting Myfollow instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Myfollow findById(com.can.hibernate.MyfollowId id) {
		log.debug("getting Myfollow instance with id: " + id);
		try {
			Myfollow instance = (Myfollow) getSession().get(
					"com.can.hibernate.Myfollow", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Myfollow instance) {
		log.debug("finding Myfollow instance by example");
		try {
			List results = getSession()
					.createCriteria("com.can.hibernate.Myfollow")
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
		log.debug("finding Myfollow instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Myfollow as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Myfollow instances");
		try {
			String queryString = "from Myfollow";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Myfollow merge(Myfollow detachedInstance) {
		log.debug("merging Myfollow instance");
		try {
			Myfollow result = (Myfollow) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Myfollow instance) {
		log.debug("attaching dirty Myfollow instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Myfollow instance) {
		log.debug("attaching clean Myfollow instance");
		try {
			getSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}