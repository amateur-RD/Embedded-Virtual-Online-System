package com.dodo.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class BaseDaoImp<T> implements BaseDao<T> {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session session;

	private Query query;

	public T findByID(Class c, Serializable id) throws Exception {

		session = sessionFactory.getCurrentSession();
		return (T) session.get(c, id);
	}

	public List<T> findList(String hql) throws Exception {
		session = sessionFactory.getCurrentSession();
		query = session.createQuery(hql);
		return query.list();
	}

	public List<T> findList(String hql, Map<String, Object> map)
			throws Exception {

		session = sessionFactory.getCurrentSession();
		List<T> list = null;
		query = session.createQuery(hql);
		if (map != null && !map.isEmpty()) {
			query.setProperties(map);
			list = query.list();
		}
		return list;
	}

	public List<T> findList(String hql, int page, int count) throws Exception {
		session = sessionFactory.getCurrentSession();
		query = session.createQuery(hql);
		query.setMaxResults(count);
		query.setFirstResult((page - 1) * count);
		return query.list();
	}

	public List<T> findList(String hql, Map<String, Object> map, int page,
			int count) throws Exception {
		session = sessionFactory.getCurrentSession();
		List<T> list = null;
		query = session.createQuery(hql);
		if (map != null && !map.isEmpty()) {
			query.setProperties(map);
			query.setMaxResults(count);
			query.setFirstResult((page - 1) * count);
			list = query.list();
		}
		return list;
	}

	public Object findUnique(String hql, Map<String, Object> map)
			throws Exception {
		session = sessionFactory.getCurrentSession();
		query = session.createQuery(hql);
		Object obj = null;
		if (map != null && !map.isEmpty()) {
			query.setProperties(map);
			obj = query.uniqueResult();
		}
		return obj;
	}

	public Object findUnique(String hql) throws Exception {
		session = sessionFactory.getCurrentSession();
		query = session.createQuery(hql);
		return query.uniqueResult();
	}

	public void save(T t) throws Exception {
		sessionFactory.getCurrentSession().save(t);
		
	}

	public void delete(T t) throws Exception {
		sessionFactory.getCurrentSession().delete(t);
	}

	public void update(T t) throws Exception {
		sessionFactory.getCurrentSession().update(t);
	}

	public void update(T t, Object[] obj) throws Exception {
		session = sessionFactory.getCurrentSession();
		for (Object o : obj) {
			session.evict(o);// 清空对象
		}
		session.update(t);
	}
	public int updateMonitor(String hql) throws Exception {
		session = sessionFactory.openSession();
		query=session.createQuery(hql);
		int ret=query.executeUpdate();
		session.close();
		return ret;
	}
	public int updateDemoboard(String hql) throws Exception {
		session = sessionFactory.openSession();
		query=session.createQuery(hql);
		int ret=query.executeUpdate();
		session.close();
		return ret;
	}

}
