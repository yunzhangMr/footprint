package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

public interface PItemServiceI {

	/**
	 * 根据年级和学期查询该年级和学期下的评价项目
	 * @param grade
	 * @param term
	 * @return
	 */
	List<Map<String ,Object>> getItems();
}
