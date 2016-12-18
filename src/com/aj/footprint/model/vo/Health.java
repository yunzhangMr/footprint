package com.aj.footprint.model.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 健康评价
 * @author Administrator
 *
 */
public class Health implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
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
	 * 班级ID
	 */
	private Integer class_id;

	/**
	 * 录入日期
	 */
	private Date createdate;
	
	/**
	 * 年级
	 */
	private String grade;
	
	/**
	 * 宝宝ID
	 */
	private Integer baby_id;
	
	/**
	 * 宝宝姓名
	 */
	private String baby_name;
	
	/**
	 * 幼儿园ID
	 */
	private Integer nursery_id;
	
	/**
	 * 医生ID
	 */
	private String teacher_id;
	
	/**
	 * 医生姓名
	 */
	private String teacher_name;
	
	/**
	 * 身高
	 */
	private String height;
	
	/**
	 * 体重
	 */
	private String weight;
	
	/**
	 * 血色素
	 */
	private String HB;
	
	/**
	 * 总共龋齿
	 */
	private String allcaries;
	
	/**
	 * 新增龋齿
	 */
	private String newcaries;
	
	/**
	 * 左眼视力
	 */
	private String lefteyesight;
	
	/**
	 * 右眼视力
	 */
	private String righteyesight;
	
	/**
	 * 备注
	 */
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
