package com.tj.walb.service;


import java.util.List;


import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.walb.model.CircleMember;
import com.tj.walb.model.Dept;
import com.tj.walb.model.Member;

public interface MemberService {
	public Member getMember(String mId);//
	public int idConfirm(String mId); //중복확인	
	public int modifyMember(MultipartHttpServletRequest mRequest);//정보수정(파일 포함)
	public int secession(Member member, String mPw);
	public int joinMember(MultipartHttpServletRequest mRequest);//회원가입(파일 포함)
    public List<Dept> deptList();
    public List<Member> MemberList(Member member);
    public int total(Member member);
    public void insert50();
    public int circleJoin(Member member);
	public int circleOut(Member member);
	public CircleMember mIdCircleList(String mId);
	public List<Member> circleMemberList(int cNum);
} 


	
