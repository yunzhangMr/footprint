package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

import com.aj.footprint.model.vo.FClass;

public interface ClassServicel {

	/**
	 * 获得班级列表
	 */
	public List<FClass> getClassList(FClass fclass,Integer page,Integer rows);
}
