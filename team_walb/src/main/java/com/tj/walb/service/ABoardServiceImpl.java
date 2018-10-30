package com.tj.walb.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tj.walb.dao.ABoardDao;
import com.tj.walb.model.ABoard;
import com.tj.walb.model.AReply;
import com.tj.walb.model.FileUploadVO;

//　後期掲示板にかんするService
@Service
public class ABoardServiceImpl implements ABoardService {
	private String savePath = "D:/mege_T/team_walb/src/main/webapp/aBoardImg/";
	
	@Autowired
	ABoardDao aBoardDao;

	@Override
	public List<ABoard> aBoardList(int startRow, int endRow) {
		return aBoardDao.aBoardList(startRow, endRow);
	}

	@Override
	public ABoard aBoardView(int aNum) {
		return aBoardDao.aBoardView(aNum);
	}

	@Override
	public int aBoardModify(ABoard aBoard, ABoard modifyBoard) {
		aBoard.setaTitle(modifyBoard.getaTitle());
		aBoard.setaContent(modifyBoard.getaContent());
		aBoard.setbDate(modifyBoard.getbDate());
		
		return aBoardDao.aBoardModify(aBoard);
	}

	@Override
	public int aBoardDelete(int aNum) {
		return aBoardDao.aBoardDelete(aNum);
	}

	@Override
	public int aBoardInsert(ABoard aBoard) {
		return aBoardDao.aBoardInsert(aBoard);
	}

	@Override
	public int totCnt() {
		return aBoardDao.totCnt();
	}

	@Override
	public int aReplyInsert(AReply aReply) {
		return aBoardDao.aReplyInsert(aReply);
	}

	@Override
	public List<AReply> aReplyList(int aNum) {
		return aBoardDao.aReplyList(aNum);
	}

	@Override
	public double aReplyAvg(int aNum) {
		return aBoardDao.aReplyAvg(aNum);
	}

	@Override
	public int aScoreChange(int aNum, double aScore) {
		ABoard aBoard = new ABoard();
		aBoard.setaNum(aNum);
		aBoard.setaScore(aScore);
		
		return aBoardDao.aScoreChange(aBoard);
	}

	@Override
	public List<ABoard> aBoardTop3() {
		return aBoardDao.ABoardTop3();
	}
	
	@Override
	public FileUploadVO fileUpload(FileUploadVO fileUploadVO, HttpServletRequest request) {
		 String rootPath = request.getRealPath("/");
	     String attachPath = "aBoardImg/";
	 
	     MultipartFile upload = fileUploadVO.getUpload();
	     String filename = "";
	         
	     if(upload != null){
	    	filename = System.currentTimeMillis() + upload.getOriginalFilename();
	     	fileUploadVO.setFilename(filename);
	     	try{
	     		File file = new File(rootPath + attachPath + filename);
	     		upload.transferTo(file);
	     	}catch(IOException e){
	     		e.printStackTrace();
	     	}  
	     	
	     	fileUploadVO.setAttachPath(attachPath);
	     	fileUploadVO.setFilename(filename);
	     }
	     
	     int result = copy(rootPath + attachPath + filename, savePath+filename);
	     if(result==1) {
	    	 System.out.println(filename+" 파일 백업 성공");
	     }
	    
	     return fileUploadVO;
	}
	
	private int copy(String originalFile, String targetFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os =null;
		try{
			is = new FileInputStream(originalFile);
			os = new FileOutputStream(targetFile);
			byte[] buff = new byte[1024*1024];
			int nRead;
			while((nRead = is.read(buff))!=-1){
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		}catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try{
				if(is!=null) is.close();
				if(os!=null) os.close();
			}catch(IOException e){
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
}
