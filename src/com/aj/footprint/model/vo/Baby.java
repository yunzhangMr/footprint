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
 * 宝宝基本信息
 * @author
 *
 */
public class Baby implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	/**
	 * 宝宝ID
	 */
	private Integer id;
	
	/**
	 * 姓名
	 */
	private String bname;
	
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
	private String parent_id;
	
	/**
	 * 家长姓名
	 */
	private String parent_name;
	
	/**
	 * 幼儿园ID
	 */
	private Integer nurseryid;
	
	/**
	 * 录入人
	 */
	private String createuser;
	
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
	
//	private int page = 1;// current page
//	private int rows = 5;// number of records in each page
	
	/**
	 * 排序字段
	 */
	private String sort = "id"; // sort field
	
	/**
	 * 
	 * 排序方式（升序，降序）采用
	 */
	private String order = "desc"; // sort order (asc,desc)

	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
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

	public Integer getNurseryid() {
		return nurseryid;
	}

	public void setNurseryid(Integer nurseryid) {
		this.nurseryid = nurseryid;
	}

	public String getCreateuser() {
		return createuser;
	}

	public void setCreateuser(String createuser) {
		this.createuser = createuser;
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
