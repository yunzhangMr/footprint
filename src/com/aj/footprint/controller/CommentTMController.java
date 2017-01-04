package com.aj.footprint.controller;

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

import com.aj.footprint.model.vo.Json;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.BabyClassServiceI;
import com.aj.footprint.service.CommentTMServiceI;
import com.aj.footprint.service.CommentTTServiceI;
import com.aj.footprint.service.ItemScoreServiceI;
import com.aj.footprint.service.ItemServiceI;
import com.aj.general.util.DecodeUtil;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/commentTMController")
public class CommentTMController extends BaseController{

	private static final Logger logger = Logger.getLogger(CommentTMController.class);
	
	@Autowired
	private CommentTMServiceI commentTMService;
	
	//获取班级-学期-班级名称
	@ResponseBody
	@RequestMapping(value="/getItemCTC",method=RequestMethod.POST)
	public List<Map<String,Object>> getCTC(){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		return commentTMService.getCreAndTerm(sessionInfo.getNurseryid(), sessionInfo.getBabyid());
	}
	
	//获取在园学期评价(根据学年，学期)
	@ResponseBody
	@RequestMapping(value="/getCommentTMResult")
	public List<Map<String,Object>> getCommentTTResult(String createyear,String term,String month){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		return commentTMService.getCommentTMResult(sessionInfo.getNurseryid(), sessionInfo.getBabyid(), createyear, term, month);
	}
}
