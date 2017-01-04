package com.aj.footprint.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aj.footprint.model.po.TCommentPM;
import com.aj.footprint.model.vo.Json;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.BabyClassServiceI;
import com.aj.footprint.service.CommentPMServiceI;
import com.aj.footprint.service.CommentTMServiceI;
import com.aj.footprint.service.CommentTTServiceI;
import com.aj.footprint.service.ItemScoreServiceI;
import com.aj.footprint.service.ItemServiceI;
import com.aj.general.util.DecodeUtil;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/commentPMController")
public class CommentPMController extends BaseController{

	private static final Logger logger = Logger.getLogger(CommentPMController.class);
	
	@Autowired
	private CommentPMServiceI commentPMService;
	
	//
	@ResponseBody
	@RequestMapping(value="/saveComment",method=RequestMethod.POST)
	public Json saveComment(String createyear,String grade,String term,String createmonth,String behavior,String suggestion){
		System.out.println(createyear+" "+grade+" "+term+" "+createmonth+" "+behavior+" "+suggestion);
		Json j = new Json();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		TCommentPM o = new TCommentPM();
		o.setId(1);
		o.setCreateyear(createyear);
		o.setGrade(grade);
		o.setTerm(term);
		o.setCreatemonth(createmonth);
		o.setBehavior(behavior);
		o.setSuggestion(suggestion);
		o.setCreatedate(new Date());
		o.setBaby_id(Integer.parseInt(sessionInfo.getBabyid()));
		o.setBaby_name(sessionInfo.getBabyname());
		o.setNursery_id(sessionInfo.getNurseryid());
		o.setParent_id(sessionInfo.getSid().toString());
		o.setParent_name(sessionInfo.getUserName());
		o.setClass_id(Integer.parseInt(sessionInfo.getClassid()));
		commentPMService.saveOrUpdate(o);
		j.setSuccess(true);
		return j;
	}
	
}
