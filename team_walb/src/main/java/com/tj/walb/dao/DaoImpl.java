package com.tj.walb.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.walb.model.Phone;

@Service
public class DaoImpl implements Dao {
	@Autowired
    private SqlSessionTemplate sessionTemplate;

	@Override
	public int insert(Phone phone) {
		return sessionTemplate.insert("Insert", phone);
	}
	
}
