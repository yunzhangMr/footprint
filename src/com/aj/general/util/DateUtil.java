package com.aj.general.util;

import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class DateUtil {
	static Logger log = Logger.getLogger(DateUtil.class);
	static String datePattern_show = "yyyy-MM-dd";
	static String timePattern = "yyyy-MM-dd HH:mm";
	static String datePattern_id = "yyMMdd";
	static String timeSecPattern = "yyyy-MM-dd HH:mm:ss";
	
	/**
	 * 格式化日期为yyyy-MM-dd形式
	 * @param date
	 * @return
	 */
	public static String formatDate(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat(datePattern_show);
		String strDate = "";
		
		if(date != null){
			strDate = sdf.format(date);
		}
		
		return strDate;
	}
	
	/**
	 * 格式化日期为yyyy-MM-dd HH:mm形式
	 * @param time
	 * @return
	 */
	public static String formatDateTime(Date time){
		SimpleDateFormat sdf = new SimpleDateFormat(timePattern);
		String strTime = "";
		
		if(time != null){
			strTime = sdf.format(time);
		}
		
		return strTime;
	}
	
	/**
	 * 按指定的格式格式化时间
	 * @param time 时间
	 * @param pattern 时间格式
	 * @return
	 */
	public static String formatDateTime(Date time, String pattern){
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		StringBuffer strTime = new StringBuffer();
		
		if(time != null){
			strTime.append(sdf.format(time));
		}
		
		return strTime.toString();
	}
	
	/**
	 * 将形式为yyyy-MM-dd的字符串转换为日期类型
	 * @param strDate
	 * @return
	 */
	public static Date parseDate(String strDate){
		Date date = null;
		if(StringUtils.isBlank(strDate)){
			return null;
		}
		
		try{
			SimpleDateFormat sdf = new SimpleDateFormat(datePattern_show);
			date = sdf.parse(strDate);
		}catch (Exception e) {
			log.error("字符串转日期出错", e);
		}
		
		return date;
	}
	
	/**
	 * 将形式为yyyy-MM-dd HH:mm的字符串转换为日期类型
	 * @param strDate
	 * @return
	 */
	public static Date parseDateTime(String strDate){
		Date date = null;
		if(StringUtils.isBlank(strDate)){
			return null;
		}
		
		try{
			SimpleDateFormat sdf = new SimpleDateFormat(timePattern);
			date = sdf.parse(strDate);
		}catch (Exception e) {
			log.error("字符串转日期出错", e);
		}
		
		return date;
	}
	
	/**
	 * 格式化日期，用于工单号中的日期部分
	 * @param date
	 * @return
	 */
	public static String formatDateForId(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat(datePattern_id);
		String strTime = "";
		
		if(date != null){
			strTime = sdf.format(date);
		}
		
		return strTime;
	}
	
	/**
	 * 计算两个日期的小时差，并以字符串形式返回
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static String diffDate(Date date1, Date date2){
		long diff = date2.getTime() - date1.getTime();
		DecimalFormat df = new DecimalFormat("0.00");
		String str = df.format(diff * 1.0 / (1000 * 3600));
		return str;
	}
	
	/**
	 * 将形式为yyyy-MM-dd HH:mm:ss的字符串转换为时间类型
	 * @param strDate
	 * @return
	 */
	public static Date parseDateTimeSec(String strDate){
		Date date = null;
		if(StringUtils.isBlank(strDate)){
			return null;
		}
		
		try{
			SimpleDateFormat sdf = new SimpleDateFormat(timeSecPattern);
			date = sdf.parse(strDate);
		}catch (Exception e) {
			log.error("字符串转日期出错", e);
		}
		
		return date;
	}
}
