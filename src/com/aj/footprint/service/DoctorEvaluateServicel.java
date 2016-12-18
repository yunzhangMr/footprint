package com.aj.footprint.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.aj.footprint.model.po.THealth;
import com.aj.footprint.model.vo.Pagination;

public interface DoctorEvaluateServicel {

	public Pagination queryPageTBaby(Integer limit,Integer offset,Map<String,Object> params);
	
	public Map<String,Object> findHealthVo(int healthid);
	
	public void saveHealth(THealth thealth);
	
	public List<Map<String,Object>> getTClassList(Object[] args);
}
