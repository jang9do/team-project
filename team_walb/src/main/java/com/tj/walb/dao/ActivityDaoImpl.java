package com.tj.walb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.Activity;

//　活動予約に関するDAO
@Repository
public class ActivityDaoImpl implements ActivityDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public int actiRequest(Activity activity) {
		return sessionTemplate.insert("ActivityRequest", activity);
	}

	@Override
	public int actiDelete(int actiNum) {
		return sessionTemplate.delete("ActivityDelete", actiNum);
	}

	@Override
	public int actiChk(int actiNum) {
		return sessionTemplate.update("ActivityChk", actiNum);
	}

	@Override
	public List<Activity> actiList(int cNum) {
		return sessionTemplate.selectList("ActivityList", cNum);
	}

	@Override
	public List<Activity> actiTimeList(Activity activity) {
		return sessionTemplate.selectList("ActivityTimeList", activity);
	}

	@Override
	public List<Activity> adminActiList() {
		return sessionTemplate.selectList("AdminActivityList");
	}

	@Override
	public Activity activityView(int actiNum) {
		return sessionTemplate.selectOne("ActivityView", actiNum);
	}

}
