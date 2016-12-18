
package com.aj.footprint.model.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

public class Classes implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	
	private Integer id;
	
	/**
	 * 名称
	 */
	private String cname;
	
	/**
	 * 幼儿园id
	 */
	private Integer nursery_id;
	
	/**
	 * 幼儿园名字
	 */
	private String nursery_name;
	
	/**
	 * 创建日期
	 */
	private Date createdate;
	
	/**
	 * 学年
	 */
	private String createyear;
	
	/**
	 * 年级
	 */
	private String grade;
	
	/**
	 * 学期
	 */
	private String term;
	
	/**
	 * 班数
	 */
	private String cnum;
	
	/**
	 * 教师1id
	 */
	private String teacher1id;
	
	/**
	 * 教师2id
	 */
	private String teacher2id;
	
	/**
	 * 教师3id
	 */
	private String teacher3id;
	
	/**
	 * 教师1姓名
	 */
	private String teacher1name;
	
	/**
	 * 教师2姓名
	 */
	private String teacher2name;
	/**
	 * 教师3姓名
	 */
	private String teacher3name;
	
	/**
	 * 上学期班级id
	 */
	private Integer previous_id;
	
	/**
	 * 班级状态 （1为正常，0为已删除）
	 */
	private String status;
	

	private String teacherName;//教师姓名
	private int seniorClassNum = 0;//大班数量
	private int middleClassNum = 0;//中班数量
	private int primaryClassNum = 0;//小班数量
	private String teacher1idOld;
	private String teacher2idOld;
	private String teacher3idOld;
	private String sort;// sort field
	private String order;// sort order (asc,desc)
	private int limit; //每页显示多少条
	private int offset;//从那条数据开始读取
	
	
//	private int page;// current page
//	private int rows;// number of records in each page
//	private String q;
//	private int pageSize; //每页显示多少条
//	private int pageNumber; //当前页面
//	private int total;
//	private String search;
	
	
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
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public int getSeniorClassNum() {
		return seniorClassNum;
	}
	public void setSeniorClassNum(int seniorClassNum) {
		this.seniorClassNum = seniorClassNum;
	}
	public int getMiddleClassNum() {
		return middleClassNum;
	}
	public void setMiddleClassNum(int middleClassNum) {
		this.middleClassNum = middleClassNum;
	}
	public int getPrimaryClassNum() {
		return primaryClassNum;
	}
	public void setPrimaryClassNum(int primaryClassNum) {
		this.primaryClassNum = primaryClassNum;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	
	public String getTeacher1idOld() {
		return teacher1idOld;
	}
	public void setTeacher1idOld(String teacher1idOld) {
		this.teacher1idOld = teacher1idOld;
	}
	public String getTeacher2idOld() {
		return teacher2idOld;
	}
	public void setTeacher2idOld(String teacher2idOld) {
		this.teacher2idOld = teacher2idOld;
	}
	public String getTeacher3idOld() {
		return teacher3idOld;
	}
	public void setTeacher3idOld(String teacher3idOld) {
		this.teacher3idOld = teacher3idOld;
	}
	@Override
	public String toString() {
		return "Classes [id=" + id + ", cname=" + cname + ", nursery_id="
				+ nursery_id + ", nursery_name=" + nursery_name
				+ ", createdate=" + createdate + ", createyear=" + createyear
				+ ", grade=" + grade + ", term=" + term + ", cnum=" + cnum
				+ ", teacher1id=" + teacher1id + ", teacher2id=" + teacher2id
				+ ", teacher3id=" + teacher3id + ", teacher1name="
				+ teacher1name + ", teacher2name=" + teacher2name
				+ ", teacher3name=" + teacher3name + ", previous_id="
				+ previous_id + ", status=" + status + ", teacherName="
				+ teacherName + ", seniorClassNum=" + seniorClassNum
				+ ", middleClassNum=" + middleClassNum + ", primaryClassNum="
				+ primaryClassNum + ", teacher1idOld=" + teacher1idOld
				+ ", teacher2idOld=" + teacher2idOld + ", teacher3idOld="
				+ teacher3idOld + ", sort=" + sort + ", order=" + order
				+ ", limit=" + limit + ", offset=" + offset + "]";
	}

	


	
}

