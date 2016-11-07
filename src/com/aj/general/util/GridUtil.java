package com.aj.general.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.text.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import java.util.*;


public class GridUtil {
	
	static Logger log = Logger.getLogger(GridUtil.class);

	public static int getInteger(HttpServletRequest request, String name){		
		return getInteger(request, name, 0);
	}
	
	public static int getInteger(HttpServletRequest request, String name, int defaultVal){
		int ret = defaultVal;
		
		String str = request.getParameter(name);
		
		if(StringUtils.isNotBlank(str) && StringUtils.isNumeric(str)){
			ret = Integer.parseInt(str);
		}
		
		return ret;
	}
	
	public static String getString(HttpServletRequest request, String name){
		return getString(request, name, null);
	}
	
	public static String getString(HttpServletRequest request, String name, String defaultVal){
		String ret = "";
		
		ret = request.getParameter(name);
		if(ret == null){
			ret = defaultVal;
		}
		
		return ret;
	}
	
	/**
	 * 从一个参数中得到中文字符串，缺省=""
	 * gm   2012-4-16
	 * @param request
	 * @param name
	 * @return
	 */
	public static String getGBKString(HttpServletRequest request, String name) {
		try{
			String value = request.getParameter(name);
			if (value == null)
				value = "";
			else
				value = URLDecoder.decode(value, "utf-8");
			if(value.contains("\\")){
				value = value.replace("\\", "/");
			}
			return value;
		}catch(UnsupportedEncodingException e){
			log.error("编码转换错误", e);
			return "";
		}
	}
	
	public static void printCell(StringBuilder out, Object value, Map<Object, Object> dict, String defaultvalue){
    	out.append("<cell>");
    	
    	if (value==null){
			out.append(defaultvalue);
			out.append("</cell>");
    	}else{
    		Object dictvalue = dict.get(value);
    		if (dictvalue==null){
    			out.append(defaultvalue);
    			out.append("</cell>");    		   
    		}else{
    			out.append(dictvalue);
    			out.append("</cell>");
    		}
    	}
    }

	public static void printCell(StringBuilder out, Object value, String format){
		if (value==null) 
    		out.append("<cell/>");
    	else if (value instanceof String){
    		out.append("<cell>"+value+"</cell>");
    	}else if (value instanceof Date){
    		String pattern = format;
    		if (StringUtils.isBlank(format)){
    			pattern = "yyyy-MM-dd";
    		}
    		out.append("<cell>"+new SimpleDateFormat(pattern).format(value)+"</cell>");
    	}else if (value instanceof Integer){
    		out.append("<cell>"+value+"</cell>");
    	}else if (value instanceof Number){
    		String pattern = format;
    		if (StringUtils.isBlank(format)){
    			pattern = "#0.00";
    		}
    		out.append("<cell>"+new DecimalFormat(pattern).format(value)+"</cell>");
    	}else{
    		out.append("<cell>"+value+"</cell>");
    	}
    }
    
	public static void printCell(StringBuilder out,Object value){
    	printCell(out,value,null);
    }
    
	public static void printStartRows(StringBuilder out,int pos,int total){
    	out.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
    	out.append("<rows pos=\""+pos+"\" total_count=\"" + total + "\">");
    }
 
	public static void printEndRows(StringBuilder out){
    	out.append("</rows>");
    }

	public static void printStartRow(StringBuilder out,Object rowid){
    	out.append("<row id =\"" + rowid + "\">");
    }
	
	public static void printEndRow(StringBuilder out){
    	out.append("</row>");
    }
	
	public static void printStartHead(StringBuilder out){
		out.append("<head>");
	}
	
	public static void printEndHead(StringBuilder out){
		out.append("</head>");
	}
	
	public static void printColumn(StringBuilder out, int width, String type, String align,
			String sort, String title){
		out.append("<column width=\"").append(width).append("\" type=\"")
			.append(type).append("\" align=\"").append(align).append("\" sort=\"")
			.append(sort).append("\" ");
		
		if(width <= 0){
			out.append("hidden=\"true\"");
		}
		
		out.append(">").append(title).append("</column>");
	}
	
	
	public static void exportColumn(JspWriter out, Object val, int flag, boolean isLast) throws IOException{
		String outStr = "";
		if(val == null){
			outStr = "";
		}else if(val instanceof String){
			outStr = (String)val;
			outStr = outStr.replace("\"", "“");
			outStr = outStr.replace(",", "，");
			outStr = outStr.replace("\n", "\t");
			outStr = StringEscapeUtils.escapeCsv(outStr);
			if(flag == 0){
				outStr = "\"" + outStr + "\"";
			}else if(flag == 1){
				outStr = outStr + "\t";
			}else{
				outStr = "\"" + outStr + "\t\"";
			}
		}else if(val instanceof Date){
			outStr = DateUtil.formatDateTime((Date)val);
		}else if(val instanceof Integer){
			outStr = String.valueOf(val) + "\t";
		}
		
		if(isLast){
			out.print(outStr + "\n");
		}else{
			out.print(outStr + ",");
		}
	}
	
	public static int getInt(Object obj){
		int ret = 0;
		
		if(obj instanceof BigDecimal){
			ret = ((BigDecimal)obj).intValue();
		}else if(obj instanceof BigInteger){
			ret = ((BigInteger)obj).intValue();
		}
		
		return ret;
	}
}
