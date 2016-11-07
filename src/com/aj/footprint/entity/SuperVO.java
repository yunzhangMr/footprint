package com.aj.footprint.entity;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.aj.general.util.BeanUtil;
import com.aj.general.util.DateUtil;

public abstract class SuperVO implements Serializable,Cloneable {
	private static final long serialVersionUID = 1L;

	/**
	 * 字段映射：字段名称-显示名称
	 */
	protected Map<String, String> fieldsMap = new HashMap<String, String>();
	
	/**
	 * 实体字段集合
	 */
	private Field[] fields;
	
	/**
	 * 初始化字段映射，在子类中实现
	 */
	protected abstract void initFieldsMap();
	
	/**
	 * 比较实体内容
	 * @param obj
	 * @return 实体对象较obj改动的信息
	 */
	public String compareTo(SuperVO obj){
		StringBuilder ret = new StringBuilder();
		
		if(fieldsMap.size() == 0){
			initFieldsMap();
			fields = this.getClass().getDeclaredFields();
		}	
		
		for(Field field : fields){
			boolean flag = false;
			String name = field.getName();
			
			if(fieldsMap.containsKey(name)){
				try {
					Object val1 = BeanUtil.getFieldValue(this, name);
					Object val2 = BeanUtil.getFieldValue(obj, name);
					
					if(val1 != null || "".equals(val1)){
						if(val1.equals(val2)){
							flag = true;
						}
					}else if(val2 == null || "".equals(val2)){
						flag = true;
					}
					
					if(!flag){
						String val = "";
						if(val1 instanceof Date){
							Date date = (Date)val1;
							val = DateUtil.formatDateTime(date);
						}else if(val1 instanceof Integer){
							val = val1 == null ? "" : String.valueOf(val1);
						}else{
							val = val1 == null ? "" : String.valueOf(val1);
						}
						ret.append(fieldsMap.get(name) + ":" + val + ";");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return ret.length()==0 ? "" : ret.substring(0, ret.length()-1);
	}
	
	public Object clone(){
		Object vo = null;
		try{
			vo = super.clone();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
}
