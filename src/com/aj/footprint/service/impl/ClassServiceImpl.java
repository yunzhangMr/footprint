package com.aj.footprint.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.aj.footprint.model.po.TClass;
import com.aj.footprint.service.ClassServicel;
import com.aj.general.dao.BaseDaoI;

@Service("classService")
public class ClassServiceImpl implements ClassServicel{
	@Autowired
	private BaseDaoI<TClass> classDao;


	@Override
	public List<TClass> getClassList(List<Object> param,Integer page,Integer rows) {
		
		String hql = " from FClass c where (c.name=? or c.teacher1name=? or c.teacher2name=? or c.teacher3name=?) order by c.name ";
		 List<TClass> list = classDao.find(hql,param, page, rows);
		return list;
	}

}
