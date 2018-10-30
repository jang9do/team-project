package com.tj.walb.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.tj.walb.dao.BboardDao;
import com.tj.walb.model.Bboard;
import com.tj.walb.model.BboardBunApply;
import com.tj.walb.model.BboardCircle;
import com.tj.walb.model.BunApply;
import com.tj.walb.model.FileUploadVO;

@Service
public class BboardServiceImpl implements BboardService {
	
	private String savePath = "D:/mege_T/team_walb/src/main/webapp/bboardImg/";
	
	@Autowired
	private BboardDao bdao;
	// private String savePath ="E:/team_walb/team_walb/src/main/webapp/bboard/img/";

	// 마감 완료 번개모임 비활성화	
	@Override
	public void disActi() {
		bdao.disActi();
	}
	
	
	@Override
	public List<BboardCircle> bungae3() {
		return bdao.bungae3();
	}
// 번개 모임 생성
	@Override
	public int insertBboard(Bboard bboard) {
		return bdao.insertBboard(bboard);
	}

	@Override
	public int modifyBboard(Model model, Bboard bboard) {
		// TODO Auto-generated method stub
		return 0;
	}
// 번개 상세보기
	@Override
	public BboardCircle viewBboard(int bNum) {
		return bdao.viewBboard(bNum);
	}
// 번개 참여 신청
	@Override
	public int bunapplyChk(BunApply bunapply) {
		return bdao.bunapplyChk(bunapply);
	}
	@Override
	public int participateBboard(int bNum) {
		return bdao.participateBboard(bNum);
	}
	@Override
	public int addBunapply(BunApply bunapply) {
		return bdao.addBunapply(bunapply);
	}
// 번개 참여 취소
	@Override
	public int cancleBunapply(BunApply bunapply) {
		return bdao.cancleBunapply(bunapply);
	}
	@Override
	public int minusBboard(int bNum) {
		return bdao.minusBboard(bNum);
	}

	@Override
	public List<BboardCircle> bboardListAll(BboardCircle bCircle) {
		return bdao.bboardListAll(bCircle);
	}

	@Override
	public List<BboardCircle> bboardListPopular(BboardCircle bCircle) {
		return bdao.bboardListPopular(bCircle);
	}

	@Override
	public List<BboardCircle> bboardListIng(BboardCircle bCircle) {
		return bdao.bboardListIng(bCircle);
	}
	
	//나의 번개목록
	@Override
	public List<BboardBunApply> myBunListAll(BboardBunApply bboardBun) {
		return bdao.myBunListAll(bboardBun);
	}
	@Override
	public int totCntmyBunListAll(String mId) {
		return bdao.totCntmyBunListAll(mId);
	}

	// 번개글 갯수
	@Override
	public int totCntBboardAll() {
		return bdao.totCntBboardAll();
	}
	@Override
	public int totCntBboardIng() {
		return bdao.totCntBboardIng();
	}
	@Override
	public int getBnumAfterInsert(int cNum) {
		return bdao.getBnumAfterInsert(cNum);
	}

	@Override
	public FileUploadVO fileUpload(FileUploadVO fileUploadVO, HttpServletRequest request) {
		String rootPath = request.getRealPath("/");
		String attachPath = "bboardImg/";
	     MultipartFile upload = fileUploadVO.getUpload();
//	     System.out.println(fileUploadVO.getAttachPath()+"\n"+fileUploadVO.getFilename());
	     String filename = "";
	     System.out.println(4);
	     if(upload != null){
	    	 System.out.println(5);
	    	filename = System.currentTimeMillis() + upload.getOriginalFilename();
	    	System.out.println(6);
	    	fileUploadVO.setFilename(filename);
	     	try{
	     		System.out.println("전:"+rootPath + attachPath + filename);
	     		File file = new File(rootPath + attachPath + filename);
	     		System.out.println("후"+rootPath + attachPath + filename);
	     		upload.transferTo(file);
	     		System.out.println("다 올렸다.");
	     	}catch(IOException e){
	     		System.out.println("error:"+e.getMessage());
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
