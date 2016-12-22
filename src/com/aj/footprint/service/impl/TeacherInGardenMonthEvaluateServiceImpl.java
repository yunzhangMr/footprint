package com.aj.footprint.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.aj.footprint.model.po.TBaby;
import com.aj.footprint.model.po.TClass;
import com.aj.footprint.model.po.TCommentTM;
import com.aj.footprint.model.po.TUser;
import com.aj.footprint.model.vo.Pagination;
import com.aj.footprint.service.TeacherInGardenMonthEvaluateServiceI;
import com.aj.general.dao.BaseDaoI;

@Service("teacherInGardenMonthEvaluateService")
public class TeacherInGardenMonthEvaluateServiceImpl implements TeacherInGardenMonthEvaluateServiceI{

	@Autowired
	private BaseDaoI<TUser> tUserDao;
	@Autowired
	private BaseDaoI<TBaby> tBabyDao;
	@Autowired
	private BaseDaoI<TCommentTM> tCommentTMDao;
	@Autowired
	private BaseDaoI<TClass> tClassDao;
	/**
	 * 根据登陆教师id获得教师负责班级
	 */
	public int getClassid(String loginid){
		
		String sql = " select class_id as classid from f_user where id="+loginid;	
		Map<String,Object> map = tUserDao.findVoBySql(sql);
		
		return  (Integer) map.get("classid");
	}
	
    public Pagination queryPageTBaby(Integer limit,Integer offset,Map<String,Object> params){
		
		int nurseryid = Integer.parseInt(params.get("nurseryid").toString());
		String name = (String) params.get("name");
		String grade = (String)params.get("grade");
		String term = (String)params.get("term");
		String year = (String)params.get("year");
		String cname = (String)params.get("cname");
		String birth = (String)params.get("birth"); 
		String createmonth = (String)params.get("createmonth"); 
		String loginid = (String)params.get("loginid"); 
		int classid = this.getClassid(loginid);
		
		String sql = " SELECT t.id,t.bname,t.birth,m.id as mid,m.behavior,m.suggestion,t.gender,m.createmonth,t.classid,t.grade,"
				+ "t.term,t.createyear,m.createdate,m.teacher_id as teacherid,m.teacher_name as teachername "
				+ "FROM  (SELECT b.id,b.bname,b.gender,DATE_FORMAT(b.birth,'%Y-%m-%d') as birth,bc.class_id as classid,c.cname,c.createyear,c.term,c.grade,bc.status "
				+ "from f_baby b LEFT JOIN  f_baby_class bc  ON b.id = bc.baby_id  "
				+ "LEFT JOIN f_class c ON c.id = bc.class_id where b.nursery_id="+nurseryid+" ) t LEFT JOIN f_comment_t_m m ON t.id = m.baby_id ";
		if(StringUtils.hasText(createmonth)){
			sql += " AND createmonth="+createmonth;
		}
		sql += "  WHERE  t.status='N' AND t.classid="+classid;
		
		if(StringUtils.hasText(name)){
			sql += " AND t.bname like '%"+name+"%'";
		}
        if(StringUtils.hasText(year)){
			sql += " and t.createyear="+year;
		}
		if(StringUtils.hasText(grade)){
			sql += " and t.grade='"+grade+"'";
		}
		if(StringUtils.hasText(term)){
			sql += " and t.term='"+term+"'";
		}
		if(StringUtils.hasText(cname)){
			sql += " and t.cname='"+cname+"'";
		}
		if(StringUtils.hasText(birth)){
			sql += " and t.birth like '%"+birth+"%' ";
		}				
		
		sql += " order by t.id ";

		return tBabyDao.queryPage(sql,limit,offset);	
		
	}

    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED, isolation = Isolation.REPEATABLE_READ)
    public String dosaveCommentTM(TCommentTM tCommentTM){
    	
    	tCommentTMDao.saveOrUpdate(tCommentTM);
    	
    	return "success";
    }
    
    //获得班级名称
    public String getCname(String loginid){
    	
    	int classid = this.getClassid(loginid);
    	String sql = " select cname from f_class where id=? ";
    	Map<String,Object> map= tClassDao.findVo(sql, new Object[]{classid});
    	
    	return (String)map.get("cname");
    	
    }
}
