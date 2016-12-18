package com.aj.footprint.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aj.footprint.model.po.TUser;
import com.aj.footprint.service.OwnInfoServicel;
import com.aj.general.dao.BaseDaoI;
import com.aj.general.util.Encrypt;

@Service("ownInfoService")
public class OwnInfoServiceImpl implements OwnInfoServicel{

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
		
		String sql = " update f_user set telephone=?,mobile=?,password=(select MD5(?)),email=? where id=? "; 
		
		return tuserDao.updateBySql(sql, new Object[]{tuser.getPhone(),tuser.getMobile(),tuser.getPassword(),tuser.getEmail(),tuser.getLoginid()});
	}
}
