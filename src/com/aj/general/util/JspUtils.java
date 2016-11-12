package com.aj.general.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
/**
 * 在jsp的一些方便方法
 * @author harvey
 *
 */
public class JspUtils extends ServletRequestUtils{

	/**
	 * 从request中获得参数Map，并返回Map<String,String>
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map getParameterMap(HttpServletRequest request) {
	    // 参数Map得到Map<String,String[])
	    Map properties = request.getParameterMap();
	    // 返回值Map
	    Map returnMap = new HashMap();
	    Iterator entries = properties.entrySet().iterator();
	    Map.Entry entry;
	    String name = "";
	    String value = "";
	    while (entries.hasNext()) {
	        entry = (Map.Entry) entries.next();
	        name = (String) entry.getKey();
	        Object valueObj = entry.getValue();
	        if(null == valueObj){
	            value = "";
	        }else if(valueObj instanceof String[]){
	            String[] values = (String[])valueObj;
	            value=org.springframework.util.StringUtils.arrayToCommaDelimitedString(values);
	        }else{
	            value = valueObj.toString();
	        }
	        returnMap.put(name, value);
	    }
	    return returnMap;
	}
	
	  /**
	   * 从一个参数中得到整数，如果没有值，返回缺省值
	   * @param request
	   * @param name
	   * @defaultvalue 缺省值
	   * @return
	   */
	  static public Integer getInteger(HttpServletRequest request, String name,
	      Integer defaultvalue) {
	    String p = request.getParameter(name);
	    if (StringUtils.isNumeric(p))
	      return Integer.valueOf(p);
	    else
	      return defaultvalue;
	  }

	  /**
	   * 从一个参数中得到整数，如果没有值，返回缺省值0
	   * @param request
	   * @param name
	   * @return
	   */
	  static public Integer getInteger(HttpServletRequest request, String name) {
	    String p = request.getParameter(name);
	    if (StringUtils.isNumeric(p))
	      return Integer.valueOf(p);
	    else
	      return Integer.valueOf(0);
	  }

	/**
	 * 从一个参数中得到整数，如果没有值，返回缺省值
	 * @param request
	 * @param name
	 * @defaultvalue 缺省值
	 * @return
	 */
    static public int getInt(HttpServletRequest request,String name,int defaultvalue){
    	String p = request.getParameter(name);
        if (StringUtils.isNotBlank(p)&& StringUtils.isNumeric(p))
            return Integer.parseInt(p); 
        else 
            return defaultvalue;
    }
	/**
	 * 从一个参数中得到整数，如果没有值，返回缺省值0
	 * @param request
	 * @param name
	 * @return
	 */
    static public int getInt(HttpServletRequest request,String name){
    	String p = request.getParameter(name);
        if (StringUtils.isNotBlank(p)&&  StringUtils.isNumeric(p))
            return Integer.parseInt(p); 
        else 
            return 0;
    }
    /**
     * 从一个参数中得到字符串
     * @param request
     * @param name
     * @defaultvalue 
     * @return
     */
    static public String getString(HttpServletRequest request,String name,String defaultvalue){
    	String value = request.getParameter(name); 
    	if (value==null)
    		return defaultvalue;
    	else return value;
    }
    
    /**
     * 从一个参数中得到字符串，缺省=""
     * @param request
     * @param name
     * @return
     */
    static public String getString(HttpServletRequest request,String name){
    	String value = request.getParameter(name); 
    	if (value==null)
    		return "";
    	else return value;
    }
 
    static public Date getDate(HttpServletRequest request,String name,String format){
    	String value = request.getParameter(name); 
    	if (value==null)
    		return null;
    	java.util.Date date = null;
		try {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		date = simpleDateFormat.parse(value);
		} catch (Exception ex) {
			return null;
		}
		return date;
    }

    static public Date getDate(HttpServletRequest request,String name){
    	return getDate(request,name,"yyyy-MM-dd");
    }
    
    static public Date getDateTime(HttpServletRequest request,String name){
    	return getDate(request,name,"yyyy-MM-dd HH:mm:ss");
    }
    
}
