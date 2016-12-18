package com.aj.general.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class DecodeUtil {

	public static String decodeParameter(String arg){
		try {
			return URLDecoder.decode(arg,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
}
