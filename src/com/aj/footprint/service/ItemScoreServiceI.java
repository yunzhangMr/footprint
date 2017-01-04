package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

public interface ItemScoreServiceI {

	/**
	 * 根据学期阶段得到评测成绩
	 * @param stage
	 * @return
	 */
	List<Map<String ,Object>> getItemScore(Integer nursery_id,Integer teacher_id,Integer class_id, String grade,String createyear,String term,String stage, String quota, String name, String isBaby ,String babyId);
	
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
	int insertItemScore(List<Map<String ,Object>> items ,Integer nurseryId,Integer teacherId,Integer classId,String className,String grade,String term,String stage,String createyear,String teacherName);
	
	/**
	 * 更新项目成绩
	 * @param id
	 * @param score
	 * @return
	 */
	int updateScore(String id,String score);
	
	List<Map<String ,Object>> getCreAndTerm(Integer nursery,String babyId);
}
