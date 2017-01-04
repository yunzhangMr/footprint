package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;

import com.aj.footprint.model.po.TClass;
import com.aj.footprint.model.vo.Classes;
import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.User;

public interface ClassServicel {

	/**
	 * 获得班级列表
	 */
	public void saveOrUpdateClass(TClass tclass);
	public List<Map<String ,Object>> query(Map<String,Object> params);
	/*public List<T> queryListByOption(String sql,Object o);*/
	
	/**
	 * hql语句查询，根据vo实体查询得到DataGrid对象（rows，total）
	 */
	public DataGrid datagrid(Classes clazz);
	
	/**
	 * 根据vo对象，生成sql语句查询，返回map(total,rows)
	 * @param clazz
	 * @return 
	 */
	public Map<String,Object> queryByCondition(Classes clazz);
	
	
	
	/**
	 * 更新class对象到数据库中
	 * @param clazz
	 */
	public void update(Classes clazz);
	
	/**
	 * 保存class对象到数据库中
	 * @param clazz
	 */
	public Integer save(Classes clazz);
	
	/**
	 * 根据limit，offset，map条件查询 结果集
	 * @param limit
	 * @param offset
	 * @param params map条件
	 * @return
	 */
	public Pagination queryPageTClass(Integer limit,Integer offset,Map<String,Object> params);
	
	/**
	 * 根据createyear,grade,term 得到未使用的班级编号
	 * @param createyear
	 * @param grade
	 * @param term
	 * @return
	 */
	public List<Map<String, Object>> getCNumNoUse(String createyear,String grade,String term);
	
	/**
	 * 根据createyear,grade,term 得到最大的班级编号
	 * @param createyear
	 * @param grade
	 * @param term
	 * @return
	 */
	public String getMaxCNum(String createyear,String grade,String term);
	
	/**
	 * 根据班级id，判断是否存在宝宝，状态为N,（结果为0，就是不存在，否则存在）
	 * @param id
	 * @return
	 */
	public Long checkHaveBaby(String id);
}
