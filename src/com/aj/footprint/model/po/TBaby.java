package com.aj.footprint.model.po;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

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
	private Integer id;
	
	/**
	 * 姓名
	 */
	@Column(name = "BNAME" , length = 50)
	private String bname;
	/**
	 * 拼音名字
	 */
	@Column(name = "NAMESPELL" , length = 64)
	private String namespell;
	
	/**
	 * 性别
	 */
	@Column(name = "GENDER", length = 4)
	private String gender;
	
	/**
	 * 生日
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd")
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
	private String parent_id;
	
	/**
	 * 家长姓名
	 */
	@Column(name = "PARENT_NAME", length = 50)
	private String parent_name;
	
	/**
	 * 幼儿园ID
	 */
	@Column(name = "NURSERY_ID")
	private Integer nursery_id;

	/**
	 * 录入人
	 */
	
	@Column(name = "CREATEUSER" , length = 50)
	private String createuser;
	
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
	

	public String getNamespell() {
		return namespell;
	}

	public void setNamespell(String namespell) {
		this.namespell = namespell;
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

	
	public void setBirth(Date birth) throws Exception {
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

	public Integer getNursery_id() {
		return nursery_id;
	}

	public void setNursery_id(Integer nursery_id) {
		this.nursery_id = nursery_id;
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

	
}
