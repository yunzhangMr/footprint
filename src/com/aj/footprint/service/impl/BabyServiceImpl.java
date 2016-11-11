package com.aj.footprint.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aj.general.dao.BaseDaoI;
import com.aj.footprint.model.po.TBaby;
import com.aj.footprint.model.vo.DataGrid;
import com.aj.footprint.model.vo.Baby;
import com.aj.footprint.service.BabyServiceI;


@Service("BabyService")
public class BabyServiceImpl implements BabyServiceI {

	private BaseDaoI<TBaby> babyDao;
	
	public BaseDaoI<TBaby> getTBabyDao() {
		return babyDao;
	}

	@Autowired
	public void setTBaby(BaseDaoI<TBaby> babyDao) {
		this.babyDao = babyDao;
	}

	public void save(Baby baby) {	
		TBaby u = new TBaby();
		BeanUtils.copyProperties(baby, u);
		if (baby.getCreatedate() == null) {
			u.setCreatedate(new Date());
		}			
		babyDao.save(u);
	}

	public void update(Baby baby) {	
		TBaby u = babyDao.get(TBaby.class, baby.getBabyid());
		BeanUtils.copyProperties(baby, u);
		babyDao.update(u);
	}

	public DataGrid datagrid(Baby Baby) {
		DataGrid j = new DataGrid();
		j.setRows(this.changeModel(this.find(Baby)));
		j.setTotal(this.total(Baby));
		return j;
	}
	
	private List<Baby> changeModel(List<TBaby> TBabys) {
		List<Baby> Babys = new ArrayList<Baby>();
		if (TBabys != null && TBabys.size() > 0) {
			for (TBaby tu : TBabys) {
				Baby u = new Baby();
				BeanUtils.copyProperties(tu, u);
				Babys.add(u);
			}
		}
		return Babys;
	}
	
	private List<TBaby> find(Baby baby) {
		String hql = "from TBaby t where 1=1 ";

		List<Object> values = new ArrayList<Object>();
		hql = addWhere(baby, hql, values);

		if (baby.getSort() != null && baby.getOrder() != null) {
			hql += " order by " + baby.getSort() + " " + baby.getOrder();
		}
		return babyDao.find(hql, values, baby.getPage(), baby.getRows());
	}
	
	private Long total(Baby baby) {
		String hql = "select count(*) from TBaby t where 1=1 ";
		List<Object> values = new ArrayList<Object>();
		hql = addWhere(baby, hql, values);
		return babyDao.count(hql, values);
	}

	private String addWhere(Baby baby, String hql, List<Object> values) {
		if (baby.getBabyid() != null && !baby.getBabyid().equals("")) {
			hql += " and t.cname like ? ";
			values.add("%%" + baby.getBabyname().trim() + "%%");
		}

		return hql;
	}

}
