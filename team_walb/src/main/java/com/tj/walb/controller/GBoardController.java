package com.tj.walb.controller;

import org.ietf.jgss.GSSException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.walb.model.Gboard;
import com.tj.walb.service.GboardService;

@Controller
public class GBoardController { // 公知掲示板に関するController
	@Autowired
	private GboardService gService;
	
	private int write=0;
	
	 // PAGINGに必要な変数
	private final int BLOCKSIZE = 10;
	private final int PAGESIZE = 20;
	
	@RequestMapping(value="gboardList", method=RequestMethod.GET)
	public String gboardList(String pageNum, Model model) { // 公知掲示板のリストを貰うmethod（GET)
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*PAGESIZE+1;
		int endRow = startRow+PAGESIZE-1;
		int totCnt = gService.totCnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE-1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		model.addAttribute("gBoardList", gService.gboardList(startRow, endRow));
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageCnt", pageCnt);
		
		return "gBoard/gBoardList";
	}
	@RequestMapping(value="gboardList", method=RequestMethod.POST)
	public String gboardList2(String pageNum, Model model) { // 公知掲示板のリストを貰うmethod（POST)
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*PAGESIZE+1;
		int endRow = startRow+PAGESIZE-1;
		int totCnt = gService.totCnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE-1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		model.addAttribute("gBoardList", gService.gboardList(startRow, endRow));
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageCnt", pageCnt);
		
		return "gBoard/gBoardList";
	}
	
	@RequestMapping(value="gboardView", method=RequestMethod.GET)
	public String gboardView(int gNum, Model model) { // 公知掲示物の詳細内容を見るmethod（GET)
		model.addAttribute("gboardView", gService.gboardView(gNum));
		return "gBoard/gBoardView";
	}
	@RequestMapping(value="gboardView", method=RequestMethod.POST)
	public String gboardView2(int gNum, Model model) { // 公知掲示物の詳細内容を見るmethod（POST)
		model.addAttribute("gboardView", gService.gboardView(gNum));
		return "gBoard/gBoardView";
	}
	
	@RequestMapping(value="gboardInputForm", method=RequestMethod.GET)
	public String gboardInputForm() { // 公知掲示物の登録する為のViewに移動するmethod
		write=1; // Viewを通ると変形
		return "gBoard/gBoardInputForm";
	}
	
	@RequestMapping(value="gboardInput", method=RequestMethod.POST)
	public String gboardInput(MultipartHttpServletRequest mRequest, Model model) { // 公知掲示物の登録するmethod
		try {
			if(write==1) { // Viewを通らないと登録しない
				write=0;
				gService.gboardInsert(mRequest);
				model.addAttribute("gboardInsert", "등록 성공");
			} else {
				write=0;
			}
		} catch(Exception e) {
			model.addAttribute("gboardInsert", "등록 실패");
			System.out.println(e.getMessage());
		}
		return "forward:gboardList.do";
	}
	
	@RequestMapping(value="gboardDelete", method=RequestMethod.GET)
	public String gboardDelete(int gNum, Model model) { // 公知掲示物の消すmethod
		try {
			gService.gboardDelete(gNum);
			model.addAttribute("gboardDelete", "삭제 성공");
		} catch(Exception e) {
			model.addAttribute("gboardDelete", "삭제 실패");
			System.out.println(e.getMessage());
		}
		
		return "forward:gboardList.do";
	}
	
	@RequestMapping(value="gboardModifyForm", method=RequestMethod.GET)
	public String gboardModifyForm(int gNum, Model model) { // 公知掲示物の情報を修正する為のViewに移動するmethod
		write=1; // Viewを通ると変形
		model.addAttribute("gboard", gService.gboardView(gNum));
		return "gBoard/gBoardModifyForm";
	}
	
	@RequestMapping(value="gboardModify", method=RequestMethod.POST)
	public String gboardModify(MultipartHttpServletRequest mRequest, Model model) { // 公知掲示物の情報を修正するmethod
		int gNum = Integer.parseInt(mRequest.getParameter("gNum"));
		try {
			if(write==1) { // Viewを通らないと登録しない
				gService.gboardModify(mRequest, gService.gboardView(gNum));
				model.addAttribute("gBoardModify", "수정 완료");
				write=0;
			} else {
				write=0;
			}
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
			model.addAttribute("gBoardModify", "수정 실패");
		}
		
		return "forward:gboardView.do";
	}
}
