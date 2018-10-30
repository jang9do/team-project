package com.tj.walb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.walb.service.ABoardService;
import com.tj.walb.service.BboardService;
import com.tj.walb.service.CircleService;
import com.tj.walb.service.GboardService;
import com.tj.walb.service.LoginService;
import com.tj.walb.service.MessageService;

@Controller
public class MainController {
	@Autowired
	LoginService mService;
	@Autowired
	ABoardService aService;
	@Autowired
	GboardService gService;
	@Autowired
	BboardService bService;
	@Autowired
	CircleService cService;
	
	@Autowired
	MessageService mesService;
	@ModelAttribute("msgChkNum") //계속 사용하는 결과값을 기본으로 세팅>> 모든 컨트롤러 삽입
		public int msgChkNum(HttpSession session, String mesTo){ //HttpServletRequest request;
			//HttpSession session = request.getSession();
			mesTo = (String) session.getAttribute("mId");
			//System.out.println(mesTo==null? "로인인 전 알람":"로그인 후 알람");
			return mesService.msgChkNum(mesTo);
	}
	
	/* ========================= 로그인 관련 ===========================*/
	
	@RequestMapping(value = "loginView", method = RequestMethod.GET)
	public String loginView() {
		return "member/login";
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String mId, String mPw, Model model, HttpSession httpSession) {
		String result = mService.login(mId, mPw, httpSession);
		if(result.equals("로그인 성공")) {
			System.out.println("로그인 성공");
			model.addAttribute("loginMsg", result);
			return "forward:main.do";
		}else {
			System.out.println("로그인 실패");
			model.addAttribute("loginMsg", result);
			return "member/login";
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("logoutMsg", "로그아웃 되었습니다.");
		return "forward:main.do";
	}

	/* ========================= MAIN PAGE ===========================*/
	
	@RequestMapping("main")
	public String home(Model model) {
		model.addAttribute("bestReviews", aService.aBoardTop3());
		model.addAttribute("notice10", gService.notice10());
		model.addAttribute("bungae3list", bService.bungae3());
		model.addAttribute("topCircle", cService.circleTop());
		return "main/main";
	}
	

	
	
	
	
}
