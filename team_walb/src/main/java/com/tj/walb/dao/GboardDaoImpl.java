package com.tj.walb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.Gboard;

//　公知に関するDAO
@Repository
public class GboardDaoImpl implements GboardDao{
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List<Gboard> gboardList(int startRow, int endRow) {
		Gboard gboard = new Gboard();
		gboard.setStartRow(startRow);
		gboard.setEndRow(endRow);
		return sessionTemplate.selectList("gBoardList", gboard);
	}

	@Override
	public int gboardInsert(Gboard gboard) {
		return sessionTemplate.insert("gBoardInsert", gboard);
	}

	@Override
	public int gboardModify(Gboard gboard) {
		return sessionTemplate.update("gBoardModify", gboard);
	}

	@Override
	public int gboardDelete(int gNum) {
		return sessionTemplate.delete("gBoardDelete", gNum);
	}

	@Override
	public int totCnt() {
		return sessionTemplate.selectOne("gBoardTotCnt");
	}

	@Override
	public Gboard gboardView(int gNum) {
		return sessionTemplate.selectOne("gBoardView", gNum);
	}
	

}
