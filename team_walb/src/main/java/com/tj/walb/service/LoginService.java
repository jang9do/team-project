package com.tj.walb.service;

import javax.servlet.http.HttpSession;

public interface LoginService {
	public String login(String mId, String mPw, HttpSession httpSession);
}
