package com.aj.footprint.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.footprint.model.po.TSequenceAuto;
import com.aj.footprint.service.SequenceAutoI;
import com.aj.general.dao.BaseDaoI;

@Service("sequenceAutoService")
public class SequenceAutoImpl implements SequenceAutoI {

	@Autowired
	private BaseDaoI<TSequenceAuto> sequenceAutoDao;
	
	public Integer getAutoSequence() {
		TSequenceAuto p = new TSequenceAuto();
		p.setName("sequence");
		return (Integer)sequenceAutoDao.save(p);
	}

}
