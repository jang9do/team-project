package com.tj.walb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tj.walb.model.Fboard;
import com.tj.walb.model.FileUploadVO;

public interface FboardService {
	public List<Fboard> fBoardList(Fboard fBoard);
	public int fBoardTotal(int cNum);
	public Fboard fBoardDetail(int fNum);
	public int fBoardInsert(Fboard fBoard);
	public int fBoardUpdate(Fboard fBoard);
	public int fBoardDelete(int fNum);
	public int fBoardAstep(Fboard fBoard);
	public int fBoardReply(Fboard fBoard);
	public FileUploadVO fileUpload(FileUploadVO fileUploadVO, HttpServletRequest request);
}
