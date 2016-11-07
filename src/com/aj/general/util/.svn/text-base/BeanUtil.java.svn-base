package com.aj.general.util;

import java.lang.reflect.Field;

public class BeanUtil {
	public static Object getFieldValue(Object obj, String fieldName) {
		Object val = null;

		try {
			Field field = obj.getClass().getDeclaredField(fieldName);
			field.setAccessible(true);
			val = field.get(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return val;
	}
}
