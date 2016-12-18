package com.aj.footprint.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.aj.footprint.model.po.THealth;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.service.DoctorEvaluateServicel;
import com.aj.general.dao.BaseDaoI;

@Service("doctorEvaluateService")
public class DoctorEvaluateServicelmpl implements DoctorEvaluateServicel{

	@Autowired
	private BaseDaoI<THealth> tHealthDao;
	
	public Pagination queryPageTBaby(Integer limit,Integer offset,Map<String,Object> params){
		
		int nurseryid = Integer.parseInt(params.get("nurseryid").toString());
		String name = params.get("name").equals("")?"":params.get("name").toString();
		String grade = params.get("grade").equals("")?"":params.get("grade").toString();
		String term = params.get("term").equals("")?"":params.get("term").toString();
		String year = params.get("year").equals("")?"":params.get("year").toString();
		int classid = params.get("classid").equals("")?0:Integer.parseInt(params.get("classid").toString()); 
		String birth = params.get("birth").equals("")?"":params.get("birth").toString(); 
		
		String sql = " SELECT t.id,t.bname,t.gender,t.createyear,t.grade,t.classid,t.term,t.cname,"
				+ " (CASE  WHEN h.id is NULL THEN '-1' ELSE  h.id END ) AS healthid,t.birth "
				+ "from (select b.id,b.bname,b.gender,c.createyear,c.grade,DATE_FORMAT(b.birth,'%Y-%m-%d') as birth,c.term,c.id as classid,c.cname,c.nursery_id "
				+ "from f_baby b ,f_baby_class p ,f_class c "
				+ "where b.id = p.baby_id and c.id = p.class_id and p.status='N' AND b.status='Y' AND c.nursery_id="+nurseryid+" ) t "
				+ "LEFT JOIN f_health h ON t.id=h.baby_id and h.class_id=t.classid where 1=1 ";
		
		if(StringUtils.hasText(name)){
			sql += " and t.bname like '%"+name+"%'";
		}
        if(StringUtils.hasText(year)){
			sql += " and t.createyear="+year;
		}
		if(StringUtils.hasText(grade)){
			sql += " and t.grade='"+grade+"'";
		}
		if(StringUtils.hasText(term)){
			sql += " and t.term='"+term+"'";
		}
		if(classid!=0){
			sql += " and t.classid="+classid;
		}
		if(StringUtils.hasText(birth)){
			sql += " and t.birth  like '%"+birth+"%' ";
		}
		
		
		
		sql += " order by t.classid,t.id ";

		return tHealthDao.queryPage(sql,limit,offset);	
		
	}
	
	public Map<String,Object> findHealthVo(int healthid){
				
		String sql = " select * from f_health where id="+healthid;
		
		return tHealthDao.findVoBySql(sql);
	}
	
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED, isolation = Isolation.REPEATABLE_READ)
	public void saveHealth(THealth thealth){
		
		 tHealthDao.saveOrUpdate(thealth);
	}
    
	//二级班级联动
	public List<Map<String,Object>> getTClassList(Object[] args){
		
		String sql = " select id,cname from f_class where grade=? and nursery_id=? ";	
		
		return tHealthDao.queryListBySql(sql,args);
	}
	
}
