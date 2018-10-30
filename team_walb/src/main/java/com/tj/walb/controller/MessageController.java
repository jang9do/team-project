package com.tj.walb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.walb.model.Message;
import com.tj.walb.service.MessageService;
import com.tj.walb.service.Paging;

@Controller
public class MessageController {
	@Autowired
	private MessageService mService;
	
	@ModelAttribute("msgChkNum") //계속 사용하는 결과값을 기본으로 세팅>> 모든 컨트롤러 삽입
	public int msgChkNum(HttpSession session, String mesTo){ //HttpServletRequest request;
		//HttpSession session = request.getSession();
		mesTo = (String) session.getAttribute("mId");
		//System.out.println(mesTo==null? "로인인 전 알람":"로그인 후 알람");
		return mService.msgChkNum(mesTo);
	}
	
	//받은쪽지함- 쪽지 메인페이지(view단에서 input type hidden으로 파라미터 컨트롤러로 보내주게 만들어놔)
	@RequestMapping(value="msgMain", method=RequestMethod.GET)
	public String msgMain(String pageNum, Model model, HttpSession session) {
		String mesTo=(String)session.getAttribute("mId");
		int total = mService.msgReceiveCnt(mesTo);
		Paging paging = new Paging(total, pageNum, 8, 5);
		Message message = new Message();
		message.setMesTo(mesTo);
		message.setStartRow(paging.getStartRow());
		message.setEndRow(paging.getEndRow());
		model.addAttribute("msgReceiveList", mService.msgReceiveList(message));
		model.addAttribute("paging", paging);
		return "msg/msgMain";
	}
	
	
	//특정인과 주고 받은 쪽지 list
	@RequestMapping(value="msgSpList", method=RequestMethod.GET)
	public String msgSpList(String pageNum, Message message , Model model, HttpSession session) {
		String mesTo=(String)session.getAttribute("mId");
		message.setMesTo(mesTo);
		int total = mService.msgSpCnt(message);
		Paging paging = new Paging(total, pageNum, 8, 5);
		message.setStartRow(paging.getStartRow());
		message.setEndRow(paging.getEndRow());
		System.out.println("mapper가기전"+message.toString());
		model.addAttribute("msgSpList", mService.msgSpList(message));
		model.addAttribute("paging", paging);
		return "msg/msgSpList";
	}
	
	//안읽은 쪽지함
	@RequestMapping(value="newMsgList", method=RequestMethod.GET)
	public String newMsgList(String pageNum, Model model, HttpSession session) {
		String mesTo = (String)session.getAttribute("mId");
		Message message = new Message();
		int total = mService.msgNoreadCnt(mesTo);
		Paging paging = new Paging(total, pageNum, 8,5);
		message.setMesTo(mesTo);
		message.setStartRow(paging.getStartRow());
		message.setEndRow(paging.getEndRow());
		model.addAttribute("newMsgList", mService.newMsgList(message));
		model.addAttribute("paging", paging);
		return "msg/newMsgList";
	}
		
	//보낸 쪽지함//view단에서 input type hidden으로 파라미터 컨트롤러로 보내주게 만들어놔
	@RequestMapping(value="msgSendList", method=RequestMethod.GET)
	public String sendList(String pageNum, Model model, HttpSession session) {
		String mesFrom = (String)session.getAttribute("mId");
		int total = mService.msgSendCnt(mesFrom);
		Message message = new Message();
		Paging paging = new Paging(total, pageNum, 8, 5);
		message.setMesFrom(mesFrom);
		message.setStartRow(paging.getStartRow());
		message.setEndRow(paging.getEndRow()); 
		model.addAttribute("msgSendList", mService.msgSendList(message));
		model.addAttribute("paging", paging);
		return "msg/sendList";
	}
		
	//쪽지 작성 폼
	@RequestMapping(value="msgSendForm", method=RequestMethod.GET)
	public String msgSendForm(Model model, HttpSession session, String mesNum) {
		int num;
		if(mesNum != null) {
			num = Integer.parseInt(mesNum);
			model.addAttribute("readMsg", mService.msgReading(num));
		}
		String mesFrom = (String)session.getAttribute("mId");
		model.addAttribute("mesFrom", mesFrom);
		return "msg/msgSendForm";
	}
	
	//쪽지 발송하기
	@RequestMapping(value="msgSend", method=RequestMethod.GET)
	public String msgSend(Message message, Model model) {
		try {
			mService.msgSend(message);
			model.addAttribute("sendResult", "success");
			return "forward:msgSendList.do";
		} catch (Exception e) {
			model.addAttribute("sendResult", "fail");
			return "forward:msgSendForm.do";
		}
	}
	
	//쪽지 상세보기
	@RequestMapping(value="readMsg", method=RequestMethod.GET)
	public String readMsg(long mesNum, Model model) {
		model.addAttribute("readMsg", mService.msgReading(mesNum));
		mService.msgChk(mesNum);
		return "msg/readMsg";
	}
	
	//쪽지삭제
	@RequestMapping(value="deleteMsg", method=RequestMethod.GET)
	public String delete(String mesNums) {
		try {
			mService.msgDelete(mesNums);
			return "forward:msgMain.do";
		} catch (Exception e) {}
		return "msg/msgMain";
	}
}
