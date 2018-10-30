package com.tj.walb.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.tj.walb.model.Fboard;
import com.tj.walb.model.FileUploadVO;
import com.tj.walb.service.FboardService;
import com.tj.walb.service.MessageService;
import com.tj.walb.service.Paging;

@Controller
public class FboardController {
	@Autowired
	private FboardService fService; //서비스를 상속하는 서비스인터페이스를 가져온다.
	@Autowired
	MessageService mesService;
	
	private int write =1;
	
	private String savePath = "D:/mege_T/team_walb/src/main/webapp/fBoardImg/";
	
	@ModelAttribute("msgChkNum") //계속 사용하는 결과값을 기본으로 세팅>> 모든 컨트롤러 삽입
		public int msgChkNum(HttpSession session, String mesTo){ //HttpServletRequest request;
			//HttpSession session = request.getSession();
			mesTo = (String) session.getAttribute("mId");
			//System.out.println(mesTo==null? "로인인 전 알람":"로그인 후 알람");
			return mesService.msgChkNum(mesTo);
	}
	
	@RequestMapping(value="fBoardList") // 게시판 리스트
	public String fBoardList(String pageNum, int cNum, Fboard fBoard, Model model) {
		System.out.println(cNum);
		int total = fService.fBoardTotal(cNum); // 글 갯수
		System.out.println(total);
		Paging paging = new Paging(total, pageNum, 10, 10);
		fBoard.setStartRow(paging.getStartRow());
		fBoard.setEndRow(paging.getEndRow());
		model.addAttribute("list", fService.fBoardList(fBoard));
		model.addAttribute("paging", paging);
		return "circle/fBoardList";
	}
	@RequestMapping(value="fBoardDetail", method=RequestMethod.GET) // 게시판 상세보기
	public String fBoardDetail(int fNum, Model model) {
		model.addAttribute("detail", fService.fBoardDetail(fNum));
		return "circle/fBoardDetail";
	}
	@RequestMapping(value="fBoardWriteForm", method=RequestMethod.GET)  // 게시판 글 작성 폼
	public String fBoardWriteForm(Model model) {
		return "circle/fBoardWriteForm";
	}
	@RequestMapping(value="fBoardWriteForm", method=RequestMethod.POST)  // 게시판 글 작성 폼
	public String fBoardWriteFormP(Model model) {
		write=1;
		return "circle/fBoardWriteForm";
	}
	@RequestMapping(value="fBoardWrite", method=RequestMethod.POST) // 게시판 글 작성 서비스 수행
	public String fBoardWrite(Fboard fBoard, Model model, HttpServletRequest Requset, HttpSession httpSession ) {
		try {
			fBoard.setfIp(Requset.getRemoteAddr());
			fBoard.setmId((String)httpSession.getAttribute("mId"));
			fService.fBoardInsert(fBoard);
			model.addAttribute("writeResult", "글작성 성공");
			return "forward:fBoardList.do";
		} catch (Exception e) {
			model.addAttribute("writeResult", "글작성 실패");
			System.out.println(e.getMessage());
			return "forward:fBoardWriteForm.do";
		}
	}
	@RequestMapping(value="fBoardUpdateForm") // 게시판 글 수정 폼
	public String fBoardUpdateForm(int fNum, Model model) {
		model.addAttribute("bUpdateForm", fService.fBoardDetail(fNum));
		return "circle/fBoardUpdateForm";
	}
	@RequestMapping(value="fBoardUpdate", method=RequestMethod.POST) // 게시판 글 수정 서비스 수행
	public String fBoardUpdate(Fboard fBoard, int fNum, Model model, HttpSession httpSession) {
		try {
			fBoard.setmId((String) httpSession.getAttribute("mId"));
			model.addAttribute("bUpdate", fService.fBoardUpdate(fBoard));
			model.addAttribute("fBoardUpdateResult", "글수정 성공");
			return "forward:fBoardList.do";
		} catch (Exception e) {
			model.addAttribute("fBoardUpdateResult", "글수정 실패");
			System.out.println(e.getMessage());
			return "forward:fBoardUpdateForm.do";
		}
	}
	@RequestMapping(value="fBoardDelete", method=RequestMethod.GET) // 게시판 글 삭제
	public String fBoardDelete(int fNum, Model model, HttpSession httpSession, Fboard fBoard) {
		try {
			fBoard.setmId((String) httpSession.getAttribute("mId"));
			fService.fBoardDelete(fNum);
			model.addAttribute("fBoardDeleteResult", "글 삭제가 완료되었습니다.");
			return "forward:fBoardList.do";
		} catch (Exception e) {
			model.addAttribute("fBoardDeleteResult", "글 삭제가 완료되었습니다.");
			return "forward:fBoardDetail.do";
		}
	}
	@RequestMapping(value="fBoardReplyView", method=RequestMethod.GET)
	public String fBoardReplyView(int fNum, Model model) {
		model.addAttribute("fBoardReplyView", fService.fBoardDetail(fNum));
		return "circle/fBoardReplyView";
	}
	@RequestMapping(value="fBoardReply", method=RequestMethod.POST)
	public String fBoardReply(Fboard fBoard, int fNum, Model model, HttpServletRequest Requset, HttpSession httpSession, BindingResult result) {
		try {
			fBoard.setfIp(Requset.getRemoteAddr());
			fBoard.setmId((String) httpSession.getAttribute("mId"));
			fService.fBoardAstep(fBoard);
			fService.fBoardReply(fBoard);
			model.addAttribute("replyResult", "답변글작성 성공");
			return "forward:fBoardList.do";
		} catch (Exception e) {
			model.addAttribute("replyResult", "답변글작성 실패");
			System.out.println(e.getMessage());
			return "forward:fBoardReplyView.do";
		}
	}
	
	@RequestMapping(value = "fBoardFileUpload", method=RequestMethod.POST)
    public String fileUpload(FileUploadVO fileUploadVO, HttpServletRequest request , Model model){
		fileUploadVO = fService.fileUpload(fileUploadVO, request);
		
		model.addAttribute("filePath", fileUploadVO.getAttachPath() + fileUploadVO.getFilename());  
		model.addAttribute("filename", fileUploadVO.getFilename()); //결과값을
        
		return "circle/ckeditorImageUpload";
    }
}
