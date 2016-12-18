package com.aj.footprint.model.vo;

import java.io.Serializable;

/**
 * 模板
 * @author Administrator
 *
 */
public class Templete implements Serializable {
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
	 * 类型
	 */
	private String type;
	
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
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getDisplayorder() {
		return displayorder;
	}

	public void setDisplayorder(Integer displayorder) {
		this.displayorder = displayorder;
	}
	
	
}
