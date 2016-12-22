package com.aj.footprint.service;

import java.util.Map;

import com.aj.footprint.model.po.TBaby;
import com.aj.footprint.model.po.TUser;
import com.aj.footprint.model.vo.Pagination;

public interface TeacherChangeBabyInfoServiceI {

	public Pagination queryPageTBaby(Integer limit,Integer offset,Map<String,Object> params);
	
	public String dosave(TBaby tbaby,TUser tuser);
}
