package com.aj.footprint.model.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * 菜单
 * 
 * 
 */
@Entity
@Table(name = "F_MENU")
public class TMenu implements Serializable{
	private static final long serialVersionUID = 1L;
		
	/**
	 * ID
	 */	
	private String mid;
	
	/**
	 * 图标
	 */
	private String icon;
	
	/**
	 * 名称
	 */
	private String fname;
	
	/**
	 * 编号
	 */
	private Integer seq;
	
	/**
	 * url
	 */
	private String furl;

	
	/**
	 * 角色
	 */
	private String roleid;
	
	/**
	 * url
	 * @return
	 */
	private String url;

	

	@Id
	@Column(name = "ID" , length = 10)
	@GeneratedValue(strategy = GenerationType.AUTO)
	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	@Column(name = "ICON" , length = 50)
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "FNAME" , length = 50)
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	@Column(name = "SEQ")
	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	@Column(name = "FURL" , length = 200)
	public String getFurl() {
		return furl;
	}

	public void setFurl(String furl) {
		this.furl = furl;
	}

	@Column(name = "ROLEID" , length = 20)
	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	@Column(name = "URL" , length = 50)
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	

}
