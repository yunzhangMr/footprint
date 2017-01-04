package com.aj.footprint.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.footprint.model.po.TBabyClasses;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.service.BabyClassServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("babyClassesService")
public class BabyClassServiceImpl implements BabyClassServiceI {
	
	@Autowired
	private BaseDaoI<TBabyClasses> babyClassesDao;

	/*public List<Map<String, Object>> queryBabys(String classid, String status) {
		String sql = "select b.*,bc.class_id from f_baby b left join f_baby_class bc on b.id=bc.baby_id where bc.`status`='N' ";
		if(!StringUtils.isEmpty((String)params.get("name"))){
			sql += " and username like '%%"+(String)params.get("name")+"%%'";
		}
		return null;
	}*/

	public Pagination queryPage(Integer limit, Integer offset,
			Map<String, Object> params) {
		String sql = "select b.*,bc.id b_c_id,c.id class_id,c.cname class_name,c.grade,c.cnum from f_baby b left join f_baby_class bc on b.id=bc.baby_id left join f_class c on bc.class_id=c.id where 1=1 ";
		if(!StringUtils.isEmpty((String)params.get("classId"))){
			sql += " and bc.class_id='"+(String)params.get("classId")+"'";
		}
		if(!StringUtils.isEmpty((String)params.get("status"))){
			sql += " and bc.`status` = '"+(String)params.get("status")+"'";
		}
		if(!StringUtils.isEmpty((String)params.get("name"))){
			sql += " and b.bname like '%%"+(String)params.get("name")+"%%'";
		}
		if(!StringUtils.isEmpty((String)params.get("birth"))){
			sql += " and b.birth = '"+(String)params.get("name")+"'";
		}
		if(!StringUtils.isEmpty((String)params.get("grade"))){
			sql += " and c.grade = '"+(String)params.get("grade")+"'";
		}
		if(!StringUtils.isEmpty((String)params.get("cnum"))){
			sql += " and c.cnum = '"+(String)params.get("cnum")+"'";
		}
		System.out.println(sql);
		return babyClassesDao.queryPage(sql,limit,offset);
	}

	public List<Map<String, Object>> queryBabys(Map<String, Object> params) {
		String sql = "select b.*,bc.class_id from f_baby b left join f_baby_class bc on b.id=bc.baby_id where 1=1 ";
		if(!StringUtils.isEmpty((String)params.get("classId"))){
			sql += " and bc.class_id='"+(String)params.get("classId")+"'";
		}
		if(!StringUtils.isEmpty((String)params.get("status"))){
			sql += " and bc.`status` = '"+(String)params.get("status")+"'";
		}
		if(!StringUtils.isEmpty((String)params.get("name"))){
			sql += " and b.bname like '%%"+(String)params.get("name")+"%%'";
		}
		if(!StringUtils.isEmpty((String)params.get("birth"))){
			sql += " and b.birth like '%%"+(String)params.get("birth")+"%%'";
		}
		System.out.println(sql);
		return babyClassesDao.query(sql);
	}

	public void update(TBabyClasses p) {
		babyClassesDao.update(p);
	}

	public void updateClass(String nursery_id, String createyear, String term,
			String grade, String cnum, String baby_id) {
		String sql = "insert into f_baby_class(class_id,baby_id,status) (select id,'"+baby_id+"','N' from f_class where nursery_id='"+nursery_id+"' and createyear='"+createyear+"' and term='"+term+"' and grade='"+grade+"' and cnum='"+cnum+"')";
		System.out.println(sql);
		babyClassesDao.excuteBySql(sql);
	}

}
