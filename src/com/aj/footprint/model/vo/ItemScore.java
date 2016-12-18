package com.aj.footprint.model.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 评测记录
 * @author Administrator
 *
 */
public class ItemScore implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 编号
	 */
	private Integer id;
	
	/**
	 * 学年
	 */
	private String createyear;
	
	/**
	 * 学期
	 */
	private String term;
	
	/**
	 * 班级编号
	 */
	private Integer class_id;
	
	/**
	 * 年级
	 */
	private String grade;
	
	/**
	 * 学期中的阶段
	 */
	private String stage;
	
	/**
	 * 项目编码
	 */
	private Integer item_code;
	
	/**
	 * 评分
	 */
	private Integer score;
	
	/**
	 * 宝宝ID
	 */
	private Integer baby_id;
	
	/**
	 * 宝宝姓名
	 */
	private String baby_name;
	
	/**
	 * 录入日期
	 */
	private Date createdate;
	
	/**
	 * 幼儿园ID
	 */
	private Integer nursery_id;
	
	/**
	 * 教师ID
	 */
	private String teacher_id;
	
	/**
	 * 教师姓名
	 */
	private String teacher_name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCreateyear() {
		return createyear;
	}

	public void setCreateyear(String createyear) {
		this.createyear = createyear;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public Integer getClass_id() {
		return class_id;
	}

	public void setClass_id(Integer class_id) {
		this.class_id = class_id;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getStage() {
		return stage;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public Integer getItem_code() {
		return item_code;
	}

	public void setItem_code(Integer item_code) {
		this.item_code = item_code;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getBaby_id() {
		return baby_id;
	}

	public void setBaby_id(Integer baby_id) {
		this.baby_id = baby_id;
	}

	public String getBaby_name() {
		return baby_name;
	}

	public void setBaby_name(String baby_name) {
		this.baby_name = baby_name;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Integer getNursery_id() {
		return nursery_id;
	}

	public void setNursery_id(Integer nursery_id) {
		this.nursery_id = nursery_id;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	
	
}
