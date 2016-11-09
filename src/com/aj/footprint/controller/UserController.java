package com.aj.footprint.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.Json;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.model.vo.User;
import com.aj.footprint.service.UserServiceI;
import com.aj.general.util.ExceptionUtil;
import com.aj.general.util.IpUtil;
import com.aj.general.util.ResourceUtil;

@Controller
@RequestMapping("/userController")
public class UserController extends BaseController {

	private static final Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserServiceI userService;
	
	@RequestMapping("/user")
	public String user() {
		return "/admin/user";
	}

	@RequestMapping("/userAdd")
	public String userAdd() {
		return "/admin/userAdd";
	}

	@RequestMapping("/userEdit")
	public String userEdit() {
		return "/admin/userEdit";
	}

	@RequestMapping("/userRoleEdit")
	public String userRoleEdit() {
		return "/admin/userRoleEdit";
	}
	
	@RequestMapping("/doNotNeedSession_login")
	@ResponseBody
	public Json doNotNeedSession_login(User user) {		
		
		Json j = new Json();	
		User u = userService.login(user);
		if (u != null) {
			SessionInfo sessionInfo = new SessionInfo();
			sessionInfo.setLoginId(u.getLoginid());
			sessionInfo.setUserName(user.getUsername());
			sessionInfo.setPassword(user.getPassword());
			sessionInfo.setRoleId(user.getRoleid().toString());
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
			sessionInfo.setIp(IpUtil.getIpAddr(request));
			request.getSession().setAttribute(ResourceUtil.getSessionInfoName(), sessionInfo);

			j.setObj(sessionInfo);
			j.setSuccess(true);
			j.setMsg("Login successfully");
		} else {
			j.setMsg("Login unsuccessfully");
		}
		return j;
	}
	
	@RequestMapping("/doNotNeedSession_reg")
	@ResponseBody
	public Json doNotNeedSession_reg(User user) {
		Json j = new Json();
		//Test: can not add admin
		if(!("admin".equals(user.getUsername()))){
			try {
				userService.save(user);
				j.setSuccess(true);
				j.setMsg("Register successfully");
			} catch (Exception e) {
				logger.error(ExceptionUtil.getExceptionMessage(e));
				j.setMsg("Register unsuccessfully");
			}
		}else{
			logger.error("Can not register admin");
			j.setMsg("Can not register admin");
		}
		return j;
	}
	
	@RequestMapping("/doNotNeedSession_logout")
	@ResponseBody
	public Json doNotNeedSession_logout() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		request.getSession().invalidate();
		Json j = new Json();
		j.setSuccess(true);
		return j;
	}
	
	@RequestMapping("/add")
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
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(User user) {
		Json j = new Json();
		//can not update admin
		if(!("0".equals(user.getLoginid()))){
			try {
				userService.update(user);
				j.setSuccess(true);
				j.setMsg("Edit successfully");
			} catch (Exception e) {
				logger.error(ExceptionUtil.getExceptionMessage(e));
				j.setMsg("Edit unsuccessfully");
			}
		}else{
			logger.error("Can not update admin");
			j.setMsg("Can not update admin");
		}
		return j;
	}
	
	/*@RequestMapping("/delete")
	@ResponseBody
	public Json delete(User user) {
		Json j = new Json();
		//can not delete admin
		boolean isAdmin = false;
		String ids = user.getIds();
		if(ids!=null){
			for (String id : ids.split(",")){
				if (id.trim().equals("0")) {
					isAdmin = true;
				}
			}		
		}
		if(!isAdmin){
			try {
				userService.delete(user.getIds());
				j.setSuccess(true);
				j.setMsg("Delete successfully");
			}catch (Exception e) {
				logger.error(ExceptionUtil.getExceptionMessage(e));
				j.setMsg("Delete unsuccessfully");
			}
		}else{
			logger.error("Can not delete admin");
			j.setMsg("Can not delete admin");
		}	
		return j;
	}*/
	
	@RequestMapping("/datagrid")
	@ResponseBody
	public DataGrid datagrid(User user) {
		return userService.datagrid(user);
	}

/*	@RequestMapping("/doNotNeedSession_combobox")
	@ResponseBody
	public List<User> doNotNeedSession_combobox(User user) {
		return userService.combobox(user);
	}*/

	@RequestMapping("/doNotNeedSession_datagrid")
	@ResponseBody
	public DataGrid doNotNeedSession_datagrid(User user) {
		if (user.getQ() != null && !user.getQ().trim().equals("")) {
			user.setUsername(user.getQ());
		}
		return userService.datagrid(user);
	}
	
}
