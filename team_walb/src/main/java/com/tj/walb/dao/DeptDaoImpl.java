package com.tj.walb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.Dept;
@Repository
public class DeptDaoImpl implements DeptDao{
	 @Autowired
	    private SqlSessionTemplate sessionTemplate;
		@Override
		public List<Dept> deptList() {
			return sessionTemplate.selectList("deptList");
		}

}
