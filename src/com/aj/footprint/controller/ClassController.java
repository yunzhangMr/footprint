package com.aj.footprint.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aj.footprint.model.po.TClass;
import com.aj.footprint.model.vo.Classes;
import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.Json;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.model.vo.User;
import com.aj.footprint.service.ClassServicel;
import com.aj.footprint.service.UserServiceI;
import com.aj.general.util.DecodeUtil;
import com.aj.general.util.IpUtil;
import com.aj.general.util.ResourceUtil;




@Controller
@RequestMapping("/classController")
public class ClassController {
	@Autowired
	private ClassServicel classServicel;
	
	@Autowired
	private UserServiceI userService;
	
	//用户session信息
	
	
	//分页条件查询返回对应vo实体对象
	/*@ResponseBody
	@RequestMapping("/classManage")
	public Map<String,Object>  babyClassChange(Classes clazz) throws UnsupportedEncodingException{
		//将前端的encodeuri过的数据转为utf-8编码
		clazz.setName(DecodeUtil.decodeParameter(clazz.getName()));
		clazz.setTeacherName(DecodeUtil.decodeParameter(clazz.getTeacherName()));
		return classServicel.queryByCondition(clazz);
	}*/
	
	//根据条件查询得到分页的结果集
	@ResponseBody
	@RequestMapping(value="/classManage")
	public Map<String,Object>  babyClassChange(int limit,int offset,String order,String name,String teacherName){
		//说明 limit 每页数量   
		//offset 偏移量
		//order 排序 方式 （可有可无，可以在sql中控制 ）
		//nurseryName  teacherName 为查询参数，可以添加条件
//		teacherName = DecodeUtil.decodeParameter(teacherName);
//		System.out.println(name);
//		System.out.println("teacher="+teacherName);
		Map<String, Object> params = new HashMap<String, Object>();
		/*if(teacherName.trim().equals("")||name.trim().equals("")){
			offset = 0;
		}*/
		params.put("name", DecodeUtil.decodeParameter(name.trim()));
		params.put("teacherName", DecodeUtil.decodeParameter(teacherName.trim()));
//		System.out.println(params.get("name"));
//		System.out.println("%%"+params.get("teacherName")+"%%");
		Pagination page = classServicel.queryPageTClass(limit, offset, params);
	    
		List<TClass> list = page.getResultList();
		Integer total = page.getTotalRows();
	    //此处查出对象list集合 放入到 map中,key值为 rows,total 为总页数
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;

	}
	
	//新增一个班级
	@RequestMapping(value="/classAdd",method=RequestMethod.POST)
	@ResponseBody
	public Json addClass(Classes clazz){
		Json j = new Json();
		clazz.setId(null);
		clazz.setStatus("Y");
		clazz.setCreatedate(new Date());
		clazz.setCname(clazz.getGrade()+"（"+clazz.getCnum()+"）班");
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		clazz.setNursery_id(sessionInfo.getNurseryid());
		clazz.setNursery_name(sessionInfo.getNurseryname());
		clazz.setCreateyear(sessionInfo.getCreateyear());
		clazz.setTerm(sessionInfo.getTerm());
		Integer classId = classServicel.save(clazz);
		System.out.println(classId);
		if(!StringUtils.isEmpty(clazz.getTeacher1name())){
			User user = new User();
			user.setSid(Integer.valueOf(clazz.getTeacher1id()));
			user.setClassId(classId);
			userService.updatePart(user);
		}
		if(!StringUtils.isEmpty(clazz.getTeacher2name())){
			User user = new User();
			user.setSid(Integer.valueOf(clazz.getTeacher2id()));
			user.setClassId(classId);
			userService.updatePart(user);
		}
		if(!StringUtils.isEmpty(clazz.getTeacher3name())){
			User user = new User();
			user.setSid(Integer.valueOf(clazz.getTeacher3id()));
			user.setClassId(classId);
			userService.updatePart(user);
		}
		j.setMsg("新增班级成功！");
		j.setSuccess(true);
		return j;
	}
	
	//修改班级信息
	@RequestMapping(value="/classEdit",method=RequestMethod.POST)
	@ResponseBody
	public Json updateClass(Classes clazz){
		Json j = new Json();
		clazz.setCname(clazz.getGrade()+"（"+clazz.getCnum()+"）班");
		clazz.setCreatedate(new Date());
		classServicel.update(clazz);
		if(!clazz.getTeacher1id().equals(clazz.getTeacher1idOld())){
			User newUser = new User();
			newUser.setSid(Integer.valueOf(clazz.getTeacher1id()));
			newUser.setClassId(StringUtils.isEmpty(clazz.getTeacher1id())?0:clazz.getId());
			userService.updatePart(newUser);
			User oldUser = new User();
			oldUser.setSid(Integer.valueOf(clazz.getTeacher1idOld()));
			oldUser.setClassId(0);
			userService.updatePart(oldUser);
		}
		if(!clazz.getTeacher2id().equals(clazz.getTeacher2idOld())){
			User newUser = new User();
			newUser.setSid(Integer.valueOf(clazz.getTeacher2id()));
			newUser.setClassId(StringUtils.isEmpty(clazz.getTeacher1id())?0:clazz.getId());
			userService.updatePart(newUser);
			User oldUser = new User();
			oldUser.setSid(Integer.valueOf(clazz.getTeacher2idOld()));
			oldUser.setClassId(0);
			userService.updatePart(oldUser);
		}
		if(!clazz.getTeacher3id().equals(clazz.getTeacher3idOld())){
			User newUser = new User();
			newUser.setSid(Integer.valueOf(clazz.getTeacher3id()));
			newUser.setClassId(StringUtils.isEmpty(clazz.getTeacher1id())?0:clazz.getId());
			userService.updatePart(newUser);
			User oldUser = new User();
			oldUser.setSid(Integer.valueOf(clazz.getTeacher3idOld()));
			oldUser.setClassId(0);
			userService.updatePart(oldUser);
		}
		j.setMsg("修改班级信息成功！");
		j.setSuccess(true);
		return j;
	}
	
