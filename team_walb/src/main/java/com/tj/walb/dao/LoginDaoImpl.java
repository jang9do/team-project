package com.tj.walb.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.Member;

@Repository
public class LoginDaoImpl implements LoginDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Override
	public Member login(Member member) {
		return sessionTemplate.selectOne("login", member);
	}

}
