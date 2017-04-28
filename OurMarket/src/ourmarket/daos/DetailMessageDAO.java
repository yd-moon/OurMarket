package ourmarket.daos;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import ourmarket.models.DetailMessage;

/**
 * A data access object (DAO) providing persistence and search support for
 * DetailMessage entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see ourmarket.models.DetailMessage
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class DetailMessageDAO {
	private static final Logger log = LoggerFactory.getLogger(DetailMessageDAO.class);
	// property constants
	public static final String MID = "mid";
	public static final String MCONTENT = "mcontent";

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(DetailMessage transientInstance) {
		log.debug("saving DetailMessage instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(DetailMessage persistentInstance) {
		log.debug("deleting DetailMessage instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public DetailMessage findById(java.lang.Long id) {
		log.debug("getting DetailMessage instance with id: " + id);
		try {
			DetailMessage instance = (DetailMessage) getCurrentSession().get("ourmarket.models.DetailMessage", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(DetailMessage instance) {
		log.debug("finding DetailMessage instance by example");
		try {
			List results = getCurrentSession().createCriteria("ourmarket.models.DetailMessage")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding DetailMessage instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from DetailMessage as model where model." + propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMid(Object mid) {
		return findByProperty(MID, mid);
	}

	public List findByMcontent(Object mcontent) {
		return findByProperty(MCONTENT, mcontent);
	}

	public List findAll() {
		log.debug("finding all DetailMessage instances");
		try {
			String queryString = "from DetailMessage";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public DetailMessage merge(DetailMessage detachedInstance) {
		log.debug("merging DetailMessage instance");
		try {
			DetailMessage result = (DetailMessage) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(DetailMessage instance) {
		log.debug("attaching dirty DetailMessage instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(DetailMessage instance) {
		log.debug("attaching clean DetailMessage instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static DetailMessageDAO getFromApplicationContext(ApplicationContext ctx) {
		return (DetailMessageDAO) ctx.getBean("DetailMessageDAO");
	}
}