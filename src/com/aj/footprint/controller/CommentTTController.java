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
import com.aj.footprint.service.CommentTTServiceI;
import com.aj.footprint.service.ItemScoreServiceI;
import com.aj.footprint.service.ItemServiceI;
import com.aj.general.util.DecodeUtil;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/commentTTController")
public class CommentTTController extends BaseController{

	private static final Logger logger = Logger.getLogger(CommentTTController.class);
	
	@Autowired
	private CommentTTServiceI commentTTService;
	
	//获取在园学期评价（不分页）
	@ResponseBody
	@RequestMapping(value="/getCommentTT")
	public Map<String,Object> getCommentTT(String name){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		String term = sessionInfo.getTerm();
		Integer nursery_id = sessionInfo.getNurseryid();
		Integer teacher_id = sessionInfo.getSid();
		Integer class_id = Integer.parseInt(sessionInfo.getClassid());
		String grade = sessionInfo.getGrade();
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("rows", commentTTService.getCommentTT(nursery_id, teacher_id, class_id, grade, term,name));
		return map;
	}
	
	//为该班级下的学生创建在园学期评价（空）
	@ResponseBody
	@RequestMapping(value="/createCommentTT",method=RequestMethod.POST)
	public Json createCommentTT(){
		Json j = new Json();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		String term = sessionInfo.getTerm();
		String createyear = sessionInfo.getCreateyear();
		Integer nurseryId = sessionInfo.getNurseryid();
		String teacherName = sessionInfo.getUserName();
		Integer teacherId = sessionInfo.getSid();
		Integer classId = Integer.parseInt(sessionInfo.getClassid());
		String grade = sessionInfo.getGrade();
		String className = sessionInfo.getCname();
		int rows = commentTTService.insertCommentTT(nurseryId, teacherId, classId, className, grade, term, createyear, teacherName);
		j.setObj(rows);
		j.setMsg("创建成功！");
		j.setSuccess(true);
		return j;
	}
	
	//修改在园学期信息
	@ResponseBody
	@RequestMapping(value="/changeCommentTT")
	public Json changeCommentTT(String id,String sparkle,String progress,String guidance,String factors,String plan){
		System.out.println(id);
		Json j = new Json();
		int rows = commentTTService.updateCommentTT(id, sparkle, progress, guidance, factors, plan);
		j.setObj(rows);
		j.setMsg("保存成功！");
		j.setSuccess(true);
		return j;
	}
	
	//获取班级-学期-班级名称
	@ResponseBody
	@RequestMapping(value="/getItemCTC")
	public List<Map<String,Object>> getCTC(){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		return commentTTService.getCreAndTerm(sessionInfo.getNurseryid(), sessionInfo.getBabyid());
	}
	
	//获取在园学期评价(根据学年，学期)
	@ResponseBody
	@RequestMapping(value="/getCommentTTResult")
	public List<Map<String,Object>> getCommentTTResult(String createyear,String term){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		return commentTTService.getCommentTTResult(sessionInfo.getNurseryid(), sessionInfo.getBabyid(), createyear, term);
	}
}
