package com.aj.footprint.model.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 幼儿园
 * @author Administrator
 *
 */
public class Nursery implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 * ID
	 */
	private Integer id;
	
	/**
	 * 名称
	 */
	private String nname;
	
	/**
	 * 园长姓名
	 */
	private String headname;
	
	/**
	 * 等级
	 */
	private String level;
	
	/**
	 * 幼儿园编码
	 */
	private String nurserycode;
	
	/**
	 * 地址
	 */
	private String address;
	
	/**
	 * 行政区划代码
	 */
	private String admincode;
	
	/**
	 * 省
	 */
	private String province;
	
	/**
	 * 市
	 */
	private String city;
	
	/**
	 * 县
	 */
	private String county;
	
	/**
	 * 联系电话
	 */
	private String telephone;
	
	/**
	 * 性质
	 */
	private String nature;
	
	/**
	 * 录入日期
	 */
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
