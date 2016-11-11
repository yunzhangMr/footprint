package com.aj.footprint.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.general.dao.BaseDaoI;
import com.aj.general.util.Encrypt;
import com.aj.footprint.model.po.TUser;
import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.User;
import com.aj.footprint.service.UserServiceI;


@Service("userService")
public class UserServiceImpl implements UserServiceI {

	@Autowired
	private BaseDaoI<TUser> userDao;
	
	public User login(User user) {
		TUser t = userDao.get("from TUser t where t.loginid = ? and t.password = ?", new Object[] { user.getLoginid(), Encrypt.e(user.getPassword()) });
		if (t != null) {
			BeanUtils.copyProperties(t, user, new String[] { "password" });
			return user;
		}
		return null;
	}

	public void save(User user) {	
		TUser u = new TUser();
		BeanUtils.copyProperties(user, u, new String[] { "password" });
		u.setPassword(Encrypt.e(user.getPassword()));
		if (user.getCreatedate() == null) {
			u.setCreatedate(new Date());
		}			
		userDao.save(u);
	}

	public void update(User user) {	
		TUser u = userDao.get(TUser.class, user.getLoginid());
		BeanUtils.copyProperties(user, u, new String[] { "cid", "cpwd" });
		if (user.getPassword() != null && !user.getPassword().trim().equals("")) {
			u.setPassword(Encrypt.e(user.getPassword()));
		}
	}

	public DataGrid datagrid(User user) {
		DataGrid j = new DataGrid();
		j.setRows(this.changeModel(this.find(user)));
		j.setTotal(this.total(user));
		return j;
	}
	
	private List<User> changeModel(List<TUser> TUsers) {
		List<User> users = new ArrayList<User>();
		if (TUsers != null && TUsers.size() > 0) {
			for (TUser tu : TUsers) {
				User u = new User();
				BeanUtils.copyProperties(tu, u);
				users.add(u);
			}
		}
		return users;
	}
	
	private List<TUser> find(User user) {
		String hql = "from TUser t where 1=1 ";

		List<Object> values = new ArrayList<Object>();
		hql = addWhere(user, hql, values);

		if (user.getSort() != null && user.getOrder() != null) {
			hql += " order by " + user.getSort() + " " + user.getOrder();
		}
		return userDao.find(hql, values, user.getPage(), user.getRows());
	}
	
	private Long total(User user) {
		String hql = "select count(*) from TUser t where 1=1 ";
		List<Object> values = new ArrayList<Object>();
		hql = addWhere(user, hql, values);
		return userDao.count(hql, values);
	}

	private String addWhere(User user, String hql, List<Object> values) {
		if (user.getLoginid() != null && !user.getLoginid().trim().equals("")) {
			hql += " and t.cname like ? ";
			values.add("%%" + user.getLoginid().trim() + "%%");
		}

		return hql;
	}

	public void editUserInfo(User user) {
		if (user.getPassword() != null && !user.getPassword().trim().equals("")) {
			TUser t = userDao.get(TUser.class, user.getLoginid());
			t.setPassword(Encrypt.e(user.getPassword()));
		}
	}

}
