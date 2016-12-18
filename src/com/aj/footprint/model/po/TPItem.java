package com.aj.footprint.model.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 在家观察项目
 * @author Administrator
 *
 */
@Entity
@Table(name="F_P_ITEM")
public class TPItem implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 编码
	 */
	@Id
	@Column(name = "CODE")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer code;
	
	/**
	 * 描述
	 */
	@Column(name = "DESCRIPT" , length = 200)
	private String descript;
	
	/**
	 * 年级
	 */
	@Column(name = "GRADE" , length = 20)
	private String grade;
	
	/**
	 * 学期
	 */
	@Column(name = "TERM" , length = 20)
	private String term;
	
	/**
	 * 月份
	 */
	@Column(name = "CREATEMONTH" , length = 50)
	private String createmonth;
	
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
