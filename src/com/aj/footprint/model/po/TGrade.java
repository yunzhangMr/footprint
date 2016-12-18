package com.aj.footprint.model.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 年级
 * @author Administrator
 *
 */
@Entity
@Table(name="F_GRADE")
public class TGrade implements Serializable {

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
	@Column(name = "GNAME" , length = 20)
	private String gname;
	
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
