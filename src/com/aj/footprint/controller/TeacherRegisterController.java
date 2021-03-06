package com.aj.footprint.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj.footprint.model.po.TBaby;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.TeacherRegisterServicel;

@Controller
@RequestMapping("/teacherRegisterController")
public class TeacherRegisterController {

	@Autowired
    private TeacherRegisterServicel teacherRegisterServicel;
	
	@ResponseBody
	@RequestMapping(value="/checkNameSpell")
	public String checkNameSpell(String bnamespell){
		
		String newnamespell = teacherRegisterServicel.getBNameSpell(bnamespell);
		if(!StringUtils.hasText(newnamespell)){
			newnamespell = bnamespell;
		}
		return newnamespell;
	}
	
	@ResponseBody
	@RequestMapping(value="/doSaveBaby")
	public String doSaveBaby(HttpServletRequest request,TBaby tbaby,String bbirth){
		
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		tbaby.setNursery_id(sessionInfo.getNurseryid());		
		tbaby.setCreateuser(sessionInfo.getLoginId());
		tbaby.setCreatedate(new Date());
		tbaby.setParent_id(tbaby.getNamespell());
		
		SimpleDateFormat format =   new SimpleDateFormat( "yyyy-MM-dd" );
		
		try {
			Date birth = (Date)format.parseObject(bbirth);
			tbaby.setBirth(birth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return teacherRegisterServicel.doSaveBaby(tbaby);
	}
	
}
