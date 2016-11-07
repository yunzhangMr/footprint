package com.aj.general.util;

import java.util.*;
import java.util.Map.Entry;
import org.apache.commons.lang.StringUtils;
import com.aj.yd.entity.VOAclconfig;
import com.aj.yd.entity.VOProject;
import com.aj.yd.entity.VORole;

public class DictUtil {
	
	/**
	 * 根目录绝对路径
	 */
	public static String rootPath;
	
	/**
	 * 角色列表
	 */
	public static List<VORole> roleList;
	
	/**
	 * 需要进行悬停显示的字段
	 */
	public static List<String> hoverFields;
	
	/**
	 * 资源映射：资源code->VOAclconfig
	 */
	public static Map<String, VOAclconfig> resourceMap = new HashMap<String, VOAclconfig>();
	
	/**
	 * 项目编号到项目的映射
	 */
	public static Map<String, VOProject> projectMap = new HashMap<String, VOProject>();
	
	/**
	 * 验证信息映射
	 */
	public static Map<String, String> validateMap = new HashMap<String, String>();
	
	/**
	 * 是/否
	 */
	public static String[] yesOrNo = {"是", "否"};
	
	/**
	 * 接听方式
	 */
	public static String[] answerWay = {"呼入", "呼出"};
	
	/**
	 * 币种
	 */
	public static String[] currencyType = {"人民币", "本外币"};
	
	/**
	 * 在保状态
	 */
	public static String[] secureStatus = {"保内", "保外"};
	
	/**
	 * 有/无
	 */
	public static String[] hasOrNo = {"有", "无"};
	
	/**
	 * 服务满意度
	 */
	public static String[] serviceSatisfaction = {"非常满意", "满意", "一般", "不满意"};
	
	/**
	 * 单据状态
	 */
	public static String[] orderStatus = {"已交", "未交"};
	
	/**
	 * 任务状态
	 */
	public static String[] taskStatus = {"未完成", "已完成", "已作废"};

	/**
	 * 获取角色下拉列表项
	 * @param selected
	 * @return
	 */
	public static String getRoleOptions(String selected){
		StringBuilder opt = new StringBuilder();
		String[] arr = StringUtils.isBlank(selected)?new String[0]:selected.split(",");
		List<String> list = Arrays.asList(arr);
		if(roleList != null){
			for(int i=0; i<roleList.size(); i++){
				VORole vo = roleList.get(i);
				if(list.contains(vo.getCode())){
					opt.append("<option value='").append(vo.getCode()).append("' selected>")
						.append(vo.getDescript()).append("</option>");
				}else{
					opt.append("<option value='").append(vo.getCode()).append("'>")
						.append(vo.getDescript()).append("</option>");
				}
			}
		}
		return opt.toString();
	}
	
	/**
	 * 从数组中获取下拉列表信息
	 * @param arr 包含下拉列表信息
	 * @param selected 选中项
	 * @param please 是否包含'--请选择--'下拉项
	 * @return
	 */
	public static String getOptionFromArray(String[] arr, String selected, boolean please){
		StringBuilder opt = new StringBuilder();
		
		if(please){
			opt.append("<option value='-1'>--请选择--</option>");
		}
		
		for(int i=0; i<arr.length; i++){
			if(StringUtils.isNotBlank(selected) && selected.equals(arr[i])){
				opt.append("<option value='").append(arr[i]).append("' selected>")
					.append(arr[i]).append("</option>");
			}else{
				opt.append("<option value='").append(arr[i]).append("'>")
					.append(arr[i]).append("</option>");
			}
		}
		
		return opt.toString();
	}
	
	/**
	 * 获取项目下拉列表选项
	 * @param selected
	 * @return
	 */
	public static String getProjectCheckedBox(String checked){
		StringBuilder opt = new StringBuilder();
		Iterator<Entry<String, VOProject>> i = projectMap.entrySet().iterator();
		String[] arr = StringUtils.isBlank(checked)?new String[0]:checked.split(",");
		List<String> list = Arrays.asList(arr);
		while(i.hasNext()){
			Entry<String, VOProject> entry = i.next();
			VOProject vo = entry.getValue();
			if("N".equals(vo.getIsAvailable())){
				continue;
			}
			if(list.contains(vo.getProjectid())){			
				opt.append("<input name='project' type='checkbox' value='").append(vo.getProjectid()).append("' checked>")
					.append(vo.getProjectname()).append("&nbsp;&nbsp;&nbsp;&nbsp;");
			}else{
				opt.append("<input name='project' type='checkbox' value='").append(vo.getProjectid()).append("'>")
					.append(vo.getProjectname()).append("&nbsp;&nbsp;&nbsp;&nbsp;");
			}
		}
		if(opt.length() == 0){
			opt.append("系统尚无项目分配");
		}
		return opt.toString();
	}
}
