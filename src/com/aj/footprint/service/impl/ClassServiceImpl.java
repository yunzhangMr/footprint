package com.aj.footprint.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aj.footprint.model.po.TClass;
import com.aj.footprint.model.po.TClass;
import com.aj.footprint.model.vo.Classes;
import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.User;
import com.aj.footprint.service.ClassServicel;
import com.aj.general.dao.BaseDaoI;
import com.aj.general.util.Encrypt;

@Service("classService")
public class ClassServiceImpl implements ClassServicel{
	
	@Autowired
	private BaseDaoI<TClass> classDao;
	

	public List<Map<String ,Object>> query(Map<String,Object> params){
		return classDao.query("select id as classid,cname as name,teacher1name,teacher2name,teacher3name from f_class");
	}
/*	public List<T> queryListByOption(String sql,Map<String,Object> params){
		
		return classDao.queryListByOption("select id as classid,cname as name,teacher1name,teacher2name,teacher3name from f_class", TClass.class);
	}*/
	@Override
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED, isolation = Isolation.REPEATABLE_READ)
	public void saveOrUpdateClass(TClass tclass){
		
		classDao.saveOrUpdate(tclass);
	}
	@Override
	public DataGrid datagrid(Classes clazz) {
		DataGrid j = new DataGrid();
		j.setRows(this.changeModel(this.find(clazz)));
		j.setTotal(this.total(clazz));
		return j;
	}

	private List<Classes> changeModel(List<TClass> TClasses) {
		List<Classes> classes = new ArrayList<Classes>();
		if (TClasses != null && TClasses.size() > 0) {
			for (TClass tu : TClasses) {
				Classes u = new Classes();
				BeanUtils.copyProperties(tu, u);
				classes.add(u);
			}
		}
		return classes;
	}
	
	private List<TClass> find(Classes clazz) {
		String hql = "from TClass t where 1=1 ";

		List<Object> values = new ArrayList<Object>();
		hql = addWhere(clazz, hql, values);

		if (clazz.getSort() != null && clazz.getOrder() != null) {
			hql += " order by " + clazz.getSort() + " " + clazz.getOrder();
		}
		return classDao.findByOL(hql, values, clazz.getOffset(), clazz.getLimit());
	}
	
	private Long total(Classes clazz) {
		String hql = "select count(*) from TClass t where 1=1 ";
		List<Object> values = new ArrayList<Object>();
		hql = addWhere(clazz, hql, values);
		return classDao.count(hql, values);
	}

	private String addWhere(Classes clazz, String hql, List<Object> values) {
		if (clazz.getCname()!= null && !clazz.getCname().trim().equals("")) {
			hql += " and t.name like ? ";
			values.add("%%" + clazz.getCname().trim() + "%%");
		}
		if (clazz.getTeacherName()!= null && !clazz.getTeacherName().trim().equals("")) {
			hql += " and ( t.teacher1name like ? or t.teacher2name like ? or t.teacher3name like ?)";
			values.add("%%" + clazz.getTeacherName().trim() + "%%");
			values.add("%%" + clazz.getTeacherName().trim() + "%%");
			values.add("%%" + clazz.getTeacherName().trim() + "%%");
		}

		return hql;
	}
	
	
	/**
	 * 将po对象转换为vo对象，（修改时只需把TXX类改为对应的po对象，XX对象改为vo对象即可）
	 * @param ps
	 * @return
	 */
	private List<Classes> changeToVO(List<TClass> ps) {
		List<Classes> vs = new ArrayList<Classes>();
		if (ps != null && ps.size() > 0) {
			for (TClass p : ps) {
				Classes v = new Classes();
				BeanUtils.copyProperties(p, v);
				vs.add(v);
			}
		}
		return vs;
	}
	
	public Map<String, Object> queryByCondition(Classes clazz) {
		Map<String, Object> map = new HashMap<String, Object>();
		String sqlQuery = "select * from f_class where 1=1";
		String sqlCount = "select count(*) from f_class where 1=1";
		String sqlAddWhere = "";
		
		if(clazz.getTeacherName()!=null && !"".equals(clazz.getTeacherName().trim())){
			sqlAddWhere += " and ( teacher1name like '%%"+clazz.getTeacherName().trim()+"%%'"
				+" or teacher2name like '%%"+clazz.getTeacherName().trim()+"%%'"
				+" or teacher3name like '%%"+clazz.getTeacherName().trim()+"%%'"
				+")";
		}
		if(clazz.getCname()!=null && !"".equals(clazz.getCname().trim())){
			sqlAddWhere += " and cname like '%%"+clazz.getCname().trim()+"%%'";
		}
		map.put("rows", changeToVO(classDao.queryBySql(sqlQuery+sqlAddWhere, "TClass", clazz.getOffset(), clazz.getLimit())));
		map.put("total", classDao.countBySql(sqlCount+sqlAddWhere));
		return map;
	}
	
	public void update(Classes clazz) {
		TClass p = classDao.get(TClass.class, clazz.getId());
		BeanUtils.copyProperties(clazz, p);
		classDao.update(p);
	}

	public Pagination queryPageTClass(Integer limit,Integer offset,Map<String,Object> params){
		String sql = "select * from f_class  where status='Y'";
		if(!StringUtils.isEmpty((String)params.get("name"))){
			sql += " and cname like '%%"+(String)params.get("name")+"%%'";
		}
		if(!StringUtils.isEmpty((String)params.get("teacherName"))){
			sql += " and ( teacher1name like '%%"+(String)params.get("teacherName")+"%%'"
				+" or teacher2name like '%%"+(String)params.get("teacherName")+"%%'"
				+" or teacher3name like '%%"+(String)params.get("teacherName")+"%%'"
				+")";
		}
		sql += "order by id desc";
		/*System.out.println(sql);*/
		return classDao.queryPage(sql,limit,offset);	
		
	}
	public Integer save(Classes clazz) {
		TClass p = new TClass();
		BeanUtils.copyProperties(clazz, p);
		return (Integer)classDao.save(p);
	}
	
	public List<Map<String, Object>> getCNumNoUse(String createyear, String grade, String term) {
		String sql = "select cnum from f_class where status = 'Y' and createyear='"+createyear+"' and grade='"+grade+"' and term='"+term+"' order by CONVERT(cnum,SIGNED) asc";
		return classDao.query(sql);
		
//		List<Map<String, Object>> results = classDao.query(sql);
//		int total = 0;
//		List<Integer> numList = new ArrayList<Integer>(); 
//		System.out.println(results);
//		for(Map<String, Object> map : results){
//			numList.add(Integer.valueOf(map.get("cnum").toString()));
//			total = Integer.parseInt(map.get("total").toString());
//		}
//		
//		for(int i=0;i<total-1;i++){
//			if(!numList.contains(Integer.valueOf(i))){
//				
//			}
//		}
	}
	
	public String getMaxCNum(String createyear, String grade, String term) {
		String sql = "select IFNULL((select max(cnum) from f_class where status='Y' and createyear='"+createyear+"' and grade='"+grade+"' and term='"+term+"'),0)";
		return (String)classDao.getValueBySql(sql);
	}
	
	public Long checkHaveBaby(String id) {
		String sql = "select count(*) from f_baby_class where status='N' and class_id='"+id+"'";
		BigInteger value = (BigInteger)classDao.getValueBySql(sql);
		return value.longValue();
	}
}
