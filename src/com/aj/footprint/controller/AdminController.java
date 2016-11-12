package com.aj.footprint.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aj.footprint.model.vo.FClass;
import com.aj.footprint.service.ClassServicel;
import com.aj.footprint.service.UserServiceI;
import com.aj.general.util.JspUtils;
import com.alibaba.fastjson.JSONArray;



@Controller
@RequestMapping("/adminController")
public class AdminController {
	@Autowired
	private ClassServicel classServicel;
	
	@RequestMapping("/classManage")
	public String babyClassChange(HttpServletRequest req,FClass fclass){
		
		
		List<FClass> list = classServicel.getClassList(fclass,fclass.getLimit(),fclass.getRows());

		String jsonarray = JSONArray.toJSONString(list);
		String strResult = "{\"page\":"+1+",\"total\":"+1+",\"list\":" + jsonarray + "}";
		
		return strResult;
	}
}
