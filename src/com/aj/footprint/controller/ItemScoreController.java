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
import com.aj.footprint.service.ItemScoreServiceI;
import com.aj.footprint.service.ItemServiceI;
import com.aj.general.util.DecodeUtil;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/itemScoreController")
public class ItemScoreController extends BaseController{

	private static final Logger logger = Logger.getLogger(ItemScoreController.class);
	
	@Autowired
	private ItemScoreServiceI itemScoreService;
	
	@Autowired
	private ItemServiceI itemService;
	
	//获取评测成绩（不分页）
	@ResponseBody
	@RequestMapping(value="/getItemScore")
	public Map<String,Object> teacherManage(String stage,String quota,String name,String isBaby,String babyId){
		/*System.out.println(stage);*/
		stage = DecodeUtil.decodeParameter(stage);
		if(!StringUtils.isEmpty(quota)){
			quota = DecodeUtil.decodeParameter(quota);
		}
		if(!StringUtils.isEmpty(name)){
			name = DecodeUtil.decodeParameter(name);
		}
		/*if(!StringUtils.isEmpty(isBaby)){
			isBaby = DecodeUtil.decodeParameter(isBaby);
		}
		if(!StringUtils.isEmpty(babyId)){
			babyId = DecodeUtil.decodeParameter(babyId);
		}*/
		String grade = "大";
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		String term = sessionInfo.getTerm();
		Integer nursery_id = sessionInfo.getNurseryid();
		Integer teacher_id = 1;
		Integer class_id = 2;
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("rows", itemScoreService.getItemScore(nursery_id, teacher_id, class_id, grade, term, stage ,quota,name,isBaby,babyId));
		return map;
	}
	
	//为该班级下的学生创建评测记录（空）
	@ResponseBody
	@RequestMapping(value="/createItemScore",method=RequestMethod.POST)
	public Json createItemScore(String stage){
		/*System.out.println(stage);*/
		Json j = new Json();
		
		//1、 取到所有的评测项目
		String grade = "大";
		Integer classId = 2;
		Integer teacherId = 1;
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		String term = sessionInfo.getTerm();
		String createyear = sessionInfo.getCreateyear();
		Integer nurseryId = sessionInfo.getNurseryid();
		String teacherName = sessionInfo.getUserName();
		List<Map<String, Object>> items = itemService.getItems(grade, term);
		
		//2、遍历，将每一项加全班学生的信息录入到评测成绩表中
		int rows = itemScoreService.insertItemScore(items, nurseryId, teacherId, classId, grade, term, stage, createyear, teacherName);
		
		j.setObj(rows);
		j.setMsg("创建成功！");
		j.setSuccess(true);
		return j;
	}
	
	//为该班级下的学生创建评测记录（空）
	@ResponseBody
	@RequestMapping(value="/changeItemScore")
	public Json changeItemScore(String scoreList){
		System.out.println(DecodeUtil.decodeParameter(scoreList));
		scoreList = DecodeUtil.decodeParameter(scoreList);
		Json j = new Json();
		JSONArray ja = JSONArray.fromObject(scoreList);
        List<Map<String,Object>> lists = JSONArray.toList(ja, HashMap.class);
        for (Map<String, Object> map : lists) {
        	itemScoreService.updateScore((map.get("id")).toString(), map.get("score").toString());
        }
		j.setMsg("保存成功！");
		j.setSuccess(true);
		return j;
	}
}
