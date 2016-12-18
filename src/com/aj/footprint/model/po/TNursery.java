package com.aj.footprint.model.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 幼儿园
 * @author Administrator
 *
 */
@Entity
@Table(name="F_NURSERY")
public class TNursery implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	/**
	 * 名称
	 */
	@Column(name = "NNAME" , length = 50)
	private String nname;
	
	/**
	 * 园长姓名
	 */
	@Column(name = "HEADNAME" , length = 50)
	private String headname;
	
	/**
	 * 等级
	 */
	@Column(name = "LEVEL" , length = 50)
	private String level;
	
	/**
	 * 幼儿园编码
	 */
	@Column(name = "NURSERYCODE" , length = 20)
	private String nurserycode;
	
	/**
	 * 地址
	 */
	@Column(name = "ADDRESS" , length = 250)
	private String address;
	
	/**
	 * 行政区划代码
	 */
	@Column(name = "ADMINCODE" , length = 20)
	private String admincode;
	
	/**
	 * 省
	 */
	@Column(name = "PROVINCE" , length = 50)
	private String province;
	
	/**
	 * 市
	 */
	@Column(name = "CITY" , length = 50)
	private String city;
	
	/**
	 * 县
	 */
	@Column(name = "COUNTY" , length = 50)
	private String county;
	
	/**
	 * 联系电话
	 */
	@Column(name = "TELEPHONE" , length = 20)
	private String telephone;
	
	/**
	 * 性质
	 */
	@Column(name = "NATURE" , length = 50)
	private String nature;
	
	/**
	 * 录入日期
	 */
	@Column(name = "CREATEDATE" , columnDefinition = "DATE")
	private Date createdate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public String getHeadname() {
		return headname;
	}

	public void setHeadname(String headname) {
		this.headname = headname;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getNurserycode() {
		return nurserycode;
	}

	public void setNurserycode(String nurserycode) {
		this.nurserycode = nurserycode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAdmincode() {
		return admincode;
	}

	public void setAdmincode(String admincode) {
		this.admincode = admincode;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	
	
}
