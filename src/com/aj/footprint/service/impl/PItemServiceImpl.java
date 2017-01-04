package com.aj.footprint.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.footprint.model.po.TItem;
import com.aj.footprint.model.po.TPItem;
import com.aj.footprint.service.PItemServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("pItemService")
public class PItemServiceImpl implements PItemServiceI {
	
	@Autowired
	private BaseDaoI<TPItem> pItemDao;

	public List<Map<String, Object>> getItems() {
		String sql = "select * from f_p_item ";
		return pItemDao.query(sql);
	}

}
