package com.aj.footprint.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.aj.footprint.model.po.TBaby;
import com.aj.footprint.model.po.TUser;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.service.TeacherChangeBabyInfoServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("teacherChangeBabyInfoService")
public class TeacherChangeBabyInfoServiceImpl implements TeacherChangeBabyInfoServiceI{

	@Autowired
	private BaseDaoI<TBaby> tBabyDao;
	@Autowired
	private BaseDaoI<TUser> tUserDao;
	
public int getClassid(String loginid){
		
		String sql = " select class_id as classid from f_user where id="+loginid;	
		Map<String,Object> map = tUserDao.findVoBySql(sql);
		
		return  (Integer) map.get("classid");
	}

	public Pagination queryPageTBaby(Integer limit,Integer offset,Map<String,Object> params){
		
		int nurseryid = Integer.parseInt(params.get("nurseryid").toString());
		String bname = params.get("bname").equals("")?"":params.get("bname").toString();
		String parentname = params.get("parentname").equals("")?"":params.get("parentname").toString();
		String loginid = params.get("loginid").equals("")?"":params.get("loginid").toString();
		int classid = this.getClassid(loginid);
		
		String sql = " SELECT b.id,b.bname,b.gender,DATE_FORMAT(b.birth,'%Y-%m-%d')as birth,b.parent_name as parentname,"
				+ "b.telephone,b.animalsign,b.nickname,b.nurture,b.parent_id as parentid "
				+ "from f_baby b  LEFT JOIN f_baby_class bc ON b.id=bc.baby_id "
				+ "WHERE b.status='Y'  AND bc.status='N' AND b.nursery_id="+nurseryid+" AND bc.class_id= "+classid;
		
		if(StringUtils.hasText(bname)){
			sql += " and b.bname like '%"+bname+"%'";
		}
        if(StringUtils.hasText(parentname)){
			sql += " and b.parent_name like '%"+parentname+"%'";
		}	
		
		
		sql += " order by b.id ";

		return tBabyDao.queryPage(sql,limit,offset);	
		
	}
	
	/**
	 * 保存修改
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
    public String dosave(TBaby tbaby,TUser tuser){
    	
    	tBabyDao.updateBySql(" update f_baby set  bname=?,birth=?,telephone=?,parent_name=?,animalsign=?,nickname=?,nurture=? where id=? "
    			, new Object[]{tbaby.getBname(),tbaby.getBirth(),tbaby.getPhone(),tbaby.getParent_name(),tbaby.getAnimalsign(),tbaby.getNickname(),tbaby.getNurture(),tbaby.getId()});
    	
    	tBabyDao.updateBySql(" update f_user set username=? where id=? and status='Y' ",new Object[]{tuser.getUsername(),tuser.getLoginid()});
    	
    	return "success";
    }
}
