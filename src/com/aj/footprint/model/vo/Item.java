package com.aj.footprint.model.vo;

import java.io.Serializable;

/**
 * 评测项目
 * @author Administrator
 *
 */
public class Item implements Serializable {
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
	private Integer belongto;
	
	/**
	 * 级别
	 */
	private Integer level;
	
	/**
	 * 评分样式
	 */
	private Integer scorestyle;
	
	/**
	 * 年级
	 */
	private String grade;
	
	/**
	 * 学期
	 */
	private String term;
	
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

	public Integer getBelongto() {
		return belongto;
	}

	public void setBelongto(Integer belongto) {
		this.belongto = belongto;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getScorestyle() {
		return scorestyle;
	}

	public void setScorestyle(Integer scorestyle) {
		this.scorestyle = scorestyle;
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

	public Integer getDisplayorder() {
		return displayorder;
	}

	public void setDisplayorder(Integer displayorder) {
		this.displayorder = displayorder;
	}
	
	
}
