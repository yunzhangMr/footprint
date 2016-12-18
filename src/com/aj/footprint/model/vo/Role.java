package com.aj.footprint.model.vo;

import java.io.Serializable;

/**
 * 角色
 * @author Administrator
 *
 */
public class Role implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 编码
	 */
	private Integer code;
	
	/**
	 * 名称
	 */
	private String rolename;
	
	/**
	 * 显示顺序
	 */
	private Integer displayorder;
	
	


	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public Integer getDisplayorder() {
		return displayorder;
	}

	public void setDisplayorder(Integer displayorder) {
		this.displayorder = displayorder;
	}
	
	
	
}
