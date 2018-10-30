package com.tj.walb.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.walb.dao.CircleDao;
import com.tj.walb.model.Circle;

//　同好会に関するService
@Service
public class CircleServiceImpl implements CircleService {
	@Autowired
	private CircleDao cDao;
	
	private String savePath = "D:/mege_T/team_walb/src/main/webapp/circleImg/";
	
	@Override
	public int cirInsert(Circle circle) {
		return cDao.cirInsert(circle);
	}

	@Override
	public Circle circleView(int cNum) {
		return cDao.circleView(cNum);
	}

	@Override
	public int circleUpdate(MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("circleImg/");
		Iterator<String> iterator = mRequest.getFileNames();
		String bimg=null;
		if(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);//실제파일 받아오기
			String originFileName = mFile.getOriginalFilename();
			bimg=originFileName;//실제저장되는 파일 이름
			if(bimg!=null && !bimg.equals("")) {
				if(new File(uploadPath+bimg).exists() || new File(savePath+bimg).exists()) {
					bimg = System.currentTimeMillis()+"_"+bimg;
				}
				try {
					System.out.println("서버: "+uploadPath+bimg);
					System.out.println("저장: "+savePath+bimg);
					mFile.transferTo(new File(uploadPath+bimg));
					int result = copy(uploadPath+bimg, savePath+bimg);
					System.out.println(result==1? bimg+"이미지 넣음":bimg+"이미지 못 넣음");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		Circle circle = cDao.circleView(Integer.parseInt(mRequest.getParameter("cNum")));
		if(bimg!=null || !"".equals(bimg)) {
			circle.setcPhoto(bimg);
		}
		circle.setcContent(mRequest.getParameter("cContent"));
		circle.setcTime(mRequest.getParameter("cTime"));
		
		return cDao.circleUpdate(circle);
	}

	@Override
	public int circleDelete(int cNum) {
		return cDao.circleDelete(cNum);
	}

	@Override
	public List<Circle> circleList(int startRow, int endRow) {
		return cDao.circleList(startRow, endRow);
	}
	
	@Override
	public List<Circle> circleTop3(){
		return cDao.circleTop3();
	}

	@Override
	public int circleHit(int cNum) {
		return cDao.circleHit(cNum);
	}

	@Override
	public int totCnt() {
		return cDao.totCnt();
	}

	@Override
	public Circle circleTop() {
		return cDao.circleTop();
	}

	@Override
	public int searchTotCnt(Circle circle) {
		return cDao.searchTotCnt(circle);
	}

	@Override
	public List<Circle> circleSearch(Circle circle) {
		return cDao.circleSearch(circle);
	}

	@Override
	public int CircleLastNum() {
		return cDao.CircleLastNum();
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
