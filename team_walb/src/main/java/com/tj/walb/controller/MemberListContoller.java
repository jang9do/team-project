package com.tj.walb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.walb.model.Dept;
import com.tj.walb.model.Member;
import com.tj.walb.service.MemberService;
import com.tj.walb.service.Paging;

@Controller
public class MemberListContoller {
	@Autowired
	private MemberService mlService;
	@ModelAttribute("deptList")
	public List<Dept> deptList(){
		return mlService.deptList();
	}
	@RequestMapping("detailsList")  //상세보기 페이지 이동
	public String detailsList(Model model, HttpSession httpSession,String mId) {
		Member member = mlService.getMember(mId);
		model.addAttribute("detailsList", member);
		return "member/detailsList";
	}
	// memberList.do - memberList.do?pageNum=2 - memberList.do?pageNum=2&schItem=mId&schWord=홍
	@RequestMapping(value="memberList",method=RequestMethod.GET)
	public String memberListForm(String pageNum, Member member, Model model) {// 회원리스트
		int total = mlService.total(member);// 직원명수
		Paging paging = new Paging(total, pageNum, 10, 10);
		member.setStartRow(paging.getStartRow());
		member.setEndRow(paging.getEndRow());
		model.addAttribute("memberList", mlService.MemberList(member)); 
		model.addAttribute("paging", paging);
		return "member/memberList";
	}
}
