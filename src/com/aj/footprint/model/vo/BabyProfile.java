package com.aj.footprint.model.vo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 宝宝档案
 * @author
 *
 */
public class BabyProfile implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	private Integer id;
	
	/**
	 * 宝宝ID
	 */
	private String baby_id;
	
	/**
	 * 姓名
	 */
	private String baby_name;
	
	/**
	 * 年度
	 */
	private String createyear;
	
	/**
	 * 学期
	 */
	private String term;
	
	/**
	 * 年级
	 */
	private String grade;
	
	/**
	 * 创建日期
	 */
	private Date createdate;
	
	/**
	 * 过敏反应
	 */
	private String allergenic;
	
	/**
	 * 疾病或先天病史
	 */
	private String congenital;
	
	/**
	 * 现在身体状况
	 */
	private String health;
	
	/**
	 * 喜欢的食物
	 */
	private String favfood;
	
	/**
	 * 喜欢的朋友
	 */
	private String friend;
	
	/**
	 * 喜欢做的事
	 */
	private String liketodo;
	
	/**
	 * 性格特点
	 */
	private String personality;
	
	/**
	 * 自理能力
	 */
	private String selfcare;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBaby_id() {
		return baby_id;
	}

	public void setBaby_id(String baby_id) {
		this.baby_id = baby_id;
	}

	public String getBaby_name() {
		return baby_name;
	}

	public void setBaby_name(String baby_name) {
		this.baby_name = baby_name;
	}

	public String getCreateyear() {
		return createyear;
	}

	public void setCreateyear(String createyear) {
		this.createyear = createyear;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getAllergenic() {
		return allergenic;
	}

	public void setAllergenic(String allergenic) {
		this.allergenic = allergenic;
	}

	public String getCongenital() {
		return congenital;
	}

	public void setCongenital(String congenital) {
		this.congenital = congenital;
	}

	public String getHealth() {
		return health;
	}

	public void setHealth(String health) {
		this.health = health;
	}

	public String getFavfood() {
		return favfood;
	}

	public void setFavfood(String favfood) {
		this.favfood = favfood;
	}

	public String getFriend() {
		return friend;
	}

	public void setFriend(String friend) {
		this.friend = friend;
	}

	public String getLiketodo() {
		return liketodo;
	}

	public void setLiketodo(String liketodo) {
		this.liketodo = liketodo;
	}

	public String getPersonality() {
		return personality;
	}

	public void setPersonality(String personality) {
		this.personality = personality;
	}

	public String getSelfcare() {
		return selfcare;
	}

	public void setSelfcare(String selfcare) {
		this.selfcare = selfcare;
	}


}
