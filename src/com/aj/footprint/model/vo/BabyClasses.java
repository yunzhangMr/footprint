package com.aj.footprint.model.vo;

import java.io.Serializable;

/**
 * 宝宝-班级关联
 * @author Administrator
 *
 */
public class BabyClasses implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	private Integer id;
	
	/**
	 * 宝宝ID
	 */
	private Integer baby_id;
	
	/**
	 * 班级ID
	 */
	private Integer class_id;
	
	/**
	 * 状态
	 */
	private String status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBaby_id() {
		return baby_id;
	}

	public void setBaby_id(Integer baby_id) {
		this.baby_id = baby_id;
	}

	public Integer getClass_id() {
		return class_id;
	}

	public void setClass_id(Integer class_id) {
		this.class_id = class_id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
