package com.aj.footprint.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 操作日志
 * @author Administrator
 *
 */
public class ActionLog implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	private Integer id;
	
	/**
	 * 操作时间
	 */
	private Timestamp createtime;
	
	/**
	 * 操作名称
	 */
	private String actionname;
	
	/**
	 * 操作者
	 */
	private String actor;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public String getActionname() {
		return actionname;
	}

	public void setActionname(String actionname) {
		this.actionname = actionname;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}
	
	
}
