package com.aj.footprint.model.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 在园学期总结
 * @author Administrator
 *
 */
@Entity
@Table(name="F_COMMENT_T_T")
public class TCommentTT implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	/**
	 * 学年
	 */
	@Column(name = "CREATEYEAR" , length = 20)
	private String createyear;
	
	/**
	 * 学期
	 */
	@Column(name = "TERM" , length = 20)
	private String term;
	
	/**
	 * 班级ID
	 */
	@Column(name = "CLASS_ID")
	private Integer class_id;
	
	/**
	 * 年级
	 */
	@Column(name = "GRADE" , length = 20)
	private String grade;
	
	/**
	 * 录入日期
	 */
	@Column(name = "CREATEDATE" , columnDefinition = "DATE")
	private Date createdate;
	
	/**
	 * 宝宝ID
	 */
	@Column(name = "BABY_ID")
	private Integer baby_id;
	
	/**
	 * 宝宝姓名
	 */
	@Column(name = "BABY_NAME" , length = 50)
	private String baby_name;
	
	/**
	 * 幼儿园ID
	 */
	@Column(name = "NURSERY_ID")
	private Integer nursery_id;
	
	/**
	 * 教师ID
	 */
	@Column(name = "TEACHER_ID" , length = 50)
	private String teacher_id;
	
	/**
	 * 教师姓名
	 */
	@Column(name = "TEACHER_NAME" , length = 50)
	private String teacher_name;
	
	/**
	 * 闪光点
	 */
	@Column(name = "SPARKLE" , length = 250)
	private String sparkle;
	
	/**
	 * 进步
	 */
	@Column(name = "PROGRESS" , length = 250)
	private String progress;
	
	/**
	 * 需指导
	 */
	@Column(name = "GUIDANCE" , length = 250)
	private String guidance;
	
	/**
	 * 影响因素
	 */
	@Column(name = "FACTORS" , length = 250)
	private String factors;
	
	/**
	 * 指导计划
	 */
	@Column(name = "PLAN" , length = 250)
	private String plan;

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

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
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

	public String getSparkle() {
		return sparkle;
	}

	public void setSparkle(String sparkle) {
		this.sparkle = sparkle;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getGuidance() {
		return guidance;
	}

	public void setGuidance(String guidance) {
		this.guidance = guidance;
	}

	public String getFactors() {
		return factors;
	}

	public void setFactors(String factors) {
		this.factors = factors;
	}

	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}
	
}
