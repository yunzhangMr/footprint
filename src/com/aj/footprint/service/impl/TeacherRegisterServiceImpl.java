package com.aj.footprint.service.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.aj.footprint.model.po.TBaby;
import com.aj.footprint.model.po.TUser;
import com.aj.footprint.model.vo.SessionInfo;
import com.aj.footprint.service.TeacherRegisterServicel;
import com.aj.general.dao.BaseDaoI;
import com.aj.general.util.Encrypt;

@Service("teacherRegisterService")
public class TeacherRegisterServiceImpl implements TeacherRegisterServicel{
	
	@Autowired
	private BaseDaoI<TUser> tuserDao;
	@Autowired
	private BaseDaoI<TBaby> tbabyDao;
	
	public String getBNameSpell(String bnamespell){
		
		String sql = " select Max(namespell)as namespell from f_baby where namespell LIKE '%"+bnamespell+"%'  ";
		Map<String,Object> map = tuserDao.queryObjBysql(sql, new Object[]{});
		
		String maxnamespell =  map.get("namespell")==null?"":map.get("namespell").toString();		
		String newnamespell = "";
		if(StringUtils.hasText(maxnamespell)){
			//判断字符串是否以数字结尾
			Pattern pattern = Pattern.compile("\\d+$"); 
			Matcher isNum = pattern.matcher(maxnamespell);
			if(isNum.find()){
				String ord = maxnamespell.substring(maxnamespell.length()-3, maxnamespell.length());
				String lastnamespell = maxnamespell.replaceAll(ord, "");
				//生成新的序列
				int neword = Integer.parseInt(ord)+1;
				newnamespell = lastnamespell+this.changeToNewStr(neword);
				
			}
			else{//非数字结尾
				newnamespell = maxnamespell+"001";
			}
		}
		
		
		return newnamespell;
	}
	
	//格式化序列
	public String changeToNewStr(int ord){
		if(ord<=9){
			return "00"+ord;
		}
		else if(9<ord&&ord<=99){
			return "0"+ord;
		}
		else{
			return ""+ord;
		}
	}
	
	//存入f_baby 与f_user表
	@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED, isolation = Isolation.REPEATABLE_READ)
	public String doSaveBaby(TBaby tbaby){
		
		TUser tuser = new TUser();
		tuser.setLoginid(tbaby.getParent_id());
		//初始密码
		tuser.setPassword(Encrypt.e("123456"));
		tuser.setRoleids("3");
		tuser.setCreatedate(new Date());
		tuser.setNurseryid(tbaby.getNursery_id());

		tbabyDao.save(tbaby);
		tuserDao.save(tuser);
			
		return "success";
	}

}
