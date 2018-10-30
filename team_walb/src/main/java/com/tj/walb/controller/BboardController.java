package com.tj.walb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.walb.model.Bboard;
import com.tj.walb.model.BboardBunApply;
import com.tj.walb.model.BboardCircle;
import com.tj.walb.model.BunApply;
import com.tj.walb.model.FileUploadVO;
import com.tj.walb.model.Member;
import com.tj.walb.service.BboardService;
import com.tj.walb.service.MemberService;
import com.tj.walb.service.MessageService;
import com.tj.walb.service.Paging;

@Controller
public class BboardController {
	@Autowired
	MemberService mService;
	@Autowired
	BboardService bService;
	
	@Autowired
	MessageService mesService;
	@ModelAttribute("msgChkNum") //계속 사용하는 결과값을 기본으로 세팅>> 모든 컨트롤러 삽입
		public int msgChkNum(HttpSession session, String mesTo){ //HttpServletRequest request;
			//HttpSession session = request.getSession();
			mesTo = (String) session.getAttribute("mId");
			//System.out.println(mesTo==null? "로인인 전 알람":"로그인 후 알람");
			return mesService.msgChkNum(mesTo);
		}
	
	private int write = 0;
	
	/*=============== 번개모임 게시판 ===================*/
	@RequestMapping("viewBboard")
	public String viewBboard(HttpSession session, String pageNum, String mId, int bNum, BunApply bunapply, Model model) {
		if(pageNum == "" || pageNum==null) pageNum = "1";
		model.addAttribute("pageNum", pageNum);
		
		mId = (String)session.getAttribute("mId");
		bunapply.setbNum(bNum);
		bunapply.setmId(mId);
		int result = bService.bunapplyChk(bunapply);
		if(result==1) {
			model.addAttribute("participant", "참가자야!!!");
		}else if(result==0) {
			model.addAttribute("nonParticipant", "미참가자야!!!!");
		}else {
			model.addAttribute("bunapplyChkError", "번개 참여자 확인 에러");
		}
		
		model.addAttribute("viewBboard", bService.viewBboard(bNum));
		return "bboard/viewContent";
	}
	@RequestMapping("participateBun")
	public String participateBun(HttpSession session, int bNum, String mId, BunApply bunapply, Model model) {
		mId = (String)session.getAttribute("mId");
		bunapply.setbNum(bNum);
		bunapply.setmId(mId);
		int resultAdd = 0;
		try {
			if(bService.bunapplyChk(bunapply)==0) {
				resultAdd = bService.addBunapply(bunapply);
				bService.participateBboard(bNum);
			} else {
				throw new Exception();
			}
			model.addAttribute("bunMsg", "번개 참여 신청이 성공적으로 되었습니다.");
		} catch (Exception e) {
			if(resultAdd == 0)
				model.addAttribute("bunMsg", "번개 참여 신청을 실패하였습니다.(Error #1)");
			else if(resultAdd == 1)
				model.addAttribute("bunMsg", "번개 참여 신청을 실패하였습니다.(Error #2)");
		}
		return "forward:viewBboard.do";
	}
	/*번개 참여 취소*/
	@RequestMapping("cancleBun")
	public String cancleBun(HttpSession session, int bNum, String mId, BunApply bunapply, Model model) {
		mId = (String)session.getAttribute("mId");
		bunapply.setbNum(bNum);
		bunapply.setmId(mId);
		int resultCancle=0;
		try {
			resultCancle = bService.cancleBunapply(bunapply);
			bService.minusBboard(bNum);
			model.addAttribute("bunMsg", "번개 참여 취소가 성공적으로 되었습니다.");
		} catch (Exception e) {
			if(resultCancle==0)
				model.addAttribute("bunMsg", "번개 참여 취소를 실패하였습니다.(Error #1)");
			else if(resultCancle==1)
				model.addAttribute("bunMsg", "번개 참여 취소를 실패하였습니다.(Error #2)");
		}
		return "forward:viewBboard.do";
	}
	@RequestMapping("myBunListAll") //나의 번개 목록
	public String myBunListAll(HttpSession session, String mId, String pageNum, BboardBunApply bboardBun, Model model) {
		mId = (String)session.getAttribute("mId");
		
		int totCnt = bService.totCntmyBunListAll(mId);
		Paging paging = new Paging(totCnt, pageNum, 10, 10); // total, pageNum, pageSize, blockSize
		bboardBun.setStartRow(paging.getStartRow());
		bboardBun.setEndRow(paging.getEndRow());
		
		model.addAttribute("mId", mId);
		bboardBun.setmId(mId);
		
		model.addAttribute("myBunListAll", bService.myBunListAll(bboardBun));
		model.addAttribute("paging", paging);
		return "bboard/myBunListAll";
	}
	@RequestMapping("bunListAll") //전체 번개 목록
	public String bboardListAll(String pageNum, BboardCircle bCircle, Model model) {
		int total = bService.totCntBboardAll();
		Paging paging = new Paging(total, pageNum, 6, 10);
		bCircle.setStartRow(paging.getStartRow());
		bCircle.setEndRow(paging.getEndRow());
		
		model.addAttribute("bunList", bService.bboardListAll(bCircle));
		model.addAttribute("bunTitle", "- ALL");
		model.addAttribute("pagingListAll", paging);
		return "bboard/bunList";
	}
	@RequestMapping("bboardListIng") //진행중 번개 목록
	public String bboardListIng(String pageNum, BboardCircle bCircle, Model model) {
		int total = bService.totCntBboardIng();
		Paging paging = new Paging(total, pageNum, 6, 10);
		bCircle.setStartRow(paging.getStartRow());
		bCircle.setEndRow(paging.getEndRow());
		
		model.addAttribute("bunList", bService.bboardListIng(bCircle));
		model.addAttribute("bunTitle", "- ing");
		model.addAttribute("pagingListIng", paging);
		return "bboard/bunList";
	}
	@RequestMapping("bboardListPopular") //인기 번개목록(진행 중 + 현참인원 수)
	public String bboardListPopular(String pageNum, BboardCircle bCircle, Model model) {
		int total = bService.totCntBboardIng();
		Paging paging = new Paging(total, pageNum, 6, 10);
		bCircle.setStartRow(paging.getStartRow());
		bCircle.setEndRow(paging.getEndRow());
		
		model.addAttribute("bunList", bService.bboardListPopular(bCircle));
		model.addAttribute("bunTitle", "- POPULAR");
		model.addAttribute("pagingListPopular", paging);
		return "bboard/bunList";
	}
	@RequestMapping("writeBboardForm") // 번개 신청 작성폼
	public String writeBboardForm(HttpSession session, String mId, Model model) {
		write = 1;
		String result = "bboard/writeBboardForm";
		mId = (String)session.getAttribute("mId");
		if(mId==null || "".equals(mId)) {
			model.addAttribute("bunWriteFormResult", "로그인 해주세요");
			result = "forward:main.do";
		} else {
			model.addAttribute("mIdCircleList", mService.mIdCircleList(mId));
		}
		return result;
	}
	@RequestMapping("writeBboard")
	public String writeBboard(Bboard bboard, BunApply bunapply, String mId, HttpSession session, Model model) {
		if(write == 1) {
			try {
				bService.insertBboard(bboard);
				
				try {
					bunapply.setbNum(bService.getBnumAfterInsert(bboard.getcNum())); 
					bunapply.setmId((String)session.getAttribute("mId"));
					bService.addBunapply(bunapply);
				} catch (Exception e) {
					model.addAttribute("writeBboardMsg", "작성자 참여 신청에 오류가 발생했습니다. 해당 게시글에 별도로 참여신청을 눌러주세요.");
					return "forward:bunListAll.do";
				}
				
				model.addAttribute("writeBboardMsg", "번개 신청이 성공적으로 완료되었습니다.");
				return "forward:bunListAll.do";
			} catch (Exception e) {
				model.addAttribute("writeBboardMsg", "번개 신청이 실패하였습니다.");
				return "forward:writeBboardForm.do";
			}
		}else {
			return "forward:writeBboardForm.do";
		}
	}
	@RequestMapping(value = "bBoardFileUpload", method=RequestMethod.POST)
    public String fileUpload(FileUploadVO fileUploadVO, HttpServletRequest request , Model model){
		System.out.println(fileUploadVO.getUpload());
		System.out.println("파일업로드 들어왔니?");
		fileUploadVO = bService.fileUpload(fileUploadVO, request);
		
		model.addAttribute("filePath", fileUploadVO.getAttachPath() + fileUploadVO.getFilename());  
		model.addAttribute("filename", fileUploadVO.getFilename()); //결과값을
        
		return "bboard/writeEditorB";
    }
}
