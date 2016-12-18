package com.aj.footprint.service.impl;

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
		System.out.println(sql);
		return babyClassesDao.queryPage(sql,limit,offset);
	}

}
