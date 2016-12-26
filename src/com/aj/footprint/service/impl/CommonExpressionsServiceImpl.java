package com.aj.footprint.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.aj.footprint.model.po.TCommonExpressions;
import com.aj.footprint.model.po.THealth;
import com.aj.footprint.service.CommonExpressionsServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("CommonExpressionsService")
public class CommonExpressionsServiceImpl implements CommonExpressionsServiceI {

	@Autowired
	private BaseDaoI<TCommonExpressions> tCommonExpressionsDao;
	
	public List<Map<String, Object>> getComExp(Map<String, Object> params) {
		String sql = "SELECT * FROM f_common_expressions WHERE 1=1 ";
		if((Integer)params.get("nurseryId")!=null&&(Integer)params.get("nurseryId")!=0){
			sql += " and nursery_id='"+(Integer)params.get("nurseryId")+"'";
		}
		if((Integer)params.get("teacherId")!=null&&(Integer)params.get("teacherId")!=0){
			sql += " and teacher_id='"+(Integer)params.get("teacherId")+"'";
		}
		if(StringUtils.hasText((String)params.get("type"))){
			sql += " and `type`='"+(String)params.get("type")+"'";
		}
		sql += " order by id desc";
		System.out.println(sql);
		return tCommonExpressionsDao.query(sql);
	}

	public void save(TCommonExpressions p) {
		tCommonExpressionsDao.save(p);
	}

	public void update(TCommonExpressions p) {
		/*TCommonExpressions t = */
		tCommonExpressionsDao.update(p);
	}

	public void delete(TCommonExpressions p) {
		tCommonExpressionsDao.delete(p);
	}

}
