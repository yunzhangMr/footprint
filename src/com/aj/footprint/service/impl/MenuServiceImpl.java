package com.aj.footprint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.footprint.model.po.TMenu;
import com.aj.footprint.model.vo.User;
import com.aj.footprint.service.MenuServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("menuService")
public class MenuServiceImpl implements MenuServiceI {

	@Autowired
	private BaseDaoI<TMenu> menuDao;

	@Override
    public List<TMenu> getMenu(User user){
    	
		String hql = " from TMenu m where m.roleid=? order by m.seq asc";
	//	String hql = " from TMenu m where m.roleid in (?) order by m.seq asc";
		List<TMenu> list = menuDao.find(hql, new Object[]{user.getRoleids()});
    	return list;
    }


/*
	public List<TreeNode> tree(Menu menu,String roleid, Boolean b) {
		List<Object> param = new ArrayList<Object>();
		String hql = "from TMenu t where t.TMenu = '0' and t.roleids='"+roleid+"' order by t.seq";
		if (menu != null && menu.getId() != null && !menu.getId().trim().equals("")) {
			hql = "from TMenu t where t.TMenu.mid = ? order by t.seq";
			param.add(menu.getId());
		}
		List<TMenu> l = menuDao.find(hql, param);
		System.out.println("-------------"+l.size()+"-----------");
		List<TreeNode> tree = new ArrayList<TreeNode>();
		for (TMenu t : l) {
			tree.add(this.tree(t, b));
		}
		return tree;
	}

	private TreeNode tree(TMenu t, boolean recursive) {
		TreeNode node = new TreeNode();
		node.setId(t.getMid());
		node.setText(t.getFname());
		Map<String, Object> attributes = new HashMap<String, Object>();
		attributes.put("url", t.getFurl());
		node.setAttributes(attributes);
		if (t.getIcon() != null) {
			node.setIconCls(t.getIcon());
		} else {
			node.setIconCls("");
		}
		if (t.getTmenus() != null && t.getTmenus().size() > 0) {
			node.setState("closed");
			if (recursive) {// query child nodes recursively
				List<TMenu> l = new ArrayList<TMenu>(t.getTmenus());
				Collections.sort(l, new MenuComparator());// sort
				List<TreeNode> children = new ArrayList<TreeNode>();
				for (TMenu r : l) {
					TreeNode tn = tree(r, true);
					children.add(tn);
				}
				node.setChildren(children);
				node.setState("open");
			}
		}
		return node;
	}

	public List<Menu> treegrid(Menu menu) {
		List<TMenu> l;
		if (menu != null && menu.getId() != null) {
			l = menuDao.find("from TMenu t where t.TMenu.mid = ? order by t.seq", new Object[] { menu.getId() });
		} else {
			l = menuDao.find("from TMenu t where t.TMenu = '' order by t.seq");
		}
		return changeModel(l);
	}

	private List<Menu> changeModel(List<TMenu> TMenus) {
		List<Menu> l = new ArrayList<Menu>();
		if (TMenus != null && TMenus.size() > 0) {
			for (TMenu t : TMenus) {
				Menu m = new Menu();
				BeanUtils.copyProperties(t, m);
				if (t.getTMenu() != null) {
					m.setPid(t.getTMenu().getMid());
					m.setPname(t.getTMenu().getFname());
				}
				if (countChildren(t.getMid()) > 0) {
					m.setState("closed");
				}
				if (t.getIcon() == null) {
					m.setIconCls("");
				} else {
					m.setIconCls(t.getIcon());
				}
				l.add(m);
			}
		}
		return l;
	}

	*//**
	 * count child nodes
	 *//*
	private Long countChildren(String pid) {
		return menuDao.count("select count(*) from TMenu t where t.TMenu.mid = ?", new Object[] { pid });
	}

*/

}
