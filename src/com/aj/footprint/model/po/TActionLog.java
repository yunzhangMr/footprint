package com.aj.footprint.model.po;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 操作日志
 * @author Administrator
 *
 */
@Entity
@Table(name="F_ACTIONLOG")
public class TActionLog implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	/**
	 * 操作时间
	 */
	@Column(name = "CREATETIME", columnDefinition = "DATETIME")
	private Timestamp createtime;
	
	/**
	 * 操作名称
	 */
	@Column(name = "ACTIONNAME", length = 20)
	private String actionname;
	
	/**
	 * 操作者
	 */
	@Column(name = "ACTOR", length = 50)
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
