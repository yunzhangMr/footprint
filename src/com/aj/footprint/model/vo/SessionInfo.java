package com.aj.footprint.model.vo;

import java.util.Arrays;
import java.util.Calendar;

/**
 * sessionInfo model
 * 
 */
public class SessionInfo implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	private String loginId;// user ID
	private String userName;// loginName
	private String password;// loginName
	private String ip;// IP address
	private String roleIds; //角色
	private Integer nurseryid; //幼儿园ID
	private String nurseryname; //幼儿园名称
	private String createyear; //学年
	private String term; //学期
	
	public SessionInfo() {
		Calendar calendar = Calendar.getInstance();
		switch(calendar.get(Calendar.MONTH)+1){
			case 8:
			case 9:
			case 10:
			case 11:
			case 12:createyear = Integer.toString(calendar.get(Calendar.YEAR));
					term = "上学期";break;
			case 1:createyear = Integer.toString(calendar.get(Calendar.YEAR)-1);
					term = "上学期";break;
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:createyear = Integer.toString(calendar.get(Calendar.YEAR)-1);
					term = "下学期";break;
		}
//		System.out.println(createyear+"-"+term);
	}
	
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getRoleIds() {
		return roleIds;
	}
	public void setRoleIds(String roleIds) {
		this.roleIds = roleIds;
	}

	public Integer getNurseryid() {
		return nurseryid;
	}

	public void setNurseryid(Integer nurseryid) {
		this.nurseryid = nurseryid;
	}

	public String getNurseryname() {
		return nurseryname;
	}
	public void setNurseryname(String nurseryname) {
		this.nurseryname = nurseryname;
	}
	public String getCreateyear() {
		return createyear;
	}
	public void setCreateyear(String createyear) {
		this.createyear = createyear;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}

	@Override
	public String toString() {
		return "SessionInfo [loginId=" + loginId + ", userName=" + userName
				+ ", password=" + password + ", ip=" + ip + ", roleIds="
				+ roleIds + ", nurseryid=" + nurseryid + ", nurseryname="
				+ nurseryname + ", createyear=" + createyear + ", term=" + term
				+ "]";
	}


}
