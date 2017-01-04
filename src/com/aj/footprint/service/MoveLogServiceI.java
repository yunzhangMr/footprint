package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

import com.aj.footprint.model.po.TMoveLog;

public interface MoveLogServiceI {

	/**
	 * 根据参数，查询得到常用语集
	 * @param params
	 * @return
	 */
	List<Map<String ,Object>> getComExp(Map<String,Object> params);
	
	void save(TMoveLog p);
	
	void update(TMoveLog p);
	
	void delete(TMoveLog p);
}
