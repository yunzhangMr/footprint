package com.aj.general.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;

import com.aj.footprint.model.vo.Pagination;
import com.aj.general.SmartGrid;

public interface BaseDaoI<T> {

	public Serializable save(T o);

	public void delete(T o);

	public void update(T o);
	
	public void saveOrUpdate(T o);
	public void merge(T o);

	public List<T> find(String hql);
	
	public List findSQL(String hql, Class T);
	
	public List findSQL(String hql);

	public List<T> find(String hql, Object[] param);

	public List<T> find(String hql, List<Object> param);

	/**
	 * @param page
	 *            which pag to display
	 * @param rows
	 *            how many records in each page
	 */
	public List<T> find(String hql, Object[] param, Integer page, Integer rows);

	public List<T> find(String hql, List<Object> param, Integer page, Integer rows);
	
	/**
	 * 根据limit，offset 查询出对应的结果集，参数为object数组
	 * @param hql
	 * @param param 
	 * @param offset
	 * @param limit
	 * @return
	 */
	public List<T> findByOL(String hql, Object[] param, Integer offset, Integer limit);
	
	/**
	 * 根据limit，offset 查询出对应的结果集，参数为list集合
	 * @param hql
	 * @param param
	 * @param offset
	 * @param limit
	 * @return
	 */
	public List<T> findByOL(String hql, List<Object> param, Integer offset, Integer limit);

	public T get(Class<T> c, Serializable id);

	public T get(String hql, Object[] param);

	public T get(String hql, List<Object> param);

	public Long count(String hql);

	public Long count(String hql, Object[] param);

	public Long count(String hql, List<Object> param);

	/**
	 * @return number of results
	 */
	public Integer executeHql(String hql);

	public Integer executeHql(String hql, Object[] param);

	public Integer executeHql(String hql, List<Object> param);
	
	/**
	 * 根据sql得到List<Map<String ,Object>> 结果集 多列，每列都是map
	 * @param sql
	 * @return
	 */
	public List<Map<String ,Object>> query(String sql);
	
	public SmartGrid pageBySql(final String sql, final int startIndex,
			final int count);
	
	public List<?> queryListByOption(String sql,Class<?> o);
	
	/**
	 * 根据sql返回总数
	 * @param sql
	 * @return
	 */
	public Long countBySql(String sql);
	
	
	public Object getValueBySql(String sql);
	
	/**
	 * 根据sql,offset,limit返回一个泛型vo对象
	 * @param sql
	 * @return
	 */
	public List<T> queryBySql(String sql,String className,Integer offset,Integer limit);
	
	/**
	 * 执行sql返回影响的行数
	 * @param sql
	 * @return
	 */
	public int excuteBySql(String sql); 
	
	
	/**
	 * 根据sql,offset,limit返回一个Pagination对象
	 * @param sql
	 * @param limit
	 * @param offset
	 * @return
	 */
	public Pagination queryPage(String sql,Integer limit,Integer offset);
	
	public int updateBySql(String sql,Object[] args);
	
	public int findCountBySql(String sql,Object[] args);
	
    public Map<String,Object> findVo(String sql,Object[] args);
    
    public Map<String,Object> findVoBySql(String sql);
    
    public List<Map<String,Object>> queryListBySql(String sql,Object[] args);
    
    public  Map<String,Object> queryObjBysql(String sql,Object[] args);
}
