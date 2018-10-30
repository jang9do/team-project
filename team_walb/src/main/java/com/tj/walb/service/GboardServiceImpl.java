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

import com.tj.walb.dao.GboardDao;
import com.tj.walb.model.Gboard;

//　公知に関するService
@Service
public class GboardServiceImpl implements GboardService {
	@Autowired
	private GboardDao gdao;
	
	private String savePath = "D:/mege_T/team_walb/src/main/webapp/gboardFile/";
	
	@Override
	public List<Gboard> notice10() {
		return gdao.gboardList(1, 10);
	}

	@Override
	public List<Gboard> gboardList(int startRow, int endRow) {
		return gdao.gboardList(startRow, endRow);
	}

	@Override
	public int gboardInsert(MultipartHttpServletRequest mRequest) {
		String uploadPath = mRequest.getRealPath("aBoardImg/");
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
		
		Gboard gboard = new Gboard();
		gboard.setmId(mRequest.getParameter("mId"));
		gboard.setgTitle(mRequest.getParameter("gTitle"));
		gboard.setgContent(mRequest.getParameter("gContent"));
		gboard.setgIp(mRequest.getRemoteAddr());
		if(bimg!=null && !bimg.equals("")) {
			gboard.setgFile(bimg);
		}
		return gdao.gboardInsert(gboard);
	}

	@Override
	public int gboardModify(MultipartHttpServletRequest mRequest, Gboard gboard) {
		String uploadPath = mRequest.getRealPath("aBoardImg/");
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
		
		gboard.setgTitle(mRequest.getParameter("gTitle"));
		gboard.setgContent(mRequest.getParameter("gContent"));
		if(bimg!=null && !bimg.equals("")) {
			gboard.setgFile(bimg);
		}
		System.out.println(gboard);
		return gdao.gboardModify(gboard);
	}

	@Override
	public int gboardDelete(int gNum) {
		return gdao.gboardDelete(gNum);
	}

	@Override
	public int totCnt() {
		return gdao.totCnt();
	}

	@Override
	public Gboard gboardView(int gNum) {
		return gdao.gboardView(gNum);
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
