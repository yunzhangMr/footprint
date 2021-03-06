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
 * 健康评价
 * @author Administrator
 *
 */
@Entity
@Table(name="F_HEALTH")
public class THealth implements Serializable {
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
	 * 录入日期
	 */
	@Column(name = "CREATEDATE" , columnDefinition = "DATE")
	private Date createdate;
	
	/**
	 * 年级--class表为5
	 */
	@Column(name = "GRADE" , length = 20)
	private String grade;
	
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
	 * 医生ID
	 */
	@Column(name = "TEACHER_ID" , length = 50)
	private String teacher_id;
	
	/**
	 * 医生姓名
	 */
	@Column(name = "TEACHER_NAME" , length = 50)
	private String teacher_name;
	
	/**
	 * 身高
	 */
	@Column(name = "HEIGHT" , length = 50)
	private String height;
	
	/**
	 * 体重
	 */
	@Column(name = "WEIGHT" , length = 50)
	private String weight;
	
	/**
	 * 血色素
	 */
	@Column(name = "HB" , length = 50)
	private String HB;
	
	/**
	 * 总共龋齿
	 */
	@Column(name = "ALLCARIES" , length = 50)
	private String allcaries;
	
	/**
	 * 新增龋齿
	 */
	@Column(name = "NEWCARIES" , length = 50)
	private String newcaries;
	
	/**
	 * 左眼视力
	 */
	@Column(name = "LEFTEYESIGHT" , length = 50)
	private String lefteyesight;
	
	/**
	 * 右眼视力
	 */
	@Column(name = "RIGHTEYESIGHT" , length = 50)
	private String righteyesight;
	
	/**
	 * 备注
	 */
	@Column(name = "MARK" , length = 250)
	private String mark;

	
	
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

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getHB() {
		return HB;
	}

	public void setHB(String hB) {
		HB = hB;
	}

	public String getAllcaries() {
		return allcaries;
	}

	public void setAllcaries(String allcaries) {
		this.allcaries = allcaries;
	}

	public String getNewcaries() {
		return newcaries;
	}

	public void setNewcaries(String newcaries) {
		this.newcaries = newcaries;
	}

	public String getLefteyesight() {
		return lefteyesight;
	}

	public void setLefteyesight(String lefteyesight) {
		this.lefteyesight = lefteyesight;
	}

	public String getRighteyesight() {
		return righteyesight;
	}

	public void setRighteyesight(String righteyesight) {
		this.righteyesight = righteyesight;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

}
