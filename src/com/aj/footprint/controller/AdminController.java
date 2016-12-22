/*package com.aj.footprint.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj.footprint.model.po.TClass;
import com.aj.footprint.model.vo.Classes;
import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.service.ClassServicel;




@Controller
@RequestMapping("/adminController")
public class AdminController {
	@Autowired
	private ClassServicel classServicel;
	
	@ResponseBody
	@RequestMapping("/classManage")
	public Map<String,Object>  babyClassChange(Classes clazz) throws UnsupportedEncodingException{
		String str = null;
		String str1 = null;
		System.out.println("name="+clazz.getName());
		System.out.println("teacherName="+clazz.getTeacherName());
		str1 = URLDecoder.decode(clazz.getName(), "utf-8");
		str = URLDecoder.decode(clazz.getTeacherName(), "utf-8");
		System.out.println("teacherName="+str);
		System.out.println("pageSize="+clazz.getPageSize());
		System.out.println("pageNumber="+clazz.getPageNumber());
		System.out.println("offset="+clazz.getOffset());
		System.out.println("limit="+clazz.getLimit());
		
		clazz.setTeacherName(str);
		clazz.setName(str1);
		
		DataGrid j = classServicel.datagrid(clazz);
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("rows", j.getRows());
		map.put("total", j.getTotal());
		return map;

	}
	
	@RequestMapping("/classAdd")
//	@ResponseBody
	public void babyClassAdd(TClass tclass){
        
		classServicel.saveOrUpdateClass(tclass);
						
	}
	
	
}
*/