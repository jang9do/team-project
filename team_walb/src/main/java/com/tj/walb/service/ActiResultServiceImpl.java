package com.tj.walb.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.walb.dao.ActiResultDao;
import com.tj.walb.model.ActiResult;

//　活動記録に関するService
@Service
public class ActiResultServiceImpl implements ActiResultService {
	@Autowired
	private ActiResultDao actiResultDao;

	@Override
	public int actiResultInsert(ActiResult actiResult) {
		return actiResultDao.actiResultInsert(actiResult);
	}

	@Override
	public List<ActiResult> actiResultList(int cName, Timestamp arDate) {
		// TODO Auto-generated method stub
		return null;
	}

}
