package com.aj.footprint.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj.footprint.model.po.TUser;
import com.aj.footprint.model.vo.Json;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.DoctorInfoServicel;
import com.aj.general.util.ResourceUtil;


@Controller
@RequestMapping("/doctorInfoController")
public class DoctorInfoController {
	
	@Autowired
	private DoctorInfoServicel doctorInfoServicel;
	
	@ResponseBody
	@RequestMapping("/saveOrUpdate")
	public Json saveOrUpdate(TUser tuser,String lastpassword){
		    
		    Json j = new Json();
		    //验证密码是否正确\
		    int count = doctorInfoServicel.findCountBySql(tuser.getLoginid(),lastpassword);
		    
		    if(count==0){
		    	j.setMsg("-1");
		    	j.setSuccess(false);
		    	
		    	return j;
		    }
		    
		    //更新操作
			int  sta= doctorInfoServicel.updateBySql(tuser);
			if(sta==1){
			   j.setMsg("修改个人信息成功！");
			   j.setSuccess(true);
			}
			else{
			   j.setMsg("修改个人信息失败！");
			   j.setSuccess(false);
			}
			return j;
	
	}
	
}
