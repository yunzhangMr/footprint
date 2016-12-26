package com.aj.footprint.model.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 常用语
 * @author Administrator
 *
 */
@Entity
@Table(name="F_COMMON_EXPRESSIONS")
public class TCommonExpressions implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 编码
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	/**
	 * 内容
	 */
	@Column(name = "CONTENT" , length = 255)
	private String content;
	
	/**
	 * 类别
	 */
	@Column(name = "TYPE", length = 50)
	private String type;
	
	/**
	 * 老师ID
	 */
	@Column(name = "TEACHER_ID", length = 50)
	private String teacher_id;
	
	/**
	 * 幼儿园ID
	 */
	@Column(name = "NURSERY_ID", length = 50)
	private String nursery_id;
	
	/**
	 * 显示顺序
	 */
	@Column(name = "DISPLAYORDER")
	private Integer displayorder;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getNursery_id() {
		return nursery_id;
	}

	public void setNursery_id(String nursery_id) {
		this.nursery_id = nursery_id;
	}

	public Integer getDisplayorder() {
		return displayorder;
	}

	public void setDisplayorder(Integer displayorder) {
		this.displayorder = displayorder;
	}

}
