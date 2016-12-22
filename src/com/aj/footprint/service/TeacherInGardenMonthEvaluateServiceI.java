package com.aj.footprint.service;

import java.util.Map;

import com.aj.footprint.model.po.TCommentTM;
import com.aj.footprint.model.vo.Pagination;

public interface TeacherInGardenMonthEvaluateServiceI {

	public int getClassid(String loginid);
	
	public Pagination queryPageTBaby(Integer limit,Integer offset,Map<String,Object> params);
	
	public String dosaveCommentTM(TCommentTM tCommentTM);
	
	public String getCname(String loginid);
}
