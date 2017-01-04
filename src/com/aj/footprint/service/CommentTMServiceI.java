package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

public interface CommentTMServiceI {

	
	List<Map<String ,Object>> getCreAndTerm(Integer nursery,String babyId);
	
	List<Map<String ,Object>> getCommentTMResult(Integer nursery,String babyId,String createyear,String term,String month);
}
