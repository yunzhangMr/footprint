package com.aj.footprint.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * 调班日志
 * @author Administrator
 *
 */
public class MoveLog implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	private Integer id;
	
	/**
	 * 操作时间
	 */
	private Timestamp movetime;
	
	/**
	 * 操作者
	 */
	private String actor;
	
	/**
	 * 之前班级ID
	 */
	private Integer previous;
	
	/**
	 * 调后班级ID
	 */
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
