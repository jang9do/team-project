package com.tj.walb.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.walb.model.ABoard;
import com.tj.walb.model.AReply;
import com.tj.walb.model.FileUploadVO;
import com.tj.walb.service.ABoardService;
import com.tj.walb.service.MessageService;

@Controller
public class ABoardController { // 後期に関するController
	@Autowired
	ABoardService aBoardService;
	
	private int write=0; // InputのViewを見た後の作業かを確認する変数
	
	 // PAGINGに必要な変数
	private final int BLOCKSIZE = 10;
	private final int PAGESIZE = 10;
	
	@Autowired
	MessageService mesService;
	@ModelAttribute("msgChkNum") //계속 사용하는 결과값을 기본으로 세팅>> 모든 컨트롤러 삽입
		public int msgChkNum(HttpSession session, String mesTo){ //HttpServletRequest request;
			//HttpSession session = request.getSession();
			mesTo = (String) session.getAttribute("mId");
			//System.out.println(mesTo==null? "로인인 전 알람":"로그인 후 알람");
			return mesService.msgChkNum(mesTo);
	}
	
	@RequestMapping(value="aBoardList", method=RequestMethod.GET)
	public String aBoardList(String pageNum, Model model){ // 後期リストを貰うmethod（GET）
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*PAGESIZE+1;
		int endRow = startRow+PAGESIZE-1;
		int totCnt = aBoardService.totCnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE-1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		model.addAttribute("aBoardList", aBoardService.aBoardList(startRow, endRow));
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageCnt", pageCnt);
		
		return "aBoard/aBoardList";
	}
	@RequestMapping(value="aBoardList", method=RequestMethod.POST)
	public String aBoardList2(String pageNum, Model model){ // 後期リストを貰うmethod（POST）
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*PAGESIZE+1;
		int endRow = startRow+PAGESIZE-1;
		int totCnt = aBoardService.totCnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE-1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		model.addAttribute("aBoardList", aBoardService.aBoardList(startRow, endRow));
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageCnt", pageCnt);
		
		return "aBoard/aBoardList";
	}
	
	@RequestMapping(value="aBoardView", method=RequestMethod.GET)
	public String aBoardView(int aNum, Model model) { // 後期の詳細内容を見るmethod（GET）
		write=1; // Viewを通ると変形
		model.addAttribute("aBoardView", aBoardService.aBoardView(aNum));
		model.addAttribute("aReplyList", aBoardService.aReplyList(aNum));
		return "aBoard/aBoardView";
	}
	
	@RequestMapping(value="aBoardView", method=RequestMethod.POST)
	public String aBoardView2(int aNum, Model model) { // 後期の詳細内容を見るmethod（POST）
		write=1; // Viewを通ると変形
		model.addAttribute("aBoardView", aBoardService.aBoardView(aNum));
		model.addAttribute("aReplyList", aBoardService.aReplyList(aNum));
		return "aBoard/aBoardView";
	}
	
	@RequestMapping(value="aBoardDelete", method=RequestMethod.GET)
	public String aBoardDelete(int aNum, Model model) { // 登録した後期を削除するmethod
		try {
			aBoardService.aBoardDelete(aNum);
			model.addAttribute("aBoardDelete", "삭제 성공");
		} catch(Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("aBoardDelete", "삭제 실패");
		}
		return "forward:aBoardList.do";
	}
	
	@RequestMapping(value="aReple", method=RequestMethod.POST)
	public String aReple(AReply aReply, Model model) { // 後期のcommentを登録するmethod
		try {
			aBoardService.aReplyInsert(aReply);
			aBoardService.aScoreChange(aReply.getaNum(), aBoardService.aReplyAvg(aReply.getaNum()));
			model.addAttribute("aRepleInsert", "덧글 작성 완료");
		} catch(Exception e) {

			model.addAttribute("aRepleInsert", "덧글 작성 실패");
			System.out.println(e.getMessage());
		}
		return "forward:aBoardView.do";
	}
	
	@RequestMapping(value="aBoardInputForm", method=RequestMethod.GET)
	public String aBoardInputForm() { // 後期を作成のViewに移動するmethod
		write=1; // Viewを通ると変形
		return "aBoard/aBoardInputForm";
	}
	
	@RequestMapping(value="aBoardInput", method=RequestMethod.POST)
	public String aBoardInput(HttpServletRequest request, ABoard aBoard, String temp_bDate, Model model) { // Viewで作成した後期内容を登録するmethod
		aBoard.setbDate(Timestamp.valueOf(temp_bDate+" 00:00:00"));
		aBoard.setaIp(request.getRemoteAddr());
		try {
			if(write==1) { // Viewを通らないと登録しない
				write=0;
				aBoardService.aBoardInsert(aBoard);
				model.addAttribute("aBoardInput", "후기 작성 완료");
			} else {
				write=0;
			}
		} catch(Exception e) {
			model.addAttribute("aBoardInput", "후기 작성 실패");
			System.out.println(e.getMessage());
		}
		return "forward:actiAfter.do";
	}
	
	@RequestMapping(value="aBoardModifyForm", method=RequestMethod.GET)
	public String aBoardModifyForm(int aNum, Model model){ // 作成している後期を修正する為のViewに移動するmethod
		model.addAttribute("aBoard" ,aBoardService.aBoardView(aNum));
		write=1; // Viewを通ると変形
		return "aBoard/aBoardModifyForm";
	}
	
	@RequestMapping(value="aBoardModify", method=RequestMethod.POST)
	public String aBoardModify(ABoard aBoard, String temp_bDate, Model model) { // Viewで作成した内容で修正するmethod
		aBoard.setbDate(Timestamp.valueOf(temp_bDate+" 00:00:00"));
		try {
			if(write==1) { // Viewを通らないと登録しない
				write=0;
				aBoardService.aBoardModify(aBoardService.aBoardView(aBoard.getaNum()), aBoard);
				model.addAttribute("aBoardModify", "수정 완료");
			} else {
				write=0;
			}
		} catch(Exception e) {

			model.addAttribute("aBoardModify", "수정 실패");
			System.out.println(e.getMessage());
		}
		return "forward:aBoardView.do";
	}
	
	@RequestMapping(value = "aBoardFileUpload", method=RequestMethod.POST)
    public String fileUpload(FileUploadVO fileUploadVO, HttpServletRequest request , Model model){ // CKeditorのfileUpload機能を使うためのmethod
		fileUploadVO = aBoardService.fileUpload(fileUploadVO, request);
		
		model.addAttribute("filePath", fileUploadVO.getAttachPath() + fileUploadVO.getFilename());  
		model.addAttribute("filename", fileUploadVO.getFilename()); //결과값을
        
		return "circle/ckeditorImageUpload";
    }
	
}
