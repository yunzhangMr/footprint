package com.aj.general.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;

public class Config {
	// 接口对方主机IP
	public static String serverIp;
	// 接口对方主机端口
	public static String serverPort;
	// 接口对方主机项目名
	public static String serverProject;
	// 接口开关      0:关闭；1:打开
	public static String interfaceSwitch;
	// 设备字典接口开关      0:使用自身的字典；1:使用设备系统传过来的字典
	public static String deviceDic_Switch;
	// 项目接口开关  
	public static String projectsSwitch;
	
	public static HashMap<String, String> words = new HashMap<String, String>();
	static {
		words.put("a", "a");
		words.put("b", "b");
		words.put("c", "c");
		words.put("d", "d");
		words.put("e", "e");
		words.put("f", "f");
		words.put("g", "g");
		words.put("h", "h");
		words.put("i", "i");
		words.put("j", "j");
		words.put("k", "k");
		words.put("l", "l");
		words.put("m", "m");
		words.put("n", "n");
		words.put("o", "o");
		words.put("p", "p");
		words.put("q", "q");
		words.put("r", "r");
		words.put("s", "s");
		words.put("t", "t");
		words.put("u", "u");
		words.put("v", "v");
		words.put("w", "w");
		words.put("x", "x");
		words.put("y", "y");
		words.put("z", "z");
		words.put("A", "A");
		words.put("B", "B");
		words.put("C", "C");
		words.put("D", "D");
		words.put("E", "E");
		words.put("F", "F");
		words.put("G", "G");
		words.put("H", "H");
		words.put("I", "I");
		words.put("J", "J");
		words.put("K", "K");
		words.put("L", "L");
		words.put("M", "M");
		words.put("N", "N");
		words.put("O", "O");
		words.put("P", "P");
		words.put("Q", "Q");
		words.put("R", "R");
		words.put("S", "S");
		words.put("T", "T");
		words.put("U", "U");
		words.put("V", "V");
		words.put("W", "W");
		words.put("X", "X");
		words.put("Y", "Y");
		words.put("Z", "Z");
		words.put("0", "0");
		words.put("1", "1");
		words.put("2", "2");
		words.put("3", "3");
		words.put("4", "4");
		words.put("5", "5");
		words.put("6", "6");
		words.put("7", "7");
		words.put("8", "8");
		words.put("9", "9");
		words.put(":", ":");
		words.put("/", "/");
		words.put("\\", "\\");
		words.put(".", ".");
		words.put("_", "_");
		words.put(";", ";");
	}
	
	static {
		Properties pro = new Properties();
		try {
			String path = Config.class.getClassLoader().getResource("").getPath().toString();//得到工程名WEB-INF/classes/路径
		    path=path.substring(1, path.indexOf("classes"));//从路径字符串中取出工程路径
		    pro.load(new FileInputStream(path+"config.properties"));
		    serverIp =  pro.getProperty("server_ip","127.0.0.1");
		    serverPort = pro.getProperty("server_port","8080");
		    serverProject = pro.getProperty("server_project","");
		    interfaceSwitch = pro.getProperty("interface_Switch","0");
		    deviceDic_Switch = pro.getProperty("deviceDic_Switch","0");
		    projectsSwitch = pro.getProperty("projects_Switch","");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String verify(String source) {
		String temp = "";
		for (int i = 0; i < source.length(); i++) {
			if (words.get(source.charAt(i)+"")!=null) {
				temp += words.get(source.charAt(i)+"");
			}
		}
		return temp;
	}

	public static String URL = "http://" + serverIp + ":" + serverPort + "/" + serverProject;
}
