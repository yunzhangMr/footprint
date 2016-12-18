package com.aj.footprint.model.vo;

import java.io.Serializable;

/**
 * 在家观察项目
 * @author Administrator
 *
 */
public class PItem implements Serializable {
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
	 * 年级
	 */
	private String grade;
	
	/**
	 * 学期
	 */
	private String term;
	
	/**
	 * 月份
	 */
	private String createmonth;
	
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getCreatemonth() {
		return createmonth;
	}

	public void setCreatemonth(String createmonth) {
		this.createmonth = createmonth;
	}

	public Integer getDisplayorder() {
		return displayorder;
	}

	public void setDisplayorder(Integer displayorder) {
		this.displayorder = displayorder;
	}


	
}
