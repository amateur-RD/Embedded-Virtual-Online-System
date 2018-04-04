package com.dodo.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface BaseDao<T> {
	public T findByID(Class c, Serializable id) throws Exception;

	public List<T> findList(String hql) throws Exception;

	public List<T> findList(String hql, Map<String, Object> map) throws Exception;

	public List<T> findList(String hql, int page, int count) throws Exception;

	public List<T> findList(String hql, Map<String, Object> map, int page, int count) throws Exception;

	public Object findUnique(String hql, Map<String, Object> map) throws Exception;

	public Object findUnique(String hql) throws Exception;

	public void save(T t) throws Exception;

	public void delete(T t) throws Exception;

	public void update(T t) throws Exception;

	public void update(T t, Object[] obj) throws Exception;
	
	public int updateMonitor(String hql) throws Exception;
	
	public int updateDemoboard(String hql) throws Exception; 
}
