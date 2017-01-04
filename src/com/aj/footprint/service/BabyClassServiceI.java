package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

import com.aj.footprint.model.po.TBabyClasses;
import com.aj.footprint.model.vo.Pagination;

public interface BabyClassServiceI {

	/**
	 * 根据limit，offset，map条件查询 结果集Page
	 * @param limit
	 * @param offset
	 * @param params
	 * @return
	 */
	public Pagination queryPage(Integer limit, Integer offset,
			Map<String, Object> params);
	
	
	public List<Map<String, Object>> queryBabys(Map<String, Object> params);
	
	void update(TBabyClasses p);
	
	void updateClass(String nursery_id,String createyear,String term,String grade,String cnum, String baby_id);
}
