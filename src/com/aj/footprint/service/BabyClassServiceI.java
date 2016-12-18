package com.aj.footprint.service;

import java.util.Map;

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
	
	/*public List<Map<String, Object>> queryBabys(String classid,String status);*/
}
