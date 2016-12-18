package com.aj.footprint.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj.footprint.model.po.TUser;
import com.aj.footprint.model.vo.Classes;
import com.aj.footprint.model.vo.Json;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.ClassServicel;
import com.aj.footprint.service.OwnInfoServicel;
import com.aj.general.util.Encrypt;
import com.aj.general.util.ResourceUtil;


@Controller
@RequestMapping("/manageOwnInfoController")
public class OwnInfoController {
	
	@Autowired
	private OwnInfoServicel ownInfoServicel;
    /**
     * @author wangxg
     * 每个菜单对应一个controller,进入菜单时先执行index（）方法，将需要在加载前查询的数据转发到目标jsp
     */
	
	/*@RequestMapping("/index")
	public String index(HttpServletRequest request){
		
		//从session中获取登录id
		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute(ResourceUtil.getSessionInfoName());
		 
		Map<String,Object> map = ownInfoServicel.findUserInfoById(sessionInfo.getLoginId());

			request.setAttribute("map", map);
			request.setAttribute("email", user.getEmail());
			request.setAttribute("name", "黄老邪");
		
		return "forward:/view/manageOwnInfo/changeOwnMessage.jsp";
	}*/
	
	@ResponseBody
	@RequestMapping("/saveOrUpdate")
	public Json saveOrUpdate(TUser tuser,String lastpassword){
		    
		    Json j = new Json();
		    //验证密码是否正确\
		    int count = ownInfoServicel.findCountBySql(tuser.getLoginid(),lastpassword);
		    
		    if(count==0){
		    	j.setMsg("-1");
		    	j.setSuccess(false);
		    	
		    	return j;
		    }
		    
		    //更新操作
			int  sta= ownInfoServicel.updateBySql(tuser);
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
