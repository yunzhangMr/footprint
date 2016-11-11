package com.aj.footprint.controller;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.Json;
import com.aj.footprint.model.vo.Baby;
import com.aj.footprint.service.BabyServiceI;
//import com.aj.general.util.ChartUtils;
import com.aj.general.util.ExceptionUtil;

@Controller
@RequestMapping("/babyController")
public class BabyController extends BaseController {

	private static final Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private BabyServiceI babyService;
	
	@RequestMapping("/babyRegister")
	public String user() {
		return "/baby/babyRegister";
	}

	@RequestMapping("/babyEdit")
	public String userEdit() {
		return "/baby/babyEdit";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Json add(Baby baby) {
		Json j = new Json();
		try {			
			babyService.save(baby);
			j.setSuccess(true);
			j.setMsg("Add successfully");
		} catch (Exception e) {
			logger.error(ExceptionUtil.getExceptionMessage(e));
			j.setMsg("Add unsuccessfully");
		}
	
		return j;
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(Baby baby) {
		Json j = new Json();
		try {
			babyService.update(baby);
			j.setSuccess(true);
			j.setMsg("Edit successfully");
		} catch (Exception e) {
			logger.error(ExceptionUtil.getExceptionMessage(e));
			j.setMsg("Edit unsuccessfully");
		}
		return j;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(Baby baby) {
		Json j = new Json();
		//can not delete admin
		/*boolean isAdmin = false;
		int ids = baby.getBabyid();
		if(ids!=null){
			for (String id : ids.split(",")){
				if (id.trim().equals("0")) {
					isAdmin = true;
				}
			}		
		}
		if(!isAdmin){
			try {
				babyService.delete(user.getIds());
				j.setSuccess(true);
				j.setMsg("Delete successfully");
			}catch (Exception e) {
				logger.error(ExceptionUtil.getExceptionMessage(e));
				j.setMsg("Delete unsuccessfully");
			}
		}else{
			logger.error("Can not delete admin");
			j.setMsg("Can not delete admin");
		}*/	
		return j;
	}
	
	
	
	@RequestMapping("/datagrid")
	@ResponseBody
	public DataGrid datagrid(Baby baby) {
		return babyService.datagrid(baby);
	}

/*
	@RequestMapping("/doNotNeedSession_datagrid")
	@ResponseBody
	public DataGrid doNotNeedSession_datagrid(User user) {
		if (user.getQ() != null && !user.getQ().trim().equals("")) {
			user.setCname(user.getQ());
		}
		return babyService.datagrid(user);
	}*/
	
}
