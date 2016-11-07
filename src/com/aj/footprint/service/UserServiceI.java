package com.aj.footprint.service;

import java.util.List;

import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.User;

public interface UserServiceI {

	public User login(User user);

	public void save(User user);

	public void update(User user);

	public void editUserInfo(User user);
	
	public DataGrid datagrid(User user);

}
