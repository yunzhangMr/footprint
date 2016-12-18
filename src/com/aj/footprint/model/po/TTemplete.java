package com.aj.footprint.model.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 模板
 * @author Administrator
 *
 */
@Entity
@Table(name="F_TEMPLETE")
public class TTemplete {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 编码
	 */
	@Id
	@Column(name = "CODE")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer code;
	
	/**
	 * 名称
	 */
	@Column(name = "DESCRIPT" , length = 250)
	private String descript;
	
	/**
	 * 类型
	 */
	@Column(name = "TYPE" , length = 50)
	private String type;
	
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
