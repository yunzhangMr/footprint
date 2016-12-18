package com.aj.footprint.model.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 学期
 * @author Administrator
 *
 */
@Entity
@Table(name="F_TERM")
public class TTerm implements Serializable {

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
	@Column(name = "TNAME" , length = 20)
	private String tname;
	
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
