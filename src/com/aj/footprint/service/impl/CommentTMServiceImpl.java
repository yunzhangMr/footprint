package com.aj.footprint.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.footprint.model.po.TCommentTM;
import com.aj.footprint.model.po.TCommentTT;
import com.aj.footprint.model.po.TItemScore;
import com.aj.footprint.service.CommentTMServiceI;
import com.aj.footprint.service.CommentTTServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("commentTMService")
public class CommentTMServiceImpl implements CommentTMServiceI {
	
	@Autowired
	private BaseDaoI<TCommentTM> commentTMDao;

	/*public List<Map<String, Object>> getCommentTT(Integer nursery_id,
			Integer teacher_id, Integer class_id, String grade, String term,
			String name) {
		String sql = "select * from f_comment_t_t where nursery_id='"+nursery_id+"' and teacher_id='"+teacher_id+"' and class_id='"+class_id+"' and grade='"+grade+"' and term='"+term+"'";
		if(!StringUtils.isEmpty(name)){
			sql += " and baby_name like '%%"+name+"%%'";
		}
		sql += " group by baby_id ";
		System.out.println(sql);
		return commentTMDao.query(sql);
	}*/


	public List<Map<String, Object>> getCreAndTerm(Integer nursery,
			String babyId) {
		String sql = "select createyear,term,class_name from f_comment_t_m where nursery_id='"+nursery+"' and baby_id='"+babyId+"' group by createyear,term,class_name order by createyear desc";
		/*System.out.println(sql);*/
		return commentTMDao.query(sql);
	}


	public List<Map<String, Object>> getCommentTMResult(Integer nursery,
			String babyId, String createyear, String term,String month) {
		String sql = "select * from f_comment_t_m where nursery_id='"+nursery+"' and baby_id='"+babyId+"' and createyear='"+createyear+"' and term='"+term+"' and createmonth='"+month+"'";
		return commentTMDao.query(sql);
	}
	
	

}
