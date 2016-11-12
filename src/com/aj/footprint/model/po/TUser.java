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
 * 用户
 * @author Administrator
 *
 */
@Entity
@Table(name="F_USER")
public class TUser implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	/**
	 * 登录ID
	 */
	@Id
	@Column(name = "ID" , length = 50)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String loginid;
	
	/**
	 * 姓名
	 */
	@Column(name = "USERNAME" , length = 50)
	private String username;
	
	/**
	 * 性别
	 */
	@Column(name = "GENDER", length = 4)
	private String gender;
	
	/**
	 * 密码
	 */
	@Column(name = "PASSWORD", length = 300)
	private String password;
	
	/**
	 * 电话
	 */
	@Column(name = "TELEPHONE", length = 20)
	private String phone;
	
	/**
	 * 手机
	 */
	@Column(name = "MOBILE", length = 20)
	private String mobile;
	
	/**
	 * 邮箱
	 */
	@Column(name = "EMAIL", length = 100)
	private String email;
	
	/**
	 * 创建日期
	 */
	@Column(name = "CREATEDATE" , columnDefinition = "DATE")
	private Date createdate;
	
	/**
	 * 幼儿园ID
	 */
	@Column(name = "NURSERY_ID")
	private Integer nurseryid;
	
	/**
	 * 角色ID
	 */
	@Column(name = "ROLEIDS")
	private String roleids;
	
	/**
	 * 状态
	 */
	@Column(name = "STATUS" , length = 10)
	private String status = "N";
	
	/**
	 * session code
	 */
	@Column(name = "SESSIONCODE" , length = 300)
	private String sessioncode;
	
	/**
	 * 是否管理员
	 */
	@Column(name="ISADMIN",length=2)
	private String isAdmin = "N";

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Integer getNurseryid() {
		return nurseryid;
	}

	public void setNurseryid(Integer nurseryid) {
		this.nurseryid = nurseryid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSessioncode() {
		return sessioncode;
	}

	public void setSessioncode(String sessioncode) {
		this.sessioncode = sessioncode;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getRoleid() {
		return roleids;
	}

	public void setRoleids(String roleids) {
		this.roleids = roleids;
	}
	
	

}
