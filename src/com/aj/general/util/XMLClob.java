package com.aj.general.util;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.support.lob.LobHandler;
import com.aj.general.dao.GeneralDAO;
import com.aj.general.xml.*;

public class XMLClob {
	Logger log = Logger.getLogger(XMLClob.class);
	private int id = 0;
	public static LobHandler lobHandler;

	private GeneralDAO dao;

	public GeneralDAO getDao() {
		return dao;
	}

	public void setDao(GeneralDAO dao) {
		this.dao = dao;
	}

	public XMLClob() {
	}

	public String getXMLData(int id) {
		this.id = id;
		return getXMLDataByID();
	}

	public String getXMLDataByID() {
		String data = null;
		if (id == 0)
			return "";
		try {
			VOXmldata voXmldata = (VOXmldata) dao.getVoById(VOXmldata.class, id);
			data = new String(voXmldata.getXmldata());
		} catch (Exception ex) {
			log.error("get clob:", ex);
		}
		return data;
	}

	public int updateXMLData(String text, int idx) {
		if (StringUtils.isBlank(text) || idx <= 0) {
			return 0;
		}
		try {
			VOXmldata vo = dao.getVoById(VOXmldata.class, idx);
			vo.setXmldata(text.getBytes());
			dao.merge(vo);
		} catch (DataAccessException e) {
			log.error("更新XMLData失败", e);
			return 0;
		}
		return idx;
	}
	
	public String getXMLCLOBByID(Integer reqID) {
	    if(reqID==null||reqID.equals(""))
	          return null;
	    String xmlDataStr=null;
	    try {
			VOXmldata voXmldata = (VOXmldata) dao.getVoById(VOXmldata.class, reqID);
			xmlDataStr = new String(voXmldata.getXmldata());
		} catch (Exception ex) {
			log.error("get clob:", ex);
		}
	    return xmlDataStr;
	  }
}
