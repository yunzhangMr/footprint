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
	private Integer classid;
	/**
	 * 名称
	 */

	@Column(name = "CNAME", length = 50)
	private String name;
	/**
	 * 幼儿园id
	 */
	@Column(name = "NURSERY_ID", length = 11)
	private Integer nuseryid;
	/**
	 * 幼儿园名字
	 */
	@Column(name = "NURSERY_NAME", length = 50)
	private String nurseryname;
	/**
	 * 创建日期
	 */
	@Column(name = "CEATEDATE")
	private Date ceatedate;
	/**
	 * 学年
	 */
	@Column(name = "CREATEYEAR", length = 20)
	private String createyear;

	/**
	 * 年级
	 */
	@Column(name = "GRADE", length = 5)
	private String grade;

	/**
	 * 学期
	 */
	@Column(name = "TERM", length = 5)
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
	@Autowired
	private int page;// current page
	@Autowired
	private int rows;// number of records in each page
	@Autowired
	private String sort;// sort field
	@Autowired
	private String order;// sort order (asc,desc)
	@Autowired
	private String q;
	@Autowired
	private int limit;
	@Autowired
	private int offset;
	@Autowired
	private int total;
	@Autowired
	private String search;

	public Integer getClassid() {
		return classid;
	}

	public void setClassid(Integer classid) {
		this.classid = classid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getNuseryid() {
		return nuseryid;
	}

	public void setNuseryid(Integer nuseryid) {
		this.nuseryid = nuseryid;
	}

	public String getNurseryname() {
		return nurseryname;
	}

	public void setNurseryname(String nurseryname) {
		this.nurseryname = nurseryname;
	}

	public Date getCeatedate() {
		return ceatedate;
	}

	public void setCeatedate(Date ceatedate) {
		this.ceatedate = ceatedate;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
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

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

}
