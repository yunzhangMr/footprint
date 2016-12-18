package com.aj.footprint.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.general.dao.BaseDaoI;
import com.aj.general.util.Encrypt;
import com.aj.footprint.model.po.TUser;
import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.User;
import com.aj.footprint.service.UserServiceI;


@Service("userService")
public class UserServiceImpl implements UserServiceI {

	@Autowired
	private BaseDaoI<TUser> userDao;
	
	public User login(User user) {
//		System.out.println(user);
		TUser t = userDao.get("from TUser t where t.loginid = ? and t.password = ?", new Object[] { user.getLoginid(), Encrypt.e(user.getPassword()) });
//		System.out.println(t);
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
		System.out.println(u);
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

	public Pagination queryPage(Integer limit, Integer offset,
			Map<String, Object> params) {
		String sql = "select * from f_user where (roleids='1' or roleids='2' or roleids='3') ";
		if(!StringUtils.isEmpty((String)params.get("name"))){
			sql += " and username like '%%"+(String)params.get("name")+"%%'";
		}
		if(!StringUtils.isEmpty((String)params.get("phone"))){
			sql += " and telephone like '%%"+(String)params.get("phone")+"%%'";
		}
		if(!StringUtils.isEmpty((String)params.get("status"))){
			sql += " and `status` = '"+(String)params.get("status")+"'";
		}
		System.out.println(sql);
		return userDao.queryPage(sql,limit,offset);
	}

	public List<Map<String, Object>> queryTeachers(String name,String mobile) {
		String sql = "select sid,username,mobile from f_user  where `status` = 'Y' and roleids = 2 and (class_id='0' or class_id=null)";
		if(!StringUtils.isEmpty(name)){
			sql += " and username like '%%"+name+"%%'";
		}
		if(!StringUtils.isEmpty(mobile)){
			sql += " and mobile like '%%"+mobile+"%%'";
		}
		System.out.println(sql);
		return userDao.query(sql);
	}

	public void updatePart(User user) {
		/*System.out.println("111");*/
		TUser t = userDao.get(TUser.class, user.getSid());
	/*	System.out.println(t);*/
		//角色
		if(!StringUtils.isEmpty(user.getRoleids())){
			t.setRoleids(user.getRoleids());
		}
		//密码
		if(!StringUtils.isEmpty(user.getPassword())){
			// 有了默认密码后即可用上面的这种方式，不过前端必须传一个参数即使为'000'
//			t.setPassword(Encrypt.e("123456"));  
			t.setPassword(Encrypt.e(user.getPassword()));
		}
		/*System.out.println(user.getStatus());*/
		//状态
		if(!StringUtils.isEmpty(user.getStatus())){
			//删除老师，服务器端将状态默认设为"N"
//			t.setStatus("N");
			t.setStatus(user.getStatus());
		}
		//班级编号
		if(user.getClassId()!=null){
			t.setClassId(user.getClassId());
		}
		userDao.update(t);
	}

	public void updateBase(User user) {
		TUser t = userDao.get(TUser.class, user.getSid());
		//角色
		if(!StringUtils.isEmpty(user.getRoleids())){
			t.setRoleids(user.getRoleids());
		}
		//姓名
		if(!StringUtils.isEmpty(user.getUsername())){
			t.setUsername(user.getUsername());
		}
		//性别
		if(!StringUtils.isEmpty(user.getGender())){
			t.setGender(user.getGender());
		}
		//电话
		if(!StringUtils.isEmpty(user.getPhone())){
			t.setPhone(user.getPhone());
		}
		//手机
		if(!StringUtils.isEmpty(user.getMobile())){
			t.setMobile(user.getMobile());
		}
		//Email
		if(!StringUtils.isEmpty(user.getEmail())){
			t.setEmail(user.getEmail());
		}
		userDao.update(t);
	}

}
