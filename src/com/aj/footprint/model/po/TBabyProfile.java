package com.aj.footprint.model.po;

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
@Entity
@Table(name="F_BABYPROFILE")
public class TBabyProfile implements Serializable{
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	/**
	 * 宝宝ID
	 */
	@Column(name = "BABY_ID")
	private String baby_id;
	
	/**
	 * 姓名
	 */
	@Column(name = "BABY_NAME" , length = 50)
	private String baby_name;
	
	/**
	 * 年度
	 */
	@Column(name = "CREATEYEAR" , length = 20)
	private String createyear;
	
	/**
	 * 学期
	 */
	@Column(name = "TERM" , length=20)
	private String term;

//   有了关联表了，这个外键就不要了    get-set方法也注掉了
//	/**
//	 * 宝宝-班级ID
//	 */
//	@Column(name = "B_C_ID")
//	private Integer b_c_id;
	
	/**
	 * 年级
	 */
	@Column(name = "GRADE" , length=20)
	private String grade;
	
	/**
	 * 创建日期
	 */
	@Column(name = "CREATEDATE" , columnDefinition = "DATE")
	private Date createdate;
	
	/**
	 * 过敏反应
	 */
	@Column(name = "ALLERGENIC" , length = 250)
	private String allergenic;
	
	/**
	 * 疾病或先天病史
	 */
	@Column(name = "CONGENITAL" , length = 250)
	private String congenital;
	
	/**
	 * 现在身体状况
	 */
	@Column(name = "HEALTH" , length = 250)
	private String health;
	
	/**
	 * 喜欢的食物
	 */
	@Column(name = "FAVFOOD" , length = 250)
	private String favfood;
	
	/**
	 * 喜欢的朋友
	 */
	@Column(name = "FRIEND" , length = 250)
	private String friend;
	
	/**
	 * 喜欢做的事
	 */
	@Column(name = "LIKETODO" , length = 250)
	private String liketodo;
	
	/**
	 * 性格特点
	 */
	@Column(name = "PERSONALITY" , length = 250)
	private String personality;
	
	/**
	 * 自理能力
	 */
	@Column(name = "SELFCARE" , length = 250)
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
