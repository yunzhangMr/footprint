package com.aj.footprint.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aj.footprint.controller.BaseController;
import com.aj.footprint.model.po.TMenu;
import com.aj.footprint.model.vo.Menu;
import com.aj.footprint.model.vo.TreeNode;
import com.aj.footprint.model.vo.User;
import com.aj.footprint.service.MenuServiceI;
import com.aj.general.util.JspUtils;

@Controller
@RequestMapping("/menuController")
public class MenuController extends BaseController{

	private static final Logger logger = Logger.getLogger(MenuController.class);
	
	@Autowired
	private MenuServiceI menuService;
	//获取菜单栏
	@ResponseBody
	@RequestMapping("/dogetMenu")
	public List<TMenu> dogetMenu(HttpServletRequest request,Model model) {
		
		String roleids = JspUtils.getString(request, "roleids");
		
		User user = new User();
		user.setRoleids(roleids);
		 List<TMenu> list = menuService.getMenu(user);
		return list;
	}
	
/*	@ResponseBody
	@RequestMapping("/doNotNeedSession_tree/{roleid}")
	public List<TreeNode> doNotNeedSession_tree(Menu menu,@PathVariable String roleid) {
		return menuService.tree(menu,roleid, false);
	}
	
	@ResponseBody
	@RequestMapping("/doNotNeedSession_treeRecursive/{roleid}")
	public List<TreeNode> doNotNeedSession_treeRecursive(Menu menu,@PathVariable String roleid) {
		return menuService.tree(menu,roleid, true);
	}

	@ResponseBody
	@RequestMapping("/treegrid")
	public List<Menu> treegrid(Menu menu) {
		return menuService.treegrid(menu);
	}
	*/
	
}
