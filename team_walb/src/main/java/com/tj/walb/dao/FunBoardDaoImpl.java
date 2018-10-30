package com.tj.walb.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.FunBoard;
@Repository
public class FunBoardDaoImpl implements FunBoardDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<FunBoard> funBoardList(FunBoard funBoard) {
		return sessionTemplate.selectList("FunBoardList", funBoard);
	}

	@Override
	public int funBoardTotal() {
		return sessionTemplate.selectOne("FunBoardTotal");
	}

	@Override
	public FunBoard funBoardDetail(int funNum) {
		return sessionTemplate.selectOne("FunBoardDetail", funNum);
	}

	@Override
	public int funding(FunBoard funBoard) {
		return sessionTemplate.update("Funding", funBoard);
	}

	@Override
	public int fundingResult(FunBoard funBoard) {
		return sessionTemplate.update("FundingResult", funBoard);
	}
	
	@Override
	public int funBoardInsert(FunBoard funBoard) {
		return sessionTemplate.insert("FunBoardInsert", funBoard);
	}

	@Override
	public int funBoardDelete(int funNum) {
		return sessionTemplate.delete("FunBoardDelete", funNum);
	}

	@Override
	public int FunBoardResult() {
		return sessionTemplate.delete("FunBoardResult");
	}

	@Override
	public int funBoardModify(FunBoard funBoard) {
		return sessionTemplate.update("FunBoardModify", funBoard);
	}

}
