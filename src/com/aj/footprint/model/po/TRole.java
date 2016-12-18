package com.aj.footprint.model.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 角色
 * @author Administrator
 *
 */
@Entity
@Table(name="F_ROLE")
public class TRole implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 编码
	 */
	@Id
	@Column(name = "CODE")
	private Integer code;
	
	/**
	 * 名称
	 */
	@Column(name = "ROLENAME" , length = 20)
	private String rolename;
	
	/**
	 * 显示顺序
	 */
	@Column(name = "DISPLAYORDER")
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
