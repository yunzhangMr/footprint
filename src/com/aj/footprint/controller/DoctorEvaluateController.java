package com.aj.footprint.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj.footprint.model.po.TClass;
import com.aj.footprint.model.po.THealth;
import com.aj.footprint.model.vo.Json;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.DoctorEvaluateServicel;;


@Controller
@RequestMapping("/doctorEvaluateController")
public class DoctorEvaluateController {

	    @Autowired
	    private DoctorEvaluateServicel doctorEvaluatelService;
	
	    @ResponseBody
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
	
		}
	 
	    @RequestMapping(value="/editEvaluate")
	    public String editEvaluate(HttpServletRequest req,String action,String healthid,String gender,String createyear,
	    		String term,String grade,String classid,String bname,String cname,String id){
	    	
	    	//非新建状态，查询对应记录，新建状态直接跳转
	    	if(!action.equals("btn-add-evaluate")){
	    		Map<String,Object> map = doctorEvaluatelService.findHealthVo(Integer.parseInt(healthid));
	    		req.setAttribute("map", map);
	      		
	    	}
	    	
	    	req.setAttribute("action", action);
	    	req.setAttribute("id", id);
	    	req.setAttribute("bname", bname);
	    	req.setAttribute("gender", gender);
	    	req.setAttribute("createyear", createyear);
	    	req.setAttribute("term", term);
	    	req.setAttribute("grade", grade);
	    	req.setAttribute("classid", classid);
	    	req.setAttribute("cname", cname);
	    	
	    	return "forward:/view/doctor/evaluatemodel.jsp";
	    }
	    
	    @ResponseBody
		@RequestMapping(value="/doSaveEvaluate")
	    public Json doSaveEvaluate(HttpServletRequest request,THealth thealth){
	    	
	    	Json j = new Json();
	    	SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
	    	thealth.setCreatedate(new Date());
	    	thealth.setNursery_id(sessionInfo.getNurseryid());
	    	thealth.setTeacher_id(sessionInfo.getLoginId());
	    	thealth.setTeacher_name(sessionInfo.getUserName());
	    	doctorEvaluatelService.saveHealth(thealth);	    		

    		j.setSuccess(true);
    		j.setMsg("保存成功");
	    	return j;
	    }
	    
	    //获得班级列表
	    @ResponseBody
		@RequestMapping(value="/getTClassList")
	    public List<Map<String,Object>> getTClassList(HttpServletRequest request,String grade){
	
	    	SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
	    	List<Map<String,Object>> list = doctorEvaluatelService.getTClassList(new Object[]{grade,sessionInfo.getNurseryid()});

	    	return list;
	    }
	
}
