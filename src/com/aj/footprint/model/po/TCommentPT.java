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
@Table(name="F_COMMENT_P_T")
public class TCommentPT implements Serializable {
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
	 * 家长ID
	 */
	@Column(name = "PARENT_ID" , length = 50)
	private String parent_id;
	
	/**
	 * 家长姓名
	 */
	@Column(name = "PARENT_NAME" , length = 50)
	private String parent_name;
	
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
	 * 鼓励
	 */
	@Column(name = "HOPE" , length = 250)
	private String hope;

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

	public String getParent_id() {
		return parent_id;
	}

	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}

	public String getParent_name() {
		return parent_name;
	}

	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
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

	public String getHope() {
		return hope;
	}

	public void setHope(String hope) {
		this.hope = hope;
	}

}
