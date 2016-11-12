package com.aj.footprint.service;

import java.util.List;

import com.aj.footprint.model.po.TMenu;
import com.aj.footprint.model.vo.Menu;
import com.aj.footprint.model.vo.TreeNode;
import com.aj.footprint.model.vo.User;

public interface MenuServiceI {

	/**
	 * treegrid
	 * 
	 * @param menu
	 * @return
	 */
	//获得菜单栏
	public List<TMenu> getMenu(User user);
	/*
	public List<Menu> treegrid(Menu menu);
	
	*//**
	 * get tree of menu
	 * 
	 * @param auth
	 * @param b
	 *            true/false - recursion of child nodes
	 * @return
	 *//*
	public List<TreeNode> tree(Menu menu,String roleid, Boolean b);*/

}
