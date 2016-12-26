package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

import com.aj.footprint.model.po.TCommonExpressions;

public interface CommonExpressionsServiceI {

	/**
	 * 根据参数，查询得到常用语集
	 * @param params
	 * @return
	 */
	List<Map<String ,Object>> getComExp(Map<String,Object> params);
	
	void save(TCommonExpressions p);
	
	void update(TCommonExpressions p);
	
	void delete(TCommonExpressions p);
}
