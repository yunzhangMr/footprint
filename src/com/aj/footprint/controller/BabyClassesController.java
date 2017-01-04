package com.aj.footprint.controller;

import java.sql.Timestamp;
import java.util.Date;
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

import com.aj.footprint.model.po.TBabyClasses;
import com.aj.footprint.model.po.TMoveLog;
import com.aj.footprint.model.vo.Json;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.BabyClassServiceI;
import com.aj.footprint.service.ClassServicel;
import com.aj.footprint.service.MoveLogServiceI;

@Controller
@RequestMapping("/babyClassesController")
public class BabyClassesController extends BaseController{

	private static final Logger logger = Logger.getLogger(BabyClassesController.class);
	
	@Autowired
	private BabyClassServiceI babyClassesService;
	@Autowired
	private MoveLogServiceI moveLogService;
	@Autowired
	private ClassServicel classService;
	
	//获取班级下的宝宝（分页的）
	@ResponseBody
	@RequestMapping(value="/babyClassesManage")
	public Map<String,Object>  teacherManage(int limit,int offset,String class_id,String status,String name,String birth,String grade,String cnum){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("classId", class_id);
		params.put("status", status);
		params.put("name", name);
		params.put("birth", birth);
		params.put("grade", grade);
		params.put("cnum", cnum);
		Pagination page = babyClassesService.queryPage(limit, offset, params);
		List list = page.getResultList();
		Integer total = page.getTotalRows();
	    //此处查出对象list集合 放入到 map中,key值为 rows,total 为总页数
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		System.out.println(limit);
		System.out.println(offset);
		System.out.println(class_id);
		System.out.println(status);
		System.out.println(name);
		System.out.println(birth);
		System.out.println(list);
		System.out.println(cnum);
		return map;

	}
	
	//获取班级下的宝宝
	@ResponseBody
	@RequestMapping(value="/getbabyClasses")
	public Map<String,Object>  getBabyByClass(String class_id,String status,String name,String birth){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("classId", class_id);
		params.put("status", status);
		params.put("name", name);
		params.put("birth", birth);
		List list = babyClassesService.queryBabys(params);
	    //此处查出对象list集合 放入到 map中,key值为 rows,total 为总页数
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("rows", list);
		/*System.out.println(limit);
		System.out.println(offset);*/
		System.out.println(class_id);
		System.out.println(status);
		System.out.println(name);
		System.out.println(birth);
		System.out.println(list);
		return map;
	}
	
	/*@ResponseBody
	@RequestMapping(value="/findBabyList")
	public Map<String,Object>  findBabyList(HttpServletRequest request,int limit,int offset,String order,String name,String grade,
			String term,String birth,String year,String classid){
		//说明 limit 每页数量   
		//offset 偏移量
		//order 排序 方式 （可有可无，可以在sql中控制 ）
		Map<String, Object> params = new HashMap<String, Object>();

		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		params.put("nurseryid", sessionInfo.getNurseryid());
		params.put("name", name);
		params.put("grade",grade);
		params.put("term",term);
		params.put("birth",birth);
		params.put("year",year);
		params.put("classid",classid);			
		
		Pagination page = doctorEvaluatelService.queryPageTBaby(limit, offset, params);
	    
		List<TClass> list = page.getResultList();
		Integer total = page.getTotalRows();
		
	    //此处查出对象list集合 放入到 map中,key值为 rows,total 为总页数
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;

	}*/
	
	//离园
	@ResponseBody
	@RequestMapping(value="/changeBase")
	public Json changeBase(TBabyClasses p){
		Json j = new Json();
		babyClassesService.update(p);
		j.setMsg("操作成功！");
		return j;
	}
	
	//调班
	@ResponseBody
	@RequestMapping(value="/changeClass")
	public Json changeClass(TBabyClasses p,String gradeNew,String cnumNew){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		Json j = new Json();
		babyClassesService.update(p);
		babyClassesService.updateClass(sessionInfo.getNurseryid().toString(), sessionInfo.getCreateyear(), sessionInfo.getTerm(), gradeNew, cnumNew, p.getBaby_id().toString());
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("nursery_id", sessionInfo.getNurseryid().toString());
		params.put("createyear", sessionInfo.getCreateyear());
		params.put("term", sessionInfo.getTerm());
		params.put("grade", gradeNew);
		params.put("cnum", cnumNew);
		List<Map<String, Object>> classList = classService.queryClasses(params);
		Number num = (Number) classList.get(0).get("id");  
		TMoveLog moveLog = new TMoveLog();
		moveLog.setPrevious(p.getClass_id());
		moveLog.setAfter(num.intValue());
		moveLog.setMovetime(new Timestamp(new Date().getTime()));
		moveLog.setActor(sessionInfo.getUserName());
		moveLogService.save(moveLog);
		j.setMsg("操作成功！");
		return j;
	}
}
