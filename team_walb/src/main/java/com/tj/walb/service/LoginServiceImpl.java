package com.tj.walb.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.walb.dao.LoginDao;
import com.tj.walb.model.Member;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDao mDao;
	@Override
	public String login(String mId, String mPw, HttpSession httpSession) {
		String result="";
		Member member = new Member(mId, mPw);
		Member mem = mDao.login(member);
		if(mem!=null) {
			if(mem.getmOut()==0) {
				httpSession.setAttribute("member", mem);
				httpSession.setAttribute("mId", mem.getmId());
				httpSession.setAttribute("mPw", mem.getmPw());
				httpSession.setAttribute("lNo", mem.getlNo());				
				result= "로그인 성공";
			}
			else if(mem.getmOut()==1) {
				result= "탈퇴한 회원입니다.";
			}
		}else {
			result = "아이디와 비밀번호를 확인하세요.";
		}
		return result;
	}

}
