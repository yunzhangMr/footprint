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
 * 调班日志
 * @author Administrator
 *
 */
@Entity
@Table(name="F_MOVELOG")
public class TMoveLog implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	/**
	 * 调班时间
	 */
	@Column(name = "MOVETIME", columnDefinition = "DATETIME")
	private Timestamp movetime;
	
	/**
	 * 操作者
	 */
	@Column(name = "ACTOR", length = 50)
	private String actor;
	
	/**
	 * 之前班级ID
	 */
	@Column(name = "PREVIOUS")
	private Integer previous;
	
	/**
	 * 调后班级ID
	 */
	@Column(name = "AFTER")
	private Integer after;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getMovetime() {
		return movetime;
	}

	public void setMovetime(Timestamp movetime) {
		this.movetime = movetime;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public Integer getPrevious() {
		return previous;
	}

	public void setPrevious(Integer previous) {
		this.previous = previous;
	}

	public Integer getAfter() {
		return after;
	}

	public void setAfter(Integer after) {
		this.after = after;
	}
	
	

}
