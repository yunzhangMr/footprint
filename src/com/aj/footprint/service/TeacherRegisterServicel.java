package com.aj.footprint.service;

import com.aj.footprint.model.po.TBaby;

public interface TeacherRegisterServicel {

	public String getBNameSpell(String bnamespell);
	
	public String doSaveBaby(TBaby tbaby);
	
	public int checkSpell(String namespell);
}
