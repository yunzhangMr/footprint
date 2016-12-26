package com.aj.footprint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aj.footprint.model.po.TCommonExpressions;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.BabyClassServiceI;
import com.aj.footprint.service.CommonExpressionsServiceI;
import com.aj.footprint.service.ItemServiceI;
import com.aj.general.util.DecodeUtil;

@Controller
@RequestMapping("/CommonExpressionsController")
public class CommonExpressionsController extends BaseController{

	private static final Logger logger = Logger.getLogger(CommonExpressionsController.class);
	
	@Autowired
	private CommonExpressionsServiceI CommonExpressionsService;
	
	//获取常用语
	@ResponseBody
	@RequestMapping(value="/getComExps")
	public Map<String,Object>  getComExps(String type){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nurseryId", sessionInfo.getNurseryid());
		params.put("teacherId", sessionInfo.getSid());
		params.put("type", type);
		List list = CommonExpressionsService.getComExp(params);
	    //此处查出对象list集合 放入到 map中,key值为 rows,total 为总页数
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("rows", list);
		/*System.out.println(params);
		System.out.println(list);*/
		return map;
	}
	
	//增加一条常用语
	@ResponseBody
	@RequestMapping(value="/insertComExps")
	public void insertComExps(TCommonExpressions p){
		//String id,String type,String content,Integer displayorder
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		p.setNursery_id(sessionInfo.getNurseryid().toString());
		p.setTeacher_id(sessionInfo.getSid().toString());
		CommonExpressionsService.save(p);
	}
	
	//删除这条常用语
	@ResponseBody
	@RequestMapping(value="/deleteComExps")
	public void deleteComExps(TCommonExpressions p){
		CommonExpressionsService.delete(p);
	}
	
	//修改这条常用语
	@ResponseBody
	@RequestMapping(value="/updateComExps")
	public void updateComExps(TCommonExpressions p){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		p.setNursery_id(sessionInfo.getNurseryid().toString());
		p.setTeacher_id(sessionInfo.getSid().toString());
		CommonExpressionsService.update(p);
	}
}
