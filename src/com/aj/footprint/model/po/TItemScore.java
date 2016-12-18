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
 * 评测记录
 * @author Administrator
 *
 */
@Entity
@Table(name="F_ITEM_SCORE")
public class TItemScore implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 编号
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
	 * 学期中的阶段--class表为5
	 */
	@Column(name = "STAGE" , length = 20)
	private String stage;
	
	/**
	 * 项目编码
	 */
	@Column(name = "ITEM_CODE")
	private Integer item_code;
	
	/**
	 * 评分
	 */
	@Column(name = "SCORE")
	private Integer score;
	
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
	 * 录入日期
	 */
	@Column(name = "CREATEDATE" , columnDefinition = "DATE")
	private Date createdate;
	
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
