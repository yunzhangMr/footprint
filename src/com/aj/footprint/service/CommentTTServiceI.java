package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

public interface CommentTTServiceI {

	/**
	 * 根据学期阶段得到评测成绩
	 * @param stage
	 * @return
	 */
	List<Map<String ,Object>> getCommentTT(Integer nursery_id,Integer teacher_id,Integer class_id,String grade,String term, String name);
	
	/**
	 * 根据项目来为该班级下所有学生创建评测成绩
	 * @param items
	 * @param nurseryId
	 * @param teacherId
	 * @param classId
	 * @param grade
	 * @param term
	 * @param stage
	 * @param createyear
	 * @param teacherName
	 * @return
	 */
	int insertCommentTT(Integer nurseryId,Integer teacherId,Integer classId,String className,String grade,String term,String createyear,String teacherName);
	
	/**
	 * 更新在园学期评价结果
	 * @param id
	 * @param sparkle
	 * @param progress
	 * @param guidance
	 * @param factors
	 * @param plan
	 * @return
	 */
	int updateCommentTT(String id,String sparkle,String progress,String guidance,String factors,String plan);
	
	List<Map<String ,Object>> getCreAndTerm(Integer nursery,String babyId);
	
	List<Map<String ,Object>> getCommentTTResult(Integer nursery,String babyId,String createyear,String term);
}
