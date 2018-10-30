package com.tj.walb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.ABoard;
import com.tj.walb.model.AReply;

//　後期掲示板にかんするDAO
@Repository
public class ABoardDaoImpl implements ABoardDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List<ABoard> aBoardList(int startRow, int endRow) {
		ABoard aBoard = new ABoard();
		aBoard.setStartRow(startRow);
		aBoard.setEndRow(endRow);
		return sessionTemplate.selectList("ABoardList", aBoard);
	}

	@Override
	public ABoard aBoardView(int aNum) {
		return sessionTemplate.selectOne("ABoardView", aNum);
	}

	@Override
	public int aBoardModify(ABoard aBoard) {
		return sessionTemplate.update("ABoardModify" , aBoard);
	}

	@Override
	public int aBoardDelete(int aNum) {
		return sessionTemplate.delete("ABoardDelete", aNum);
	}

	@Override
	public int aBoardInsert(ABoard aBoard) {
		return sessionTemplate.insert("ABoardInsert", aBoard);
	}

	@Override
	public int totCnt() {
		return sessionTemplate.selectOne("ABoardtotCnt");
	}

	@Override
	public int aReplyInsert(AReply aReply) {
		return sessionTemplate.insert("AReplyInsert", aReply);
	}

	@Override
	public List<AReply> aReplyList(int aNum) {
		return sessionTemplate.selectList("AReplyList", aNum);
	}

	@Override
	public double aReplyAvg(int aNum) {
		double result = 0.0;
		if(sessionTemplate.selectOne("AReplyAvg", aNum)!=null) {
			result=sessionTemplate.selectOne("AReplyAvg", aNum);
		}
		return result;
	}

	@Override
	public int aScoreChange(ABoard aBoard) {
		return sessionTemplate.update("ScoreChage", aBoard);
	}

	@Override
	public List<ABoard> ABoardTop3() {
		return sessionTemplate.selectList("ABoardTop3");
	}

}
