package com.aj.footprint.model.vo;

/**
 * sessionInfo model
 * 
 */
public class SessionInfo implements java.io.Serializable {

	private String loginId;// user ID
	private String userName;// loginName
	private String password;// loginName
	private String ip;// IP address
	private String roleId;

	

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



	public String getRoleId() {
		return roleId;
	}



	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}



	@Override
	public String toString() {
		return userName;
	}

}
