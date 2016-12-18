package com.aj.footprint.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.footprint.model.po.TBabyClasses;
import com.aj.footprint.model.po.TItem;
import com.aj.footprint.model.po.TItemScore;
import com.aj.footprint.service.ItemScoreServiceI;
import com.aj.footprint.service.ItemServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("itemScoreService")
public class ItemScoreServiceImpl implements ItemScoreServiceI {

	@Autowired
	private BaseDaoI<TItemScore> itemScoreDao;

	public List<Map<String, Object>> getItemScore(Integer nursery_id,
			Integer teacher_id, Integer class_id, String grade, String term,
			String stage, String quota, String name, String isBaby,String babyId) {
		String sql = "select * from f_item_score where nursery_id='"+nursery_id+"' and teacher_id='"+teacher_id+"' and class_id='"+class_id+"' and grade='"+grade+"' and term='"+term+"'";
		if(!StringUtils.isEmpty(stage)){
			sql += " and stage='"+stage+"'";
		}
		if(!StringUtils.isEmpty(quota)){
			sql += " and item_code='"+quota+"'";
		}
		if(!StringUtils.isEmpty(name)){
			sql += " and baby_name like '%%"+name+"%%'";
		}
		if(!StringUtils.isEmpty(babyId)){
			sql += " and baby_id='"+babyId+"'";
		}
		if(!StringUtils.isEmpty(isBaby)){
			sql += " group by baby_id ";
		}
		System.out.println(sql);
		return itemScoreDao.query(sql);
	}

	public int insertItemScore(List<Map<String, Object>> items,
			Integer nurseryId, Integer teacherId, Integer classId,
			String grade, String term, String stage, String createyear,
			String teacherName) {
		int count = 0;
		for(Map<String, Object> map : items){
			long itemCode = Long.parseLong(map.get("code").toString());
			String sql = "insert into f_item_score(stage,class_id,term,grade,createyear,item_code,baby_id,baby_name,baby_gender,nursery_id,teacher_id,teacher_name) (select '"+stage+"','"+classId+"','"+term+"','"+grade+"','"+createyear+"','"+itemCode+"',b.id,b.bname,b.gender,'"+nurseryId+"','"+teacherId+"','"+teacherName+"' from f_baby b left join f_baby_class bc on b.id=bc.baby_id where 1=1 and bc.class_id='2' and bc.`status` = 'N')";
			count += itemScoreDao.excuteBySql(sql);
		}
		return count;
	}

	public int updateScore(String id, String score) {
		String sql = "update f_item_score set score='"+score+"' where id = '"+id+"'";
		return itemScoreDao.excuteBySql(sql);
	}

	
	
	

}
