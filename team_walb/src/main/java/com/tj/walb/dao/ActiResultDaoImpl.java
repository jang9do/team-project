package com.tj.walb.dao;

import java.sql.Timestamp;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.ActiResult;

//　活動記録に関するDAO
@Repository
public class ActiResultDaoImpl implements ActiResultDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public int actiResultInsert(ActiResult actiResult) {
		return sessionTemplate.insert("ActiResultInsert", actiResult);
	}

	@Override
	public List<ActiResult> actiResultList(int cName, Timestamp arDate) {
		// TODO Auto-generated method stub
		return null;
	}

}
