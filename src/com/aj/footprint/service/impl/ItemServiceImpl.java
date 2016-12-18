package com.aj.footprint.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.footprint.model.po.TBabyClasses;
import com.aj.footprint.model.po.TItem;
import com.aj.footprint.service.ItemServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("itemService")
public class ItemServiceImpl implements ItemServiceI {

	@Autowired
	private BaseDaoI<TItem> itemDao;
	
	public List<Map<String, Object>> getItems(String grade, String term) {
		String sql = "select code,quota,descript,type,displayorder from f_item where grade='"+grade+"' and term='"+term+"'";
		return itemDao.query(sql);
	}

}
