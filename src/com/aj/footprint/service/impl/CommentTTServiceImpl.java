package com.aj.footprint.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.footprint.model.po.TCommentTT;
import com.aj.footprint.model.po.TItemScore;
import com.aj.footprint.service.CommentTTServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("commentTTService")
public class CommentTTServiceImpl implements CommentTTServiceI {
	
	@Autowired
	private BaseDaoI<TCommentTT> commentTTDao;

	public List<Map<String, Object>> getCommentTT(Integer nursery_id,
			Integer teacher_id, Integer class_id, String grade, String term,
			String name) {
		String sql = "select * from f_comment_t_t where nursery_id='"+nursery_id+"' and teacher_id='"+teacher_id+"' and class_id='"+class_id+"' and grade='"+grade+"' and term='"+term+"'";
		if(!StringUtils.isEmpty(name)){
			sql += " and baby_name like '%%"+name+"%%'";
		}
		sql += " group by baby_id ";
		System.out.println(sql);
		return commentTTDao.query(sql);
	}

	public int insertCommentTT(Integer nurseryId, Integer teacherId,
			Integer classId,String className, String grade, String term, String createyear,
			String teacherName) {
		String sql = "insert into f_comment_t_t(class_id,class_name,term,grade,createyear,baby_id,baby_name,baby_gender,nursery_id,teacher_id,teacher_name) (select '"+classId+"','"+ className+"','"+term+"','"+grade+"','"+createyear+"',b.id,b.bname,b.gender,'"+nurseryId+"','"+teacherId+"','"+teacherName+"' from f_baby b left join f_baby_class bc on b.id=bc.baby_id where 1=1 and bc.class_id='"+classId+"' and bc.`status` = 'N')";
		return commentTTDao.excuteBySql(sql);
	}

	public int updateCommentTT(String id, String sparkle, String progress,
			String guidance, String factors, String plan) {
		String sql = "update f_comment_t_t set sparkle='"+sparkle+"',progress='"+progress+"',guidance='"+guidance+"',factors='"+factors+"',plan='"+plan+"' where id='"+id+"'";
		return commentTTDao.excuteBySql(sql);
	}

	public List<Map<String, Object>> getCreAndTerm(Integer nursery,
			String babyId) {
		String sql = "select createyear,term,class_name from f_comment_t_t where nursery_id='"+nursery+"' and baby_id='"+babyId+"' group by createyear,term,class_name order by createyear desc";
		/*System.out.println(sql);*/
		return commentTTDao.query(sql);
	}

	public List<Map<String, Object>> getCommentTTResult(Integer nursery,
			String babyId, String createyear, String term) {
		String sql = "select * from f_comment_t_t where nursery_id='"+nursery+"' and baby_id='"+babyId+"' and createyear='"+createyear+"' and term='"+term+"'";
		return commentTTDao.query(sql);
	}
	
	

}
