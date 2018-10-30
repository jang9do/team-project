package com.tj.walb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.walb.dao.ActivityDao;
import com.tj.walb.model.Activity;

//　活動予約に関するService
@Service
public class ActivityServiceImpl implements ActivityService {
	@Autowired
	private ActivityDao actiDao;
	
	@Override
	public int activityRequest(Activity activity) {
		return actiDao.actiRequest(activity);
	}

	@Override
	public List<Activity> activityList(int cNum) {
		return actiDao.actiList(cNum);
	}

	@Override
	public List<Activity> activityTimeList(Activity activity) {
		return actiDao.actiTimeList(activity);
	}

	@Override
	public int activityDelete(int actiNum) {
		return actiDao.actiDelete(actiNum);
	}

	@Override
	public int activityChk(int actiNum) {
		return actiDao.actiChk(actiNum);
	}

	@Override
	public List<Activity> adminActiList() {
		return actiDao.adminActiList();
	}

	@Override
	public Activity acticityView(int actiNum) {
		return actiDao.activityView(actiNum);
	}

}
