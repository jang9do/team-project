package com.tj.walb.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.walb.dao.DeptDao;
import com.tj.walb.dao.MemberDao;
import com.tj.walb.model.CircleMember;
import com.tj.walb.model.Dept;
import com.tj.walb.model.Member;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private DeptDao deptDao;
	private String savePath = "D:/mega_T/source/team_walb/src/main/webapp/MemberImgFileUpload/";
	
	@Override
	public Member getMember(String mId) {
		return memberDao.getMember(mId);
	}
	@Override
	public int idConfirm(String mId) {
		return memberDao.idConfirm(mId);
	}
	
	@Override
	public int joinMember(MultipartHttpServletRequest mRequest) {	// file 저장
		String uploadPath = mRequest.getRealPath("MemberImgFileUpload/");
		Iterator<String> iterator = mRequest.getFileNames();
		String mPhoto= "";
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);
			String originFileName = mFile.getOriginalFilename();
			mPhoto = originFileName;
			if(mPhoto!=null && !mPhoto.equals("")) {
				if(new File(uploadPath+mPhoto).exists() || new File(savePath+mPhoto).exists()) {
					mPhoto = System.currentTimeMillis()+"_"+mPhoto;
				}
				try {
					System.out.println("서버 패스: "+uploadPath+mPhoto);
					System.out.println("백업 패스: "+savePath+mPhoto);
					mFile.transferTo(new File(uploadPath+mPhoto));
					int result = copy(uploadPath+mPhoto, savePath+mPhoto);
					System.out.println(result==1? mPhoto+"이미지 넣음":mPhoto+"이미지 못 넣음");
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				mPhoto = "no-image.jpg";
			}
		}
		Member member = new Member();
		member.setmId(mRequest.getParameter("mId"));
		member.setmPw(mRequest.getParameter("mPw"));
		member.setmName(mRequest.getParameter("mName"));
		member.setmBirth(Date.valueOf(mRequest.getParameter("mBirth")));
		member.setmPhoto(mPhoto);
		member.setDeptNo(Integer.parseInt(mRequest.getParameter("deptNo")));
		member.setmHire(Date.valueOf(mRequest.getParameter("mHire")));
		return memberDao.joinMember(member);
	}
	
	
	@Override
	public int modifyMember(MultipartHttpServletRequest mRequest) {//파일 변경
		System.out.println("서비스 들어왓다");
		
		String uploadPath = mRequest.getRealPath("MemberImgFileUpload/");
		Iterator<String> iterator = mRequest.getFileNames();
		String mPhoto = "";
		int idx = 0;
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);//실제파일 받아오기
			String originFileName = mFile.getOriginalFilename();
			mPhoto = originFileName;//실제저장되는 파일 이름
			if(mPhoto!=null && !mPhoto.equals("")) {
				if(new File(uploadPath+mPhoto).exists() || new File(savePath+mPhoto).exists()) {
					mPhoto = System.currentTimeMillis()+"_"+mPhoto;
				}
				try {
					mFile.transferTo(new File(uploadPath+mPhoto));
					int result = copy(uploadPath+mPhoto, savePath+mPhoto);
					System.out.println(result==1? mPhoto+"이미지 넣음":mPhoto+"이미지 넣음");
				} catch (IllegalStateException e) {
					System.out.println(e.getMessage());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				mPhoto = mRequest.getParameter("dbmPhoto");
			}
			idx++;
		}//while
		Member member = new Member();
		member.setmId(mRequest.getParameter("mId"));
		String mPw = mRequest.getParameter("mPw");
		if(mPw.equals("") || mPw==null) {
			mPw=mRequest.getParameter("dbmPw");
		}
		
		member.setmPw(mPw);
		member.setmName(mRequest.getParameter("mName"));
		member.setmBirth(Date.valueOf(mRequest.getParameter("mBirth")));
		member.setmPhoto(mPhoto);
		member.setDeptNo(Integer.parseInt(mRequest.getParameter("deptNo")));
		member.setmHire(Date.valueOf(mRequest.getParameter("mHire")));
		System.out.println("서비스에 받은 값들 : "+member);
		return memberDao.modifyMember(member);
	}
	
	private int copy(String originalFile, String targetFile) {//카피
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
	@Override
	public List<Dept> deptList() {
		System.out.println("서비스 들어옴");
		System.out.println("서비스 다녀옴 "+deptDao.deptList());
		return deptDao.deptList();
	}
	@Override
	public int secession( Member member, String mPw) {
		if(member.getmPw().equals(mPw)) {
			return memberDao.secession(member);
		}else {
			return 0;
		}
	}
	@Override
	public List<Member> MemberList(Member member) {
		return memberDao.memberList(member);
	}
	@Override
	public int total(Member member) {
		return memberDao.total(member);
	}	
	
	@Override
	public void insert50() {
		Member member = new Member();
		for(int i=10 ; i<500 ; i++) {
			member.setmId("a"+i);
			member.setmPw("a"+i);
			member.setmName("홍"+i);
			member.setmBirth(new Date(2018,7,23));
			member.setmPhoto("no-image.jpg");
			member.setDeptNo(10);
			member.setmHire(new Date(2018,7,30));
			int result = memberDao.joinMember(member);
			System.out.println(result==1? i+"번째 추가 성공":"");
		}
		
	}
	
	@Override
	public int circleJoin(Member member) {
		return memberDao.circleJoin(member);
	}
	@Override
	public int circleOut(Member member) {
		return memberDao.circleOut(member);
	}
	@Override
	public CircleMember mIdCircleList(String mId) {
		return memberDao.mIdCircleList(mId);
	}
	@Override
	public List<Member> circleMemberList(int cNum) {
		return memberDao.circleMemberList(cNum);
	}
	
}
