package com.aj.general.util;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
  
public class ExcelUtil {
	
	/**
	 * createExcel
	 * @param path
	 * @return feilName
	 */
	public static String createExcel(String path) {
		
		File file = new File(path);
		if(!file.exists()&&!file.isDirectory()){
			file.mkdirs();
		}
		String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())+".xls";
		fileName = path +"\\" + fileName;
		file = new File(fileName);
		try {
			if (!file.exists()) {
				file.createNewFile();
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
}
