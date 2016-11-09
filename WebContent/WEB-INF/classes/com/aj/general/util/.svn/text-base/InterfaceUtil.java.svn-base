package com.aj.general.util;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.aj.yd.daemonMaintanance.OperationLogService;
import com.aj.yd.entity.VOErrorOrder;
import com.aj.yd.entity.VOOrderinfo;
import com.aj.yd.workOrderScheduling.WorkOrderService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class InterfaceUtil {

	/** 转换工具*/
	private static Gson gson = new GsonBuilder().enableComplexMapKeySerialization().create();
	/** 工单服务类 */
	private WorkOrderService workOrderService = (WorkOrderService)SpringUtil.getBean("workOrderService");
	private OperationLogService logService =  (OperationLogService)SpringUtil.getBean("operationLogService");
	
	/**
	 * 和设备管理系统通过接口进行数据传输
	 * @param date
	 * @return
	 */
	public void doOrderTrans(VOOrderinfo order, String action, String urlParam, String step, 
			String creatUser, String projectId, String newFlag) {
		final String json_order = gson.toJson(order, VOOrderinfo.class);
		Map<String, String> jMap = new HashMap<String,String>();
		// 对方接口的通行密码
		jMap.put("interface", "orderInterface#2015");
		// order类的JSON字符串
		jMap.put("orderInfo", json_order);
		// 项目名称
		jMap.put("projectName", logService.getProjectName(projectId));
		// 新老系统标识 OLD:老系统； NEW:新系统
		jMap.put("systemFlag", newFlag);
		
		OrderTransThread orderTransThread = new OrderTransThread(jMap, action, urlParam,step, 
				order.getOrderNo(), creatUser, projectId);
		orderTransThread.start();
	}
	
	/**
	 * 和设备管理系统通过接口进行数据传输
	 * @param date
	 * @return
	 */
	public boolean doOrderTransSyn(VOOrderinfo order, String action, String urlParam, String step, 
			String creatUser, String projectId, String newFlag) {
		boolean ret = true;
		final String json_order = gson.toJson(order, VOOrderinfo.class);
		Map<String, String> jMap = new HashMap<String,String>();
		// 对方接口的通行密码
		jMap.put("interface", "orderInterface#2015");
		// order类的JSON字符串
		jMap.put("orderInfo", json_order);
		// 项目名称
		jMap.put("projectName", logService.getProjectName(projectId));
		// 新老系统标识 OLD:老系统； NEW:新系统
		jMap.put("systemFlag", newFlag);
		
		String url = "";
	    if (!"".equals(action)) {
	    	url = Config.URL + "/" + action + "?" + urlParam;
	    } else {
	    	url = Config.URL;
	    }
	    // 传输Map参数
	    String reuslt =  HttpClientQuestUtil.doPost(url, jMap, "UTF-8", true);
	    if ("ERROR".equals(reuslt)) {
	    	ret = false;
	    } else {
	    	// 接口传输成功，对方返回失败时的情况
	    	Map<String, String> responseMap = new HashMap<String, String>();
	    	responseMap = gson.fromJson(reuslt, HashMap.class);
	    	String status = responseMap.get("status");
//	    	String msg = responseMap.get("msg");
	    	if ("failure".equals(status)) {
	    		ret = false;
	    	}
	    }
	    return ret;
	}
	
	/**
	 * 和设备管理系统通过接口进行数据传输
	 * @param date
	 * @return
	 */
	public String doOrderTransSynWithMessage(VOOrderinfo order, String action, String urlParam, String step, 
			String creatUser, String projectId, String newFlag) {
		String responseStr = "";
		final String json_order = gson.toJson(order, VOOrderinfo.class);
		Map<String, String> jMap = new HashMap<String,String>();
		// 对方接口的通行密码
		jMap.put("interface", "orderInterface#2015");
		// order类的JSON字符串
		jMap.put("orderInfo", json_order);
		// 项目名称
		jMap.put("projectName", logService.getProjectName(projectId));
		// 新老系统标识 OLD:老系统； NEW:新系统
		jMap.put("systemFlag", newFlag);
		// 操作人
		jMap.put("optname", creatUser);
		String url = "";
	    if (!"".equals(action)) {
	    	url = Config.URL + "/" + action + "?" + urlParam;
	    } else {
	    	url = Config.URL;
	    }
	    // 传输Map参数
	    String reuslt =  HttpClientQuestUtil.doPost(url, jMap, "UTF-8", true);
	    if ("ERROR".equals(reuslt)) {
	    	responseStr = "生成工单失败，接口传输异常！";
	    } else {
	    	// 接口传输成功，对方返回失败时的情况
	    	Map<String, String> responseMap = new HashMap<String, String>();
	    	responseMap = gson.fromJson(reuslt, HashMap.class);
	    	String status = responseMap.get("status");
	    	String msg = responseMap.get("msg");
	    	if (msg == null) {
	    		msg = "设备系统返回异常, 空指针异常！";
	    	}
	    	if ("failure".equals(status)) {
	    		responseStr = msg;
	    	} else {
	    		responseStr = "200";
	    	}
	    }
	    return responseStr;
	}
	
	/**
	 * 和设备管理系统通过接口进行数据传输
	 * @param date
	 * @return
	 */
	public String doOrderTransSynWithMessage(VOOrderinfo order, Map<String,String>keyMap, String action, String urlParam, String step, 
			String creatUser, String projectId, String newFlag) {
		String responseStr = "";
		final String json_order = gson.toJson(order, VOOrderinfo.class);
		Map<String, String> jMap = new HashMap<String,String>();
		// 对方接口的通行密码
		jMap.put("interface", "orderInterface#2015");
		// order类的JSON字符串
		jMap.put("orderInfo", json_order);
		// 项目名称
		jMap.put("projectName", logService.getProjectName(projectId));
		// 新老系统标识 OLD:老系统； NEW:新系统
		jMap.put("systemFlag", newFlag);
		// optname 操作用户
		jMap.put("optname", creatUser);
		if (keyMap != null) {
			//主机/手机
			jMap.put("mobilePhone", keyMap.get("mobilePhone"));
			//键盘/座机
			jMap.put("phone", keyMap.get("phone"));
			//电源
			jMap.put("powerSource", keyMap.get("powerSource"));
			//电源线
			jMap.put("powerLine", keyMap.get("powerLine"));
			//纸托
			jMap.put("paperBase", keyMap.get("paperBase"));
		}
		
		String url = "";
	    if (!"".equals(action)) {
	    	url = Config.URL + "/" + action + "?" + urlParam;
	    } else {
	    	url = Config.URL;
	    }
	    // 传输Map参数
	    String reuslt =  HttpClientQuestUtil.doPost(url, jMap, "UTF-8", true);
	    if (reuslt.contains("ERROR_")) {
	    	responseStr = "生成工单失败，接口传输异常！原因如下：" + reuslt;
	    } else {
	    	// 接口传输成功，对方返回失败时的情况
	    	Map<String, String> responseMap = new HashMap<String, String>();
	    	responseMap = gson.fromJson(reuslt, HashMap.class);
	    	String status = responseMap.get("status");
	    	String msg = responseMap.get("msg");
	    	if ("failure".equals(status)) {
	    		responseStr = msg;
	    	} else {
	    		responseStr = "200";
	    	}
	    }
	    return responseStr;
	}
	
	/**
	 * 和设备管理系统通过接口进行数据传输
	 * @param date
	 * @return
	 */
	public String doOrderTransSynWithMessage(Map transMap, String action, String urlParam, String step, 
			String creatUser, String projectId, String newFlag) {
		String responseStr = "";
		final String json_order = gson.toJson(transMap, HashMap.class);
		Map<String, String> jMap = new HashMap<String,String>();
		// 对方接口的通行密码
		jMap.put("interface", "orderInterface#2015");
		// order类的JSON字符串
		jMap.put("orderInfo", json_order);
		// 项目名称
		jMap.put("projectName", logService.getProjectName(projectId));
		// 新老系统标识 OLD:老系统； NEW:新系统
		jMap.put("systemFlag", newFlag);
		jMap.put("optname", creatUser);
		String url = "";
	    if (!"".equals(action)) {
	    	url = Config.URL + "/" + action + "?" + urlParam;
	    } else {
	    	url = Config.URL;
	    }
	    // 传输Map参数
	    String reuslt =  HttpClientQuestUtil.doPost(url, jMap, "UTF-8", true);
	    if ("ERROR".equals(reuslt)) {
	    	responseStr = "生成工单失败，接口传输异常！";
	    } else {
	    	// 接口传输成功，对方返回失败时的情况
	    	Map<String, String> responseMap = new HashMap<String, String>();
	    	responseMap = gson.fromJson(reuslt, HashMap.class);
	    	String status = responseMap.get("status");
	    	String msg = responseMap.get("msg");
	    	if ("failure".equals(status)) {
	    		responseStr = msg;
	    	} else {
	    		responseStr = "200";
	    	}
	    }
	    return responseStr;
	}
	
	class OrderTransThread extends Thread
	{
		// 传输的JSON数据
	    private String transJson;
	    // 传输的Map数据参数
	    private Map<String,String> paramMap;
	    // 请求的action
	    private String action;
	    // 请求的参数
	    private String urlParam;
	    // 工单的步骤
	    private String step;
	    // 工单号
	    private String orderNo;
	    // 工单号
	    private String creatUser;
	    // 项目编号
	    private String projectId;

	    /*
	     * 构造函数
	     */
	    public OrderTransThread(String transJson, String action, String urlParam, String step, 
	    		String orderNo, String creatUser, String projectId)
	    {
	        this.transJson = transJson;
	        this.step = step;
	        this.action = action;
	        this.urlParam = urlParam;
	        this.orderNo = orderNo;
	        this.creatUser = creatUser;
	        this.projectId = projectId;
	    }
	    
	    /*
	     * 构造函数
	     */
	    public OrderTransThread(Map<String,String> paramMap, String action, String urlParam, 
	    		String step, String orderNo, String creatUser, String projectId)
	    {
	        this.paramMap = paramMap;
	        this.step = step;
	        this.action = action;
	        this.urlParam = urlParam;
	        this.orderNo = orderNo;
	        this.creatUser = creatUser;
	        this.projectId = projectId;
	    }
	    
	    /*
	     * 线程主方法
	     * @see java.lang.Thread#run()
	     */
	    public void run()
	    {
	    	String url = "";
    	    if (!"".equals(action)) {
    	    	url = Config.URL + "/" + action + "?" + urlParam;
    	    } else {
    	    	url = Config.URL;
    	    }
    	    System.out.println("=====url======" + url);
    	    // 传输Map参数
    	    String reuslt =  HttpClientQuestUtil.doPost(url, paramMap, "UTF-8", true);
    	    System.out.println("===========" + reuslt);
    	    if ("ERROR".equals(reuslt)) {
    	    	// 数据库插入异常工单
    	    	VOErrorOrder errorVo = new VOErrorOrder();
    	    	errorVo.setOrderNo(orderNo);
    	    	errorVo.setProjectId(projectId);
    	    	errorVo.setCreatTime(new Date());
    	    	errorVo.setCreatName(creatUser);
    	    	if ("creat".equals(step)) {
    	    		// 开始创建工单
    	    		errorVo.setStep("01");
    	    		errorVo.setComment("接口传输失败,初始生成工单！");
    	    	} else if ("finish".equals(step)) {
    	    		// 完成工单
    	    		errorVo.setStep("02");
    	    		errorVo.setComment("接口传输失败,结束工单！");
    	    	} else if ("reDistribute".equals(step)) {
    	    		// 改派
    	    		errorVo.setStep("03");
    	    		errorVo.setComment("接口传输失败,改派工单！");
    	    	} else if ("abandon".equals(step)) {
    	    		// 作废
    	    		errorVo.setStep("04");
    	    		errorVo.setComment("接口传输失败,作废工单！");
    	    	}
    	    	try {
					workOrderService.saveErrorOrder(errorVo);
				} catch (Exception e) {
					e.printStackTrace();
				}
    	    } else {
    	    	// 接口传输成功，对方返回失败时的情况
    	    	Map<String, String> responseMap = new HashMap<String, String>();
    	    	responseMap = gson.fromJson(reuslt, HashMap.class);
    	    	String status = responseMap.get("status");
    	    	String msg = responseMap.get("msg");
    	    	System.out.print("=====msg===" + msg);
    	    	if ("failure".equals(status)) {
    	    		// 数据库插入异常工单
        	    	VOErrorOrder errorVo = new VOErrorOrder();
        	    	errorVo.setOrderNo(orderNo);
        	    	errorVo.setProjectId(projectId);
        	    	errorVo.setCreatTime(new Date());
        	    	errorVo.setCreatName(creatUser);
        	    	if ("creat".equals(step)) {
        	    		// 开始创建工单
        	    		errorVo.setStep("01");
        	    		errorVo.setComment("接口传输返回失败,初始生成工单！具体原因：" + msg);
        	    	} else if ("finish".equals(step)) {
        	    		// 介绍工单
        	    		errorVo.setStep("02");
        	    		errorVo.setComment("接口传输返回失败,结束工单！具体原因：" + msg);
        	    	} else if ("reDistribute".equals(step)) {
        	    		// 改派
        	    		errorVo.setStep("03");
        	    		errorVo.setComment("接口传输返回失败,改派工单！具体原因：" + msg);
        	    	} else if ("abandon".equals(step)) {
        	    		// 改派
        	    		errorVo.setStep("04");
        	    		errorVo.setComment("接口传输返回失败,作废工单！具体原因：" + msg);
        	    	}
        	    	try {
    					workOrderService.saveErrorOrder(errorVo);
    				} catch (Exception e) {
    					e.printStackTrace();
    				}
    	    	}
    	    }
	    }
	}
}
