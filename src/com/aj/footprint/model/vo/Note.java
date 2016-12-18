package com.aj.footprint.model.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 老师发送的消息
 * @author Administrator
 *
 */
public class Note implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	private Integer id;
	
	/**
	 * 录入时间
	 */
	private Date createdate;
	
	/**
	 * 幼儿园ID
	 */
	private Integer nursery_id;
	
	/**
	 * 班级ID
	 */
	private Integer class_id;
	
	/**
	 * 教师ID
	 */
	private String teacher_id;
	
	/**
	 * 教师名字
	 */
	private String teacher_name;
	
	/**
	 * 家长ID
	 */
	private String parent_id;
	
	/**
	 * 家长姓名
	 */
	private String parent_name;
	
	/**
	 * 发送消息内容
	 */
	private String content;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public Integer getNursery_id() {
		return nursery_id;
	}

	public void setNursery_id(Integer nursery_id) {
		this.nursery_id = nursery_id;
	}

	public Integer getClass_id() {
		return class_id;
	}

	public void setClass_id(Integer class_id) {
		this.class_id = class_id;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}

	public String getParent_id() {
		return parent_id;
	}

	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}

	public String getParent_name() {
		return parent_name;
	}

	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
