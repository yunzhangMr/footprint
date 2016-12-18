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
 * 用户
 * @author Administrator
 *
 */

public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * 唯一序列号
	 */
	private Integer sid;
	
	/**
	 * 登录ID
	 */
	private String loginid;
	
	/**
	 * 姓名
	 */
	private String username;
	
	/**
	 * 性别
	 */
	private String gender;
	
	/**
	 * 密码
	 */
	private String password;
	
	/**
	 * 电话
	 */
	private String phone;
	
	/**
	 * 手机
	 */
	private String mobile;
	
	/**
	 * 邮箱
	 */
	private String email;
	
	/**
	 * 创建日期
	 */
	private Date createdate;
	
	/**
	 * 幼儿园ID
	 */
	private Integer nurseryid;
	
	/**
	 * 幼儿园名字
	 */
	private String nurseryname;
	
	/**
	 * 班级编号
	 */
	private Integer classId;
	
	/**
	 * 角色ID
	 */
	private String roleids;
	
	/**
	 * 状态
	 */
	private String status;
	
	/**
	 * session code
	 */
	private String sessioncode;
	
	/**
	 * 是否管理员
	 */
	private String isAdmin = "N";
	
	private int page;// current page
	private int rows;// number of records in each page
	private String sort;// sort field
	private String order;// sort order (asc,desc)
	private String q;
	

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
		return "User [sid=" + sid + ", loginid=" + loginid + ", username="
				+ username + ", gender=" + gender + ", password=" + password
				+ ", phone=" + phone + ", mobile=" + mobile + ", email="
				+ email + ", createdate=" + createdate + ", nurseryid="
				+ nurseryid + ", nurseryname=" + nurseryname + ", classId="
				+ classId + ", roleids=" + roleids + ", status=" + status
				+ ", sessioncode=" + sessioncode + ", isAdmin=" + isAdmin
				+ ", page=" + page + ", rows=" + rows + ", sort=" + sort
				+ ", order=" + order + ", q=" + q + "]";
	}

	

}
