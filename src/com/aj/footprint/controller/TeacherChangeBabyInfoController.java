package com.aj.footprint.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj.footprint.model.po.TBaby;
import com.aj.footprint.model.po.TClass;
import com.aj.footprint.model.po.TUser;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.TeacherChangeBabyInfoServiceI;

@Controller
@RequestMapping("/teacherChangeBabyInfoController")
public class TeacherChangeBabyInfoController {

	@Autowired
    private TeacherChangeBabyInfoServiceI teacherChangeBabyInfoServiceI;
	
	@ResponseBody
	@RequestMapping(value="/findBabyList")
	public Map<String,Object>  findBabyList(HttpServletRequest request,int limit,int offset,String order,String bname,String parentname){

		Map<String, Object> params = new HashMap<String, Object>();

		SessionInfo sessionInfo = (SessionInfo)request.getSession().getAttribute("sessionInfo");
		params.put("nurseryid", sessionInfo.getNurseryid());
		params.put("loginid", sessionInfo.getLoginId());
		params.put("bname", bname);
		params.put("parentname",parentname);
	    
		
		Pagination page = teacherChangeBabyInfoServiceI.queryPageTBaby(limit, offset, params);
	    
		List<TClass> list = page.getResultList();
		Integer total = page.getTotalRows();
		
	    //此处查出对象list集合 放入到 map中,key值为 rows,total 为总页数
		Map<String,Object> map= new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;

	}
	 
	
	@RequestMapping(value="/editBabyInfo")
    public String editEvaluate(HttpServletRequest req,String id,String bname,String gender,String birth,String parentid,
    		String parentname,String animalsign,String telephone,String nickname,String nurture){
    	
    	req.setAttribute("id", id);
    	req.setAttribute("bname", bname);
    	req.setAttribute("gender", gender);
    	req.setAttribute("birth", birth);
    	req.setAttribute("parentid", parentid);
    	req.setAttribute("telephone", telephone);
    	req.setAttribute("parentname", parentname);
    	req.setAttribute("animalsign", animalsign);
    	req.setAttribute("nickname", nickname);
    	req.setAttribute("nurture", nurture);
    	
    	return "forward:/view/teacher/babyInfo/changeBabyInfomodel.jsp";
    }
	
	@ResponseBody
	@RequestMapping(value="/doSaveBabyInfo")
	public String doSaveBabyInfo(TBaby tbaby,String birthday) throws Exception{
			    
		TUser tuser = new TUser();
		tuser.setUsername(tbaby.getParent_name());
		tuser.setLoginid(tbaby.getParent_id());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birth=sdf.parse(birthday);
		tbaby.setBirth(birth);
		
		return teacherChangeBabyInfoServiceI.dosave(tbaby, tuser);
 
		
	}
	 
	
}
