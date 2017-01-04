package com.aj.footprint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
@RequestMapping("/userController")
public class UserController extends BaseController {

	private static final Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserServiceI userService;
	
	@Autowired
	private SequenceAutoI sequenceAutoService;
	
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
	
	//登录，并将基本信息保存到session中
	@RequestMapping("/doNotNeedSession_login")
	@ResponseBody
	public Json doNotNeedSession_login(User user) {		
		
		Json j = new Json();	
		User u = userService.login(user);
		List<Map<String, Object>> others = null;
//		System.out.println(u);
		if (u != null) {
			System.out.println(u.getRoleids());
			/*switch(u.getRoleids())*/
			if("2".equals(u.getRoleids())||"3".equals(u.getRoleids())){
				others = userService.queryOthers(u.getSid(), u.getRoleids());
			}
			System.out.println(others);
			SessionInfo sessionInfo = new SessionInfo();
			sessionInfo.setSid(u.getSid());
			sessionInfo.setLoginId(u.getLoginid());
			sessionInfo.setUserName(user.getUsername());
			sessionInfo.setPassword(user.getPassword());
			sessionInfo.setRoleIds(u.getRoleids());
			sessionInfo.setNurseryid(u.getNurseryid());
			sessionInfo.setNurseryname(u.getNurseryname());
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
			sessionInfo.setIp(IpUtil.getIpAddr(request));
			if("2".equals(u.getRoleids())){
				for (Map<String, Object> map : others) {
					if(map.get("grade")!=null){sessionInfo.setGrade(map.get("grade").toString());}
					if(map.get("cname")!=null){sessionInfo.setCname(map.get("cname").toString());}
					if(map.get("cnum")!=null){sessionInfo.setCnum(map.get("cnum").toString());}
					if(map.get("class_id")!=null){sessionInfo.setClassid(map.get("class_id").toString());}
					if(map.get("cname")!=null){sessionInfo.setCname(map.get("cname").toString());}
		        }
			}
			if("3".equals(u.getRoleids())){
				/*System.out.println(others);*/
				for (Map<String, Object> map : others) {
					if(map.get("baby_id")!=null){sessionInfo.setBabyid(map.get("baby_id").toString());}
					if(map.get("baby_name")!=null){sessionInfo.setBabyname(map.get("baby_name").toString());}
					if(map.get("grade")!=null){sessionInfo.setGrade(map.get("grade").toString());}
					if(map.get("cname")!=null){sessionInfo.setCname(map.get("cname").toString());}
					if(map.get("cnum")!=null){sessionInfo.setCnum(map.get("cnum").toString());}
					if(map.get("class_id")!=null){sessionInfo.setClassid(map.get("class_id").toString());}
					if(map.get("cname")!=null){sessionInfo.setCname(map.get("cname").toString());}
		        }
			}
			request.getSession().setAttribute("sessionInfo", sessionInfo);
			//打印sessionInfo的信息
			System.out.println(sessionInfo);
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
	
	//获取教师列表（分页的）
	@ResponseBody
	@RequestMapping(value="/teacherManage")
	public Map<String,Object>  teacherManage(int limit,int offset,String name,String phone,String status){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("name", DecodeUtil.decodeParameter(name.trim()));
		params.put("phone", DecodeUtil.decodeParameter(phone.trim()));
		params.put("status", DecodeUtil.decodeParameter(status.trim()));
		Pagination page = userService.queryPage(limit, offset, params);
		List list = page.getResultList();
		Integer total = page.getTotalRows();
	    //此处查出对象list集合 放入到 map中,key值为 rows,total 为总页数
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;

	}
	
	//获取教师列表（新增班级的时候调用）
	@ResponseBody
	@RequestMapping(value="/getTeachers",method=RequestMethod.POST)
	public List<Map<String, Object>> getTeachers(String name,String mobile){
		return userService.queryTeachers(name,mobile);
	}
	
	//编辑角色
	@RequestMapping("/editRole")
	@ResponseBody
	public Json editRole(User user) {
		Json j = new Json();
		try {
			System.out.println(user);
			userService.updatePart(user);
			j.setSuccess(true);
			j.setMsg("Edit successfully");
		} catch (Exception e) {
			logger.error(ExceptionUtil.getExceptionMessage(e));
			j.setMsg("Edit unsuccessfully");
		}
		return j;
	}
	
	//新增用户
	@RequestMapping("/addTeacher")
	@ResponseBody
	public Json addTeacher(User user) {
		/*System.out.println("0");*/
		Json j = new Json();
		//can not add admin
		try {	
			/*user.setLoginid("1111111");*/
			int rom = (int)(1+Math.random()*1000);
			user.setLoginid(Integer.toString(rom));
//			user.getUsername()+
			/*System.out.println(sequenceAutoService.getAutoSequence().toString());*/
			user.setStatus("Y");
			/*user.setRoleids("2");*/
			user.setPassword("123456");
			user.setClassId(0);
//				user.setCreatedate(new Date());
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
			SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
			user.setNurseryid(sessionInfo.getNurseryid());
			user.setNurseryname(sessionInfo.getNurseryname());
			System.out.println(user);
			userService.save(user);
			j.setSuccess(true);
			j.setMsg("Add successfully");
		} catch (Exception e) {
			logger.error(ExceptionUtil.getExceptionMessage(e));
			j.setMsg("Add unsuccessfully");
		}
		return j;
	}
	
	//编辑基础信息
	@RequestMapping("/editBase")
	@ResponseBody
	public Json editBase(User user) {
		Json j = new Json();
		try {
			userService.updateBase(user);
			j.setSuccess(true);
			j.setMsg("Edit successfully");
		} catch (Exception e) {
			logger.error(ExceptionUtil.getExceptionMessage(e));
			j.setMsg("Edit unsuccessfully");
		}
		return j;
	}
}
