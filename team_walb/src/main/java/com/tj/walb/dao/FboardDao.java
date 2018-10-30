package com.tj.walb.dao;

import java.util.List;

import com.tj.walb.model.Fboard;

public interface FboardDao {
	public List<Fboard> fBoardList(Fboard fBoard);  // 글 리스트
	public int fBoardTotal(int cNum);       // 글 갯수
	public Fboard fBoardDetail(int fNum);   // 글 상세보기
	public int fBoardInsert(Fboard fBoard); // 글 작성
	public int fBoardUpdate(Fboard fBoard); // 글 수정
	public int fBoardDelete(int fNum);	  // 글 삭제
	public int fBoardAstep(Fboard fBoard);
	public int fBoardReply(Fboard fBoard);
}
