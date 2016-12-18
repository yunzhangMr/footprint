package com.aj.footprint.model.vo;

import java.io.Serializable;

/**
 * 年级
 * @author Administrator
 *
 */
public class Grade implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 编码
	 */
	private Integer code;
	
	/**
	 * 名称
	 */
	private String gname;
	
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

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public Integer getDisplayorder() {
		return displayorder;
	}

	public void setDisplayorder(Integer displayorder) {
		this.displayorder = displayorder;
	}
	
	
	
}
