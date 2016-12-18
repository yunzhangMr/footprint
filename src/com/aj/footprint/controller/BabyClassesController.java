package com.aj.footprint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.service.BabyClassServiceI;
import com.aj.general.util.DecodeUtil;

@Controller
@RequestMapping("/babyClassesController")
public class BabyClassesController extends BaseController{

	private static final Logger logger = Logger.getLogger(BabyClassesController.class);
	
	@Autowired
	private BabyClassServiceI babyClassesService;
	
	//获取班级下的宝宝（分页的）
	@ResponseBody
	@RequestMapping(value="/babyClassesManage")
	public Map<String,Object>  teacherManage(int limit,int offset,String class_id,String status,String name){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("classId", DecodeUtil.decodeParameter(class_id.trim()));
		params.put("status", DecodeUtil.decodeParameter(status.trim()));
		params.put("name", DecodeUtil.decodeParameter(name.trim()));
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
		System.out.println(list);
		return map;

	}
}
