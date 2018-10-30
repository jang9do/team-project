package com.tj.walb.dao;

import java.util.List;
import com.tj.walb.model.FunBoard;

public interface FunBoardDao {
	public List<FunBoard> funBoardList(FunBoard funBoard);
	public int funBoardTotal();
	public FunBoard funBoardDetail(int funNum);
	public int funding(FunBoard funBoard);
	public int fundingResult(FunBoard funBoard);
	public int funBoardInsert(FunBoard funBoard);
	public int funBoardDelete(int funNum);
	public int FunBoardResult();
	public int funBoardModify(FunBoard funBoard);
}
