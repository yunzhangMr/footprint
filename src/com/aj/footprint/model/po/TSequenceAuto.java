package com.aj.footprint.model.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * 学期中的阶段
 * @author Administrator
 *
 */
@Entity
@Table(name="F_SEQUENCE_AUTO")
public class TSequenceAuto implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 编码
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	/**
	 * 默认名称（sequence）
	 */
	@Column(name = "NAME" , length = 50)
	private String name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
