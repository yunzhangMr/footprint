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

import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.BabyClassServiceI;
import com.aj.footprint.service.ItemServiceI;
import com.aj.general.util.DecodeUtil;

@Controller
@RequestMapping("/itemController")
public class ItemController extends BaseController{

	private static final Logger logger = Logger.getLogger(ItemController.class);
	
	@Autowired
	private ItemServiceI itemService;
	
	//获取评测项目（分页的）
	@ResponseBody
	@RequestMapping(value="/getItems")
	public List<Map<String, Object>>  teacherManage(){
		String grade = "大";
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		String term = sessionInfo.getTerm();
		return itemService.getItems(grade, term);
	}
}
