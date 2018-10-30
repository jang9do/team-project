package com.tj.walb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.walb.model.Circle;
import com.tj.walb.model.Member;
import com.tj.walb.service.CircleService;
import com.tj.walb.service.MemberService;
import com.tj.walb.service.MessageService;

@Controller
public class CircleController { // 同好会に関するController
	@Autowired
	private CircleService cService;
	@Autowired
	private MemberService mService; 
	
	 // PAGINGに必要な変数
	private final int BLOCKSIZE = 10;
	private final int PAGESIZE = 3;
	private final int SEARCH_PAGESIZE = 6;
	
	@Autowired
	MessageService mesService;
	@ModelAttribute("msgChkNum") //계속 사용하는 결과값을 기본으로 세팅>> 모든 컨트롤러 삽입
		public int msgChkNum(HttpSession session, String mesTo){ //HttpServletRequest request;
			//HttpSession session = request.getSession();
			mesTo = (String) session.getAttribute("mId");
			//System.out.println(mesTo==null? "로인인 전 알람":"로그인 후 알람");
			return mesService.msgChkNum(mesTo);
	}
	
	@RequestMapping(value="circleMain", method=RequestMethod.GET)
	public String CircleMain(HttpSession session, Model model) { // 同好会のメインViewに移動するmethod（会員は最大三つの同好会に加入できる、空いている同好会スロットだけを表示する）
		Member member = (Member)session.getAttribute("member");
		if(member.getmCircle1()!=0) {
			model.addAttribute("mCircle1", cService.circleView(member.getmCircle1()));
		}
		if(member.getmCircle2()!=0) {
			model.addAttribute("mCircle2", cService.circleView(member.getmCircle2()));
		}
		if(member.getmCircle3()!=0) {
			model.addAttribute("mCircle3", cService.circleView(member.getmCircle3()));
		}
		
		return "circle/CircleMain";
	}
	
	@RequestMapping(value="circleView", method=RequestMethod.GET)
	public String CircleView(int cNum, Model model) { // 同好会の詳細内容を見るViewに移動するmethod
		model.addAttribute("Circle", cService.circleView(cNum));
		
		return "circle/CircleView";
	}
	@RequestMapping(value="circleView", method=RequestMethod.POST)
	public String CircleView2(int cNum, Model model) { // 同好会の詳細内容を見るViewに移動するmethod
		model.addAttribute("Circle", cService.circleView(cNum));
		
		return "circle/CircleView";
	}
	
	@RequestMapping(value="circleViewHit", method=RequestMethod.GET)
	public String CircleViewHit(int cNum, Model model) { // 同好会の詳細内容を見るとClick Countが上がるmethod
		cService.circleHit(cNum);
		model.addAttribute("Circle", cService.circleView(cNum));
		
		return "circle/CircleView";
	}
	
	@RequestMapping(value="circleList", method=RequestMethod.GET)
	public String CircleList(String pageNum, Model model) { // 同好会リストを貰うmethod
		model.addAttribute("CircleTop3", cService.circleTop3());// Click Count数が上位三つの同好会を貰うmethod
		
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*PAGESIZE+1;
		int endRow = startRow+PAGESIZE-1;
		int totCnt = cService.totCnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE-1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		model.addAttribute("CircleList", cService.circleList(startRow, endRow));
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageCnt", pageCnt);
		
		return "circle/CircleList";
	}
	
	@RequestMapping(value="circleSearch", method=RequestMethod.GET)
	public String circleSearch(String pageNum, Circle circle, Model model) { // 同好会を検索するmethod
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*SEARCH_PAGESIZE+1;
		int endRow = startRow+SEARCH_PAGESIZE-1;
		int totCnt = cService.searchTotCnt(circle);
		int pageCnt = (int)Math.ceil((double)totCnt/SEARCH_PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE-1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		circle.setStartRow(startRow);
		circle.setEndRow(endRow);
		
		model.addAttribute("CircleSearchList", cService.circleSearch(circle));
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageCnt", pageCnt);
		
		return "circle/CircleSearch";
	}
	
	@RequestMapping(value="circleMemberList", method=RequestMethod.GET)
	public String circleMemberList(int cNum, String mId, Model model) { // 同好会に加入している会員達のリストを貰うmethod
		model.addAttribute("CircleMaster", mService.getMember(mId)); // 同好会Master
		model.addAttribute("CircleMemberList", mService.circleMemberList(cNum));
		
		return "circle/CircleMemberList";
	}
}
