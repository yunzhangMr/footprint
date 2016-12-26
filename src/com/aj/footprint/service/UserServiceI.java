package com.aj.footprint.service;

import java.util.List;
import java.util.Map;

import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.model.vo.User;

public interface UserServiceI {

	public User login(User user);

	public void save(User user);

	public void update(User user);

	public void editUserInfo(User user);
	
	public DataGrid datagrid(User user);
	
	/**
	 * 根据limit，offset，map条件查询 结果集Page
	 * @param limit
	 * @param offset
	 * @param params
	 * @return
	 */
	public Pagination queryPage(Integer limit,Integer offset,Map<String,Object> params);

	/**
	 * 根据姓名，手机查询到的所有老师信息（id，username）
	 * @param name
	 * @param mobile
	 * @return
	 */
	public List<Map<String, Object>> queryTeachers(String name,String mobile);
	
	/**
	 * 修改用户状态，密码，角色，班级单一属性
	 * @param user
	 */
	public void updatePart(User user);
	
	/**
	 * 修改用户的基本信息（包括姓名，性别，电话，手机，Email等）
	 * @param user
	 */
	public void updateBase(User user);
	
	/**
	 * 根据sid,角色查询一些其他相关信息
	 * @param sid
	 * @param roleids
	 * @return
	 */
	public List<Map<String, Object>> queryOthers(Integer sid,String roleids);
	
}
