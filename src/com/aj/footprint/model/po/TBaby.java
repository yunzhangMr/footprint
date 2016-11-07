package com.aj.footprint.model.po;

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
public class TBaby implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	/**
	 * 宝宝ID
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer babyid;
	
	/**
	 * 姓名
	 */
	@Column(name = "BNAME" , length = 50)
	private String babyname;
	
	/**
	 * 性别
	 */
	@Column(name = "GENDER", length = 4)
	private String gender;
	
	/**
	 * 生日
	 */
	@Column(name = "BIRTH", columnDefinition = "DATE")
	private Date birth;
	
	/**
	 * 电话
	 */
	@Column(name = "TELEPHONE", length = 20)
	private String phone;
	
	/**
	 * 家长ID
	 */
	@Column(name = "PARENT_ID", length = 50)
	private String parentId;
	
	/**
	 * 家长姓名
	 */
	@Column(name = "PARENT_NAME", length = 50)
	private String parentName;
	
	/**
	 * 幼儿园ID
	 */
	@Column(name = "NURSERY_ID")
	private Integer nurseryid;
	
	/**
	 * 宝宝-班级ID
	 */
	@Column(name = "B_C_ID")
	private Integer b_c_id;
	
	/**
	 * 录入人
	 */
	@Column(name = "CREATEUSER" , length = 50)
	private String createUser;
	
	/**
	 * 创建日期
	 */
	@Column(name = "CREATEDATE" , columnDefinition = "DATE")
	private Date createdate;
	
	/**
	 * 属相
	 */
	@Column(name = "ANIMALSIGN" , length = 4)
	private String animalsign;
	
	/**
	 * 乳名
	 */
	@Column(name = "NICKNAME" , length = 50)
	private String nickname;
	
	/**
	 * 入园前抚育方式
	 */
	@Column(name = "NURTURE" , length = 250)
	private String nurture;
	
	/**
	 * 状态
	 */
	@Column(name = "STATUS" , length = 10)
	private String status = "N";

	

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
	
	

}
