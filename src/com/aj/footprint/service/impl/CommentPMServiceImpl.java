package com.aj.footprint.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.footprint.model.po.TCommentPM;
import com.aj.footprint.model.po.TCommentTM;
import com.aj.footprint.model.po.TCommentTT;
import com.aj.footprint.model.po.TItemScore;
import com.aj.footprint.model.vo.CommentPM;
import com.aj.footprint.service.CommentPMServiceI;
import com.aj.footprint.service.CommentTMServiceI;
import com.aj.footprint.service.CommentTTServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("commentPMService")
public class CommentPMServiceImpl implements CommentPMServiceI {
	
	@Autowired
	private BaseDaoI<TCommentPM> commentPMDao;

	public void saveOrUpdate(TCommentPM o) {
		commentPMDao.saveOrUpdate(o);
	}

	
	

}
