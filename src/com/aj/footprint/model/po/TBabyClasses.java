package com.aj.footprint.model.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 宝宝-班级关联表
 * @author Administrator
 *
 */
@Entity
@Table(name="F_BABY_CLASS")
public class TBabyClasses implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	/**
	 * 宝宝ID
	 */
	@Column(name = "BABY_ID")
	private Integer baby_id;
	
	/**
	 * 班级ID
	 */
	@Column(name = "CLASS_ID")
	private Integer class_id;
	
	/**
	 * 状态
	 */
	@Column(name = "STATUS", length = 20)
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
