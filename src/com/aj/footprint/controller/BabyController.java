package com.aj.footprint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aj.footprint.model.po.TClass;
import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.Json;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.model.vo.User;
import com.aj.footprint.service.SequenceAutoI;
import com.aj.footprint.service.UserServiceI;
import com.aj.general.util.DecodeUtil;
import com.aj.general.util.ExceptionUtil;
import com.aj.general.util.IpUtil;
import com.aj.general.util.ResourceUtil;

@Controller
@RequestMapping("/babyController")
public class BabyController extends BaseController {

	private static final Logger logger = Logger.getLogger(BabyController.class);
	
	/*@Autowired
	private SequenceAutoI sequenceAutoService;*/
	
	
	
	
	/*@RequestMapping("/add")
	@ResponseBody
	public Json add(User user) {
		Json j = new Json();
		//can not add admin
		if(!("admin".equals(user.getUsername()))){
			try {			
				userService.save(user);
				j.setSuccess(true);
				j.setMsg("Add successfully");
			} catch (Exception e) {
				logger.error(ExceptionUtil.getExceptionMessage(e));
				j.setMsg("Add unsuccessfully");
			}
		}else{
			logger.error("Can not add admin");
			j.setMsg("Can not add admin");
		}
		return j;
	}*/

}
