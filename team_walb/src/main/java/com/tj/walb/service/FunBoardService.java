package com.tj.walb.service;

import java.util.List;

import com.tj.walb.model.FunBoard;

public interface FunBoardService {
	public List<FunBoard> funBoardList(FunBoard funBoard);
	public int funBoardTotal();
	public FunBoard funBoardDetail(int funNum);
	public int funding(FunBoard funBoard);
	public int funBoardInsert(FunBoard funBoard);
	public int funBoardDelete(int funNum);
	public int FunBoardResult();
	public int funBoardModify(FunBoard funBoard);
}
