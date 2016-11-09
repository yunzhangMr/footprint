package com.aj.general.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 在普通的类中取得spring配置文件中定义的bean，一般是通过IOC来把bean注入进去，这样就不会直接依赖spring
 * 如果一定要通过getbean的方式来取得bean，使用这个通用的类，注：在spring配置文件中配置这个类
 * 
 * @author lixiang
 * 
 */
public class SpringUtil implements ApplicationContextAware {

	private static ApplicationContext appContext;

	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		SpringUtil.appContext = arg0;
	}

	public static Object getBean(String name) {
		return SpringUtil.appContext.getBean(name);
	}
}
