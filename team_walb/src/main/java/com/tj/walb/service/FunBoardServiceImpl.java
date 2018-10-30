package com.tj.walb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.walb.dao.FunBoardDao;
import com.tj.walb.model.FunBoard;

@Service
public class FunBoardServiceImpl implements FunBoardService {
	@Autowired
	private FunBoardDao funBoardDao;
	
	@Override
	public List<FunBoard> funBoardList(FunBoard funBoard) {
		return funBoardDao.funBoardList(funBoard);
	}

	@Override
	public int funBoardTotal() {
		return funBoardDao.funBoardTotal();
	}

	@Override
	public FunBoard funBoardDetail(int funNum) {
		return funBoardDao.funBoardDetail(funNum);
	}

	@Override
	public int funding(FunBoard funBoard) {
		return funBoardDao.funding(funBoard);
	}

	@Override
	public int funBoardInsert(FunBoard funBoard) {
		return funBoardDao.funBoardInsert(funBoard);
	}
	
	@Override
	public int funBoardDelete(int funNum) {
		return funBoardDao.funBoardDelete(funNum);
	}

	@Override
	public int FunBoardResult() {
		return funBoardDao.FunBoardResult();
	}

	@Override
	public int funBoardModify(FunBoard funBoard) {
		return funBoardDao.funBoardModify(funBoard);
	}

}
