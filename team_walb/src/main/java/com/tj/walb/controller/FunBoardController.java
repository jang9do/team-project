package com.tj.walb.controller;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.walb.model.FunBoard;
import com.tj.walb.service.FunBoardService;
import com.tj.walb.service.MessageService;
import com.tj.walb.service.Paging;
@Controller
public class FunBoardController {
	@Autowired
	private FunBoardService funService;
	@Autowired
	MessageService mesService;
	@ModelAttribute("msgChkNum") //계속 사용하는 결과값을 기본으로 세팅>> 모든 컨트롤러 삽입
		public int msgChkNum(HttpSession session, String mesTo){ //HttpServletRequest request;
			//HttpSession session = request.getSession();
			mesTo = (String) session.getAttribute("mId");
			//System.out.println(mesTo==null? "로인인 전 알람":"로그인 후 알람");
			return mesService.msgChkNum(mesTo);
	}
	@RequestMapping(value="funBoardList") // 펀딩 리스트
	public String funBoardList(String pageNum, FunBoard funBoard, Model model) {
		try {
			funService.FunBoardResult();
		} catch(Exception e){
			System.out.println(e.getMessage());
			model.addAttribute("FunBoard", "마감처리 오류");
		}
		int total = funService.funBoardTotal();
		Paging paging = new Paging(total, pageNum, 9, 5);
		funBoard.setStartRow(paging.getStartRow());
		funBoard.setEndRow(paging.getEndRow());
		List<FunBoard> temp = funService.funBoardList(funBoard);
		model.addAttribute("funBoardList", temp);
		model.addAttribute("paging", paging);
		return "funding/funBoardList";
	}
	
	@RequestMapping(value="funBoardDetail", method=RequestMethod.GET) // 펀딩 상세보기
	public String funBoardDetail(int funNum, Model model) {
		model.addAttribute("funBDetail", funService.funBoardDetail(funNum));
		return "funding/funBoardDetail";
	}
	@RequestMapping(value="funBoardDetail", method=RequestMethod.POST) // 펀딩 상세보기
	public String funBoardDetail2(int funNum, Model model) {
		model.addAttribute("funBDetail", funService.funBoardDetail(funNum));
		return "funding/funBoardDetail";
	}
	@RequestMapping(value="funBoardServiceForm") // 펀딩하기 입력폼 (기부금액 입력하고 넘기는폼)
	public String funBoardServiceForm() {
		return "funding/funBoardServiceForm";
	}
	@RequestMapping(value="funBoardService") // 펀딩하기서비스 수행
	public String funBoardService(FunBoard funBoard, Model model, HttpSession httpSession) {
		try {
			System.out.println("컨트롤러 들어옴 *");
			funBoard.setmId((String)httpSession.getAttribute("mId"));
			model.addAttribute("funding", funService.funding(funBoard));
			model.addAttribute("fundingMsg", "펀딩해주셔서 감사드립니다!");
			return "forward:funBoardList.do";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("fundingMsg", "펀딩 실패");
			return "forward:funBoardServiceForm.do";
		}
	}
	
	@RequestMapping(value="funBoardWriteForm", method=RequestMethod.GET) // 펀딩새글 작성
	public String funBoardWriteForm(Model model) {
		return "funding/funBoardWriteForm";
	}
	@RequestMapping(value="funBoardWrite", method=RequestMethod.POST) //펀딩글작성하기 서비스 수행
	public String funBoardWrite(String funEnding, FunBoard funBoard, HttpServletRequest request, Model model) {
			funBoard.setFunEnd(Timestamp.valueOf(funEnding+" 00:00:00"));
			funBoard.setFunIp(request.getRemoteAddr());
			funService.funBoardInsert(funBoard);
			System.out.println("펀포토");
			model.addAttribute("funBoardWriteMsg", "펀딩글작성 성공");
			return "forward:funBoardList.do";
	}
	
	@RequestMapping(value="funBoardDelete") // 마감된 펀딩글 중에서 글 삭제
	public String funBoardDelete(int funNum, Model model, FunBoard funBoard) {
		try {
			funService.funBoardDelete(funNum);
			model.addAttribute("funBoardDelete", "글삭제가 완료되었습니다.");
			return "forward:funBoardList.do";
		} catch (Exception e) {
			model.addAttribute("funBoardDelete", "글삭제가 실패되었습니다.");
			return "forward:funBoardList.do";
		}
	}
	
	@RequestMapping(value="funBoardModifyForm")
	public String funBoardModifyForm(int funNum, Model model) {
		model.addAttribute("funBDetail" ,funService.funBoardDetail(funNum));
		return "funding/funBoardModifyForm";
	}
	
	@RequestMapping(value="funBoardModify", method=RequestMethod.POST) //펀딩글작성하기 서비스 수행
	public String funBoardModify(String funEnding, FunBoard funBoard, Model model) {
			funBoard.setFunEnd(Timestamp.valueOf(funEnding+" 00:00:00"));
			System.out.println(funBoard);
			funService.funBoardModify(funBoard);
			model.addAttribute("funBoardModifyMsg", "수정 성공");
			return "forward:funBoardDetail.do";
	}
}
