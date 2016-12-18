package com.aj.footprint.service;

import java.util.Map;

import com.aj.footprint.model.po.TUser;


public interface DoctorInfoServicel {

	public Map<String,Object> findUserInfoById(String id);
	
	public int findCountBySql(String id,String password);
	
	public int updateBySql(TUser tuser);
}
