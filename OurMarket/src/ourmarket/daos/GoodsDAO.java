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

import ourmarket.models.Collection;
import ourmarket.models.Goods;

/**
 * A data access object (DAO) providing persistence and search support for Goods
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see ourmarket.models.Goods
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class GoodsDAO {
	private static final Logger log = LoggerFactory.getLogger(GoodsDAO.class);
	// property constants
	public static final String UID = "uid";
	public static final String IMAGE_LIST_ID = "imageListId";
	public static final String GNAME = "gname";
	public static final String GNUM = "gnum";
	public static final String GVIEW_NUM = "gviewNum";
	public static final String GTITLE = "gtitle";
	public static final String GPRICE = "gprice";
	public static final String GBRIFE_INTRODUCTION = "gbrifeIntroduction";
	public static final String GSTATE = "gstate";
	public static final String GTYPE = "gtype";
	public static final String GLOCATION = "glocation";
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

	public void save(Goods transientInstance) {
		log.debug("saving Goods instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Goods persistentInstance) {
		log.debug("deleting Goods instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	
	public void update(Goods transientInstance) {
		log.debug("updateing Goods instance");
		try {
			getCurrentSession().update(transientInstance);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}

	public Goods findById(java.lang.Integer id) {
		log.debug("getting Goods instance with id: " + id);
		try {
			Goods instance = (Goods) getCurrentSession().get("ourmarket.models.Goods", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Goods instance) {
		log.debug("finding Goods instance by example");
		try {
			List results = getCurrentSession().createCriteria("ourmarket.models.Goods").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Goods instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from Goods as model where model." + propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUid(Object uid) {
		return findByProperty(UID, uid);
	}
	public List findByLocation(Object glocation) {
		return findByProperty(GLOCATION, glocation);
	}

	public List findByImageListId(Object imageListId) {
		return findByProperty(IMAGE_LIST_ID, imageListId);
	}

	public List findByGname(Object gname) {
		return findByProperty(GNAME, gname);
	}

	public List findByGnum(Object gnum) {
		return findByProperty(GNUM, gnum);
	}

	public List findByGviewNum(Object gviewNum) {
		return findByProperty(GVIEW_NUM, gviewNum);
	}

	public List findByGtitle(Object gtitle) {
		return findByProperty(GTITLE, gtitle);
	}

	public List findByGprice(Object gprice) {
		return findByProperty(GPRICE, gprice);
	}

	public List findByGbrifeIntroduction(Object gbrifeIntroduction) {
		return findByProperty(GBRIFE_INTRODUCTION, gbrifeIntroduction);
	}

	public List findByGstate(Object gstate) {
		return findByProperty(GSTATE, gstate);
	}

	public List findByGtype(Object gtype) {
		return findByProperty(GTYPE, gtype);
	}

	public List findAll() {
		log.debug("finding all Goods instances");
		try {
			String queryString = "from Goods";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Goods merge(Goods detachedInstance) {
		log.debug("merging Goods instance");
		try {
			Goods result = (Goods) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Goods instance) {
		log.debug("attaching dirty Goods instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Goods instance) {
		log.debug("attaching clean Goods instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (GoodsDAO) ctx.getBean("GoodsDAO");
	}
}