package com.aj.footprint.service;

import java.util.List;

import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.Baby;

public interface BabyServiceI {

	public void save(Baby baby);

	public void update(Baby baby);
	
	public DataGrid datagrid(Baby baby);

}
