package com.aj.footprint.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aj.footprint.model.po.TClass;
import com.aj.footprint.service.ClassServicel;
import com.aj.footprint.service.UserServiceI;
import com.aj.general.util.JspUtils;



@Controller
@RequestMapping("/adminController")
public class AdminController {
	@Autowired
	private ClassServicel classServicel;
	
	@RequestMapping("/classManage")
	public List<TClass> babyClassChange(HttpServletRequest req,TClass tclass){
		
		
		List<TClass> list = null;	
		List<Object> param = new ArrayList<Object>();
		param.add(tclass.getSearch());
		param.add(tclass.getSearch());
		param.add(tclass.getSearch());
		param.add(tclass.getSearch());
		
		list = classServicel.getClassList(param,tclass.getLimit(),tclass.getRows());

		return list;
	}
}
