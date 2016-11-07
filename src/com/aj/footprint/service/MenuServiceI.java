package com.aj.footprint.service;

import java.util.List;

import com.aj.footprint.model.vo.Menu;
import com.aj.footprint.model.vo.TreeNode;

public interface MenuServiceI {

	/**
	 * treegrid
	 * 
	 * @param menu
	 * @return
	 */
	public List<Menu> treegrid(Menu menu);
	
	/**
	 * get tree of menu
	 * 
	 * @param auth
	 * @param b
	 *            true/false - recursion of child nodes
	 * @return
	 */
	public List<TreeNode> tree(Menu menu,String roleid, Boolean b);

}
