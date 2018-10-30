package com.tj.walb.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tj.walb.dao.FboardDao;
import com.tj.walb.model.Fboard;
import com.tj.walb.model.FileUploadVO;
@Service
public class FboardServiceImpl implements FboardService {
	@Autowired
	private FboardDao fBoardDao;
	
	private String savePath = "D:/mege_T/team_walb/src/main/webapp/fBoardImg/";

	@Override
	public List<Fboard> fBoardList(Fboard fBoard) {
		return fBoardDao.fBoardList(fBoard);
	}

	@Override
	public int fBoardTotal(int cNum) {
		return fBoardDao.fBoardTotal(cNum);
	}

	@Override
	public Fboard fBoardDetail(int fNum) {
		return fBoardDao.fBoardDetail(fNum);
	}

	@Override
	public int fBoardInsert(Fboard fBoard) {
		return fBoardDao.fBoardInsert(fBoard);
	}

	@Override
	public int fBoardUpdate(Fboard fBoard) {
		return fBoardDao.fBoardUpdate(fBoard);
	}

	@Override
	public int fBoardDelete(int fNum) {
		return fBoardDao.fBoardDelete(fNum);
	}

	@Override
	public int fBoardAstep(Fboard fBoard) {
		return fBoardDao.fBoardAstep(fBoard);
	}

	@Override
	public int fBoardReply(Fboard fBoard) {
		return fBoardDao.fBoardReply(fBoard);
	}

	@Override
	public FileUploadVO fileUpload(FileUploadVO fileUploadVO, HttpServletRequest request) {
		 String rootPath = request.getRealPath("/");
	     String attachPath = "fBoardImg/";
	 
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
