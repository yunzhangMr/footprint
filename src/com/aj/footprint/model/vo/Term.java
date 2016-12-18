package com.aj.footprint.model.vo;

import java.io.Serializable;

public class Term implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 编码
	 */
	private Integer code;
	
	/**
	 * 名称
	 */
	private String tname;
	
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

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public Integer getDisplayorder() {
		return displayorder;
	}

	public void setDisplayorder(Integer displayorder) {
		this.displayorder = displayorder;
	}
	
	
}
