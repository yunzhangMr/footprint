package com.aj.footprint.model.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Autowired;

@Entity
@Table(name = "F_CLASS")
public class TClass implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	/**
	 * 名称
	 */
	@Column(name = "CNAME", length = 50)
	private String cname;
	
	/**
	 * 幼儿园id
	 */
	@Column(name = "NURSERY_ID")
	private Integer nursery_id;
	
	/**
	 * 幼儿园名字
	 */
	@Column(name = "NURSERY_NAME", length = 50)
	private String nursery_name;
	
	/**
	 * 创建日期
	 */
	@Column(name = "CREATEDATE")
	private Date createdate;
	
	/**
	 * 学年
	 */
	@Column(name = "CREATEYEAR", length = 20)
	private String createyear;

	/**
	 * 年级
	 */
	@Column(name = "GRADE", length = 20)
	private String grade;

	/**
	 * 学期
	 */
	@Column(name = "TERM", length = 20)
	private String term;

	/**
	 * 班数
	 */
	@Column(name = "CNUM", length = 5)
	private String cnum;

	/**
	 * 教师1id
	 */
	@Column(name = "TEACHER1ID", length = 50)
	private String teacher1id;
	
	/**
	 * 教师2id
	 */
	@Column(name = "TEACHER2ID", length = 50)
	private String teacher2id;
	
	/**
	 * 教师3id
	 */
	@Column(name = "TEACHER3ID", length = 50)
	private String teacher3id;

	/**
	 * 教师1姓名
	 */
	@Column(name = "TEACHER1NAME", length = 50)
	private String teacher1name;

	/**
	 * 教师2姓名
	 */
	@Column(name = "TEACHER2NAME", length = 50)
	private String teacher2name;
	
	/**
	 * 教师3姓名
	 */
	@Column(name = "TEACHER3NAME", length = 50)
	private String teacher3name;
	
	/**
	 * 上学期班级id
	 */
	@Column(name = "PREVIOUS_ID")
	private Integer previous_id;
	
	/**
	 * 班级状态 （1为正常，0为已删除）
	 */
	@Column(name = "STATUS", length = 10)
	private String status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Integer getNursery_id() {
		return nursery_id;
	}

	public void setNursery_id(Integer nursery_id) {
		this.nursery_id = nursery_id;
	}

	public String getNursery_name() {
		return nursery_name;
	}

	public void setNursery_name(String nursery_name) {
		this.nursery_name = nursery_name;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getCreateyear() {
		return createyear;
	}

	public void setCreateyear(String createyear) {
		this.createyear = createyear;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public String getTeacher1id() {
		return teacher1id;
	}

	public void setTeacher1id(String teacher1id) {
		this.teacher1id = teacher1id;
	}

	public String getTeacher2id() {
		return teacher2id;
	}

	public void setTeacher2id(String teacher2id) {
		this.teacher2id = teacher2id;
	}

	public String getTeacher3id() {
		return teacher3id;
	}

	public void setTeacher3id(String teacher3id) {
		this.teacher3id = teacher3id;
	}

	public String getTeacher1name() {
		return teacher1name;
	}

	public void setTeacher1name(String teacher1name) {
		this.teacher1name = teacher1name;
	}

	public String getTeacher2name() {
		return teacher2name;
	}

	public void setTeacher2name(String teacher2name) {
		this.teacher2name = teacher2name;
	}

	public String getTeacher3name() {
		return teacher3name;
	}

	public void setTeacher3name(String teacher3name) {
		this.teacher3name = teacher3name;
	}

	public Integer getPrevious_id() {
		return previous_id;
	}

	public void setPrevious_id(Integer previous_id) {
		this.previous_id = previous_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
}
