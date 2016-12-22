package com.aj.footprint.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj.footprint.model.po.TClass;
import com.aj.footprint.model.po.TCommentTM;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.TeacherInGardenMonthEvaluateServiceI;

@Controller
@RequestMapping("/teacherInGardenMonthEvaluateController")
public class TeacherInGardenMonthEvaluateController {

	@Autowired
    private TeacherInGardenMonthEvaluateServiceI teacherInGardenMonthEvaluateServiceI;

    @ResponseBody
	@RequestMapping(value="/findBabyList")
	public Map<String,Object>  findBabyList(HttpServletRequest request,int limit,int offset,String order,String name,String gradeAndClass,
			String term,String birth,String year,String createmonth){
    	
    	String grade = gradeAndClass.substring(0,1);
    	String cname = gradeAndClass;
    	
		Map<String, Object> params = new HashMap<String, Object>();

		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		params.put("nurseryid", sessionInfo.getNurseryid());
		params.put("loginid", sessionInfo.getLoginId());
		params.put("name", name);
		params.put("grade",grade);
		params.put("term",term);
		params.put("birth",birth);
		params.put("year",year);
		params.put("cname",cname);			
		params.put("createmonth",createmonth);	
		
		Pagination page = teacherInGardenMonthEvaluateServiceI.queryPageTBaby(limit, offset, params);
	    
		List<TClass> list = page.getResultList();
		Integer total = page.getTotalRows();
		
	    //此处查出对象list集合 放入到 map中,key值为 rows,total 为总页数
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;

	}
    
    @ResponseBody
    @RequestMapping(value="/dosave")
    public String dosave(HttpServletRequest request,String id,String bname,String createyear,String term,String mid,
    		String grade,String classid,String behavior,String suggestion,String createmonth){
    	
    	SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
    	String loginid = sessionInfo.getLoginId();
    	String username = sessionInfo.getUserName();
    	int nurseryid = sessionInfo.getNurseryid();
    	Date createdate = new Date();
    	
    	TCommentTM tCommentTM = new TCommentTM();
    	
    	if(StringUtils.hasText(mid)){		
    		tCommentTM.setId(Integer.parseInt(mid));
    	}
    	tCommentTM.setBaby_id(Integer.parseInt(id));
    	tCommentTM.setClass_id(Integer.parseInt(classid));
    	tCommentTM.setCreateyear(createyear);
    	tCommentTM.setTerm(term);
    	tCommentTM.setGrade(grade);
    	tCommentTM.setBehavior(behavior);
    	tCommentTM.setSuggestion(suggestion);
    	tCommentTM.setTeacher_id(loginid);
    	tCommentTM.setTeacher_name(username);
    	tCommentTM.setNursery_id(nurseryid);
    	tCommentTM.setCreatedate(createdate);
    	tCommentTM.setBaby_name(bname);
    	tCommentTM.setCreatemonth(createmonth);
    	
    	return teacherInGardenMonthEvaluateServiceI.dosaveCommentTM(tCommentTM);
    }

}
