package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

import com.aj.footprint.model.po.TClass;

public interface ClassServicel {

	/**
	 * 获得班级列表
	 */
	public List<TClass> getClassList(List<Object> param,Integer page,Integer rows);
}
