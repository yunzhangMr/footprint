package com.aj.footprint.model.vo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 宝宝
 * @author
 *
 */
@Entity
@Table(name="F_BABY")
public class Baby implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	/**
	 * 宝宝ID
	 */
	private Integer babyid;
	
	/**
	 * 姓名
	 */
	private String babyname;
	
	/**
	 * 性别
	 */
	private String gender;
	
	/**
	 * 生日
	 */
	private Date birth;
	
	/**
	 * 电话
	 */
	private String phone;
	
	/**
	 * 家长ID
	 */
	private String parentId;
	
	/**
	 * 家长姓名
	 */
	private String parentName;
	
	/**
	 * 幼儿园ID
	 */
	private Integer nurseryid;
	
	/**
	 * 宝宝-班级ID
	 */
	private Integer b_c_id;
	
	/**
	 * 录入人
	 */
	private String createUser;
	
	/**
	 * 创建日期
	 */
	private Date createdate;
	
	/**
	 * 属相
	 */
	private String animalsign;
	
	/**
	 * 乳名
	 */
	private String nickname;
	
	/**
	 * 入园前抚育方式
	 */
	private String nurture;
	
	/**
	 * 状态
	 */
	private String status = "N";
	private int page;// current page
	private int rows;// number of records in each page
	private String sort;// sort field
	private String order;// sort order (asc,desc)

	

	public Integer getBabyid() {
		return babyid;
	}

	public void setBabyid(Integer babyid) {
		this.babyid = babyid;
	}

	public String getBabyname() {
		return babyname;
	}

	public void setBabyname(String babyname) {
		this.babyname = babyname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public Integer getNurseryid() {
		return nurseryid;
	}

	public void setNurseryid(Integer nurseryid) {
		this.nurseryid = nurseryid;
	}

	public Integer getB_c_id() {
		return b_c_id;
	}

	public void setB_c_id(Integer b_c_id) {
		this.b_c_id = b_c_id;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getAnimalsign() {
		return animalsign;
	}

	public void setAnimalsign(String animalsign) {
		this.animalsign = animalsign;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNurture() {
		return nurture;
	}

	public void setNurture(String nurture) {
		this.nurture = nurture;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
	

}
