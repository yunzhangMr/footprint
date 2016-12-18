package com.aj.footprint.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.aj.footprint.model.po.TUser;
import com.aj.footprint.service.DoctorInfoServicel;
import com.aj.general.dao.BaseDaoI;
import com.aj.general.util.Encrypt;

@Service("doctorInfoService")
public class DoctorInfoServiceImpl implements DoctorInfoServicel{

	@Autowired
	private BaseDaoI<TUser> tuserDao;
	
	@Override
	public Map<String,Object> findUserInfoById(String id){
		
		String sql = " select id,telephone,email,mobile from f_user where id=?";
		Map<String,Object> map = tuserDao.findVo(sql, new Object[]{id});
		
		return map;
	}
	
	@Override
	public int findCountBySql(String id,String password){
		
		String sql = " select count(id) from f_user where id=? and password=? ";
		int count = tuserDao.findCountBySql(sql, new Object[]{id,Encrypt.e(password)});
		
		return count;
	}

	@Override
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public int updateBySql(TUser tuser){
		
		String sql = "";
		Object[] args = null;
		if(StringUtils.hasText(tuser.getPassword())){
			sql = " update f_user set telephone=?,mobile=?,password=(select MD5(?)),email=? where id=? "; 
			args = new Object[]{tuser.getPhone(),tuser.getMobile(),tuser.getPassword(),tuser.getEmail(),tuser.getLoginid()};
		}
		else{
			sql = "update f_user set telephone=?,mobile=?,email=? where id=?";
			args = new Object[]{tuser.getPhone(),tuser.getMobile(),tuser.getEmail(),tuser.getLoginid()}; 
		}
			
		return tuserDao.updateBySql(sql, args);
	}
}
