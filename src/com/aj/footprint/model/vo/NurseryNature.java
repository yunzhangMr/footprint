package com.aj.footprint.model.vo;

import java.io.Serializable;

/**
 * 幼儿园性质
 * @author Administrator
 *
 */
public class NurseryNature implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 编码
	 */
	private Integer code;
	
	/**
	 * 描述
	 */
	private String descript;
	
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

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public Integer getDisplayorder() {
		return displayorder;
	}

	public void setDisplayorder(Integer displayorder) {
		this.displayorder = displayorder;
	}

	
}
