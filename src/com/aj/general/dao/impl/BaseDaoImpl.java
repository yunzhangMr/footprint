package com.aj.general.dao.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.aj.footprint.model.vo.Pagination;
import com.aj.general.SmartGrid;
import com.aj.general.dao.BaseDaoI;

@Repository("baseDao")
public class BaseDaoImpl<T> implements BaseDaoI<T> {

	private SessionFactory sessionFactory;
	private DataSource dataSource;
	

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	public Serializable save(T o) {
		return this.getCurrentSession().save(o);
	}

	public void delete(T o) {
		this.getCurrentSession().delete(o);
	}

	public void update(T o) {
		this.getCurrentSession().update(o);
	}

	public void saveOrUpdate(T o) {
		this.getCurrentSession().saveOrUpdate(o);
		this.getCurrentSession().flush();
	}
	public void merge(T o) {
		this.getCurrentSession().merge(o);
	}

	public List<T> find(String hql) {
		return this.getCurrentSession().createQuery(hql).list();
	}
	
	public List findSQL(String hql, Class T) {
		return this.getCurrentSession().createSQLQuery(hql).addEntity(T).list();
	}
	
	public List findSQL(String hql) {
		return this.getCurrentSession().createSQLQuery(hql).list();
	}

	public List<T> find(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.list();
	}

	public List<T> find(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.list();
	}

	public List<T> find(String hql, Object[] param, Integer page, Integer rows) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 10;
		}
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	public List<T> find(String hql, List<Object> param, Integer page, Integer rows) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 10;
		}
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	public T get(Class<T> c, Serializable id) {
		return (T) this.getCurrentSession().get(c, id);
	}

	public T get(String hql, Object[] param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}

	public T get(String hql, List<Object> param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}

	public Long count(String hql) {
		return (Long) this.getCurrentSession().createQuery(hql).uniqueResult();
	}

	public Long count(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return (Long) q.uniqueResult();
	}

	public Long count(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return (Long) q.uniqueResult();
	}

	public Integer executeHql(String hql) {
		return this.getCurrentSession().createQuery(hql).executeUpdate();
	}

	public Integer executeHql(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.executeUpdate();
	}

	public Integer executeHql(String hql, List<Object> param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.executeUpdate();
	}
	public List<Map<String ,Object>> query(String sql){
		JdbcTemplate jt = new JdbcTemplate(getDataSource());
		return jt.queryForList(sql);
	}
	
	//sql查询对象集合
	public List<?> queryListByOption(String sql,Class<?> o){
		JdbcTemplate jt = new JdbcTemplate(getDataSource());
		return  jt.queryForList(sql, o);
	}

	@Override
	public SmartGrid pageBySql(String sql, int startIndex, int count) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<T> findByOL(String hql, Object[] param, Integer offset,
			Integer limit) {
		if (offset == null || offset < 1) {
			offset = 1;
		}
		if (limit == null || limit < 1) {
			limit = 10;
		}
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.setFirstResult(offset).setMaxResults(limit).list();
	}

	public List<T> findByOL(String hql, List<Object> param, Integer offset,
			Integer limit) {
		if (offset == null || offset < 1) {
			offset = 0;
		}
		if (limit == null || limit < 1) {
			limit = 10;
		}
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.setFirstResult(offset).setMaxResults(limit).list();
	}

	public List<T> queryBySql(String sql, String className, Integer offset,
			Integer limit){
		if(offset==null){
			offset=0;
		}
		if(limit==null){
			limit=10;
		}
		try {
			return this.getCurrentSession().createSQLQuery(sql).addEntity(Class.forName("com.aj.footprint.model.po."+className)).setFirstResult(offset).setMaxResults(limit).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public Long countBySql(String sql) {
		BigInteger totalCount = (BigInteger)this.getCurrentSession().createSQLQuery(sql).uniqueResult();
		return totalCount.longValue();
	}
	
	public int excuteBySql(String sql) {
		return this.getCurrentSession().createSQLQuery(sql).executeUpdate();
	}


	
	
	/*public SmartGrid queryBySql(final String sql, final int startIndex,
			final int count) {
		JdbcTemplate jt = new JdbcTemplate(getDataSource());
		//jt.queryForList(sql, );
		return null;
		
	}
	
	*//**
	 * 查询数量
	 *//*
	public int queryCount(String sql){
		
		JdbcTemplate jt = new JdbcTemplate(getDataSource());	
		return jt.queryForInt(sql);
	}
	
	public void deleteBySql(T vo){
		
		JdbcTemplate jt = new JdbcTemplate(getDataSource());	
		
	}*/
	
	
	public Pagination queryPage(String sql,Integer limit,Integer offset) {  
		
		Pagination page=new Pagination(sql, offset/limit+1, limit, new JdbcTemplate(getDataSource()));
		return page;    
	}

	public Object getValueBySql(String sql) {
		return this.getCurrentSession().createSQLQuery(sql).uniqueResult();
	}
	
	//局部更新
	public int updateBySql(String sql,Object[] args){
		
		return new JdbcTemplate(getDataSource()).update(sql, args);
	}
	//查询数量
	public int findCountBySql(String sql,Object[] args){
		
		return new JdbcTemplate(getDataSource()).queryForInt(sql, args);
	}

    //查询单条记录，返回map
    public Map<String,Object> findVo(String sql,Object[] args){
		
		return new JdbcTemplate(getDataSource()).queryForMap(sql,args);
	}
    
    public Map<String,Object> findVoBySql(String sql){
		
		return new JdbcTemplate(getDataSource()).queryForMap(sql);
	}
    
    //带参查询集合
    public List<Map<String,Object>> queryListBySql(String sql,Object[] args){
    	
    	return  new JdbcTemplate(getDataSource()).queryForList(sql, args);
    }
    
    //获得单条记录列
    public  Map<String,Object> queryObjBysql(String sql,Object[] args){
       
    	return new JdbcTemplate(getDataSource()).queryForMap(sql, args);
    }
}
