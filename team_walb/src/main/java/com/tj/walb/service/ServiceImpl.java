package com.tj.walb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.walb.dao.Dao;
import com.tj.walb.model.Phone;

@Service
public class ServiceImpl implements Services {
	@Autowired
	private Dao dao;
	
	public int insert(Phone phone) {
		return dao.insert(phone);
	}
}
