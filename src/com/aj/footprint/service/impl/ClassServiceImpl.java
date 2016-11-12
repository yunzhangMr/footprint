package com.aj.footprint.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.aj.footprint.model.vo.FClass;
import com.aj.footprint.service.ClassServicel;
import com.aj.general.dao.BaseDaoI;

@Service("classService")
public class ClassServiceImpl implements ClassServicel{
	@Autowired
	private BaseDaoI<FClass> classDao;


	@Override
	public List<FClass> getClassList(FClass fclass,Integer page,Integer rows) {
		
		String hql = "";
		Object[] obj = null;
		if(fclass.getSearch()!=null){
			obj= new Object[]{fclass.getSearch(),fclass.getSearch(),fclass.getSearch()};
			hql = " from TClass c where (c.name=? or c.teacher1name=? or c.teacher2name=? or c.teacher3name=?) order by c.name ";			
		}else{
			hql = " from TClass c order by c.name ";
		}
		 List<FClass> list = classDao.find(hql,obj, page, rows);
		return list;
	}

}
