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
	 * 唯一序列号
	 */
	@Id
	@Column(name = "SID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sid;
	
	
	/**
	 * 登录ID
	 */
	@Column(name = "ID" , length = 50)
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
	 * 幼儿园名字
	 */
	@Column(name = "NURSERY_NAME", length = 50)
	private String nurseryname;
	
	/**
	 * 班级编号
	 */
	@Column(name = "CLASS_ID")
	private Integer classId;
	
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
	
	

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

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

	public String getRoleids() {
		return roleids;
	}

	public void setRoleids(String roleids) {
		this.roleids = roleids;
	}

	public String getNurseryname() {
		return nurseryname;
	}

	public void setNurseryname(String nurseryname) {
		this.nurseryname = nurseryname;
	}

	
	public Integer getClassId() {
		return classId;
	}

	public void setClassId(Integer classId) {
		this.classId = classId;
	}

	@Override
	public String toString() {
		return "TUser [sid=" + sid + ", loginid=" + loginid + ", username="
				+ username + ", gender=" + gender + ", password=" + password
				+ ", phone=" + phone + ", mobile=" + mobile + ", email="
				+ email + ", createdate=" + createdate + ", nurseryid="
				+ nurseryid + ", nurseryname=" + nurseryname + ", classId="
				+ classId + ", roleids=" + roleids + ", status=" + status
				+ ", sessioncode=" + sessioncode + ", isAdmin=" + isAdmin + "]";
	}

	

	

}
