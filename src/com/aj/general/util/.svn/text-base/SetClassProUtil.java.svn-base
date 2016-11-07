package com.aj.general.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class SetClassProUtil {
	
	public static Object setPro(Class class1, Map<String,Object> pro){
		Object resultObj = null;
		try {
			Method[] methods = class1.getMethods();
			List<Method> properties = new ArrayList<Method>();
			for(Method method : methods) {
				if(method.getName().startsWith("set")) {
					properties.add(method);
				}
			}
			Object obj = class1.newInstance();
			for(Entry<String,Object> e:pro.entrySet()){
				for(Method p : properties){
					String proName = p.getName().substring(3);
					if(proName.equalsIgnoreCase(e.getKey().replace("_", ""))){
						if(e.getValue()!=null && !"".equals(e.getValue())){
							Class[] vTypes = p.getParameterTypes();
							System.out.println("MEHTOD: "+vTypes[0]);
							if(vTypes[0].equals(String.class)){
								p.invoke(obj, e.getValue().toString());
							}else if(vTypes[0].equals(Date.class)){
								Date date = null;
								try {
									date = DateUtil.parseDateTime(e.getValue().toString());
								} catch (Exception e1) {
									try {
										date = DateUtil.parseDate(e.getValue().toString());
									} catch (Exception e2) {
										date = DateUtil.parseDateTimeSec(e.getValue().toString());
									}
								}
								p.invoke(obj, date);
							}else if(vTypes[0].equals(Integer.class)){
								p.invoke(obj, Integer.parseInt(e.getValue().toString()));
							}
						}
						break;
					}
				}
			}
			resultObj = obj;
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return resultObj;
	}
	
	
	
	public static void setPro(Class class1,Object obj, Map<String,Object> pro){
		try {
			Method[] methods = class1.getMethods();
			List<Method> properties = new ArrayList<Method>();
			for(Method method : methods) {
				if(method.getName().startsWith("set")) {
					properties.add(method);
				}
			}
			for(Entry<String,Object> e:pro.entrySet()){
				for(Method p : properties){
					String proName = p.getName().substring(3);
					if(proName.equalsIgnoreCase(e.getKey().replace("_", ""))){
						if(e.getValue()!=null && !"".equals(e.getValue())){
							Class[] vTypes = p.getParameterTypes();
							System.out.println("MEHTOD: "+p.getName()+"   "+vTypes[0]);
							if(vTypes[0].equals(String.class)){
								p.invoke(obj, e.getValue().toString());
							}else if(vTypes[0].equals(Date.class)){
								Date date = null;
								try {
									date = DateUtil.parseDateTime(e.getValue().toString());
								} catch (Exception e1) {
									try {
										date = DateUtil.parseDate(e.getValue().toString());
									} catch (Exception e2) {
										date = DateUtil.parseDateTimeSec(e.getValue().toString());
									}
								}
								p.invoke(obj, date);
							}else if(vTypes[0].equals(Integer.class)){
								p.invoke(obj, Integer.parseInt(e.getValue().toString()));
							}
						}
						break;
					}
				}
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * Function description goes here.
	 * @params
	 * 	class1 样本类  class2赋值类    obj1  样本类对象  obj2 复制类对象
	 * @author wangli
	 * @date 2014-10-15
	 */
	public static void setProObject(Class class1,Class class2,Object obj1,Object obj2) throws Exception {
		Method[] methods1 = class1.getMethods();
		List<Method> properties1 = new ArrayList<Method>();
		for(Method method : methods1) {
			if(method.getName().startsWith("get")) {
				properties1.add(method);
			}
		}
		Method[] methods2 = class2.getMethods();
		List<Method> properties2 = new ArrayList<Method>();
		for(Method method : methods2) {
			if(method.getName().startsWith("set")) {
				properties2.add(method);
			}
		}
		for(Method m1 : properties1){
			String name1 = m1.getName().substring(3);
			for(Method m2 : properties2){
				String name2 = m2.getName().substring(3);
				if(name1.equalsIgnoreCase(name2)){
					Object ov = m1.invoke(obj1);
					if(ov!=null) {
						m2.invoke(obj2, ov);
						break;
					}
				}
			}
		}
	}
}