	//删除班级信息
	@RequestMapping(value="/classDel",method=RequestMethod.POST)
	@ResponseBody
	public Json delectClass(Classes clazz){
		Json j = new Json();
		clazz.setStatus("N");           //System.out.println(clazz);
		clazz.setCreatedate(new Date());
		classServicel.update(clazz);
		j.setMsg("删除该班级成功！");
		j.setSuccess(true);
		return j;
	}
	
	//创建班级（根据班数自动生成）
	@RequestMapping(value="/classCreate",method=RequestMethod.POST)
	@ResponseBody
	public Json createClass(Classes clazz){
		
		Json j = new Json();
		//幼儿园ID和名称在sessionInfo中，读进来放到vo对象的对应属性中
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		clazz.setNursery_id(sessionInfo.getNurseryid());
		clazz.setNursery_name(sessionInfo.getNurseryname());
		clazz.setCreateyear(sessionInfo.getCreateyear());
		clazz.setTerm(sessionInfo.getTerm());
		clazz.setCreatedate(new Date());
		clazz.setStatus("1");        //	            查看班级信息	System.out.println(clazz);
		//如果大班数量不为0，则对应创建相应数量的大班
		if(clazz.getSeniorClassNum()>0){
			String maxNum = classServicel.getMaxCNum(sessionInfo.getCreateyear(), "大", sessionInfo.getTerm());
			System.out.println(maxNum);
			int num = Integer.parseInt(maxNum);
			for(int i=0;i<clazz.getSeniorClassNum();i++){
				Classes v = new Classes();
				BeanUtils.copyProperties(clazz, v);
				v.setGrade("大");
				v.setCname("大（"+(num+i+1)+"）班");
				v.setCnum(""+(num+i+1));
				classServicel.save(v);
			}
		}
		//如果中班数量不为0，则对应创建相应数量的中班
		if(clazz.getMiddleClassNum()>0){
			String maxNum = classServicel.getMaxCNum(sessionInfo.getCreateyear(), "中", sessionInfo.getTerm());
			int num = Integer.parseInt(maxNum);
			for(int i=0;i<clazz.getMiddleClassNum();i++){
				Classes v = new Classes();
				BeanUtils.copyProperties(clazz, v);
				v.setGrade("中");
				v.setCname("中（"+(num+i+1)+"）班");
				v.setCnum(""+(num+i+1));
				classServicel.save(v);
			}
		}
		//如果小班数量不为0，则对应创建相应数量的小班
		if(clazz.getPrimaryClassNum()>0){
			String maxNum = classServicel.getMaxCNum(sessionInfo.getCreateyear(), "小", sessionInfo.getTerm());
			int num = Integer.parseInt(maxNum);
			for(int i=0;i<clazz.getPrimaryClassNum();i++){
				Classes v = new Classes();
				BeanUtils.copyProperties(clazz, v);
				v.setGrade("小");
				v.setCname("小（"+(num+i+1)+"）班");
				v.setCnum(""+(num+i+1));
				classServicel.save(v);
			}
		}
		j.setObj("success");
		j.setMsg("success");
		j.setSuccess(true);
		return j;             // return "eval([result:'success'])";
	}
	
	//获取未使用的班级
	@RequestMapping(value="/getCNum",method=RequestMethod.POST)
	@ResponseBody
	public Json getCNum(String createyear,String grade,String term){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		if(StringUtils.isEmpty(createyear)){
			createyear = sessionInfo.getCreateyear();
		}
		if(StringUtils.isEmpty(term)){
			term = sessionInfo.getTerm();
		}
		Json j = new Json();
		j.setObj(classServicel.getCNumNoUse(createyear, grade, term));
		j.setMsg("success");
		j.setSuccess(true);
		return j;
	}
	
	//验证班级下是否有学生
	@RequestMapping(value="/checkHaveBaby",method=RequestMethod.POST)
	@ResponseBody
	public Json checkClassHaveBaby(String id){
		Json j = new Json();
		j.setObj(classServicel.checkHaveBaby(id));
		j.setMsg("success");
		j.setSuccess(true);
		return j;
	}
	
}
