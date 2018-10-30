package com.tj.walb.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.walb.model.Member;
import com.tj.walb.service.MemberService;
import com.tj.walb.service.MessageService;

@Controller
public class MemberContoller {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	MessageService mesService;
	@ModelAttribute("msgChkNum") //계속 사용하는 결과값을 기본으로 세팅>> 모든 컨트롤러 삽입
		public int msgChkNum(HttpSession session, String mesTo){ //HttpServletRequest request;
			//HttpSession session = request.getSession();
			mesTo = (String) session.getAttribute("mId");
			//System.out.println(mesTo==null? "로인인 전 알람":"로그인 후 알람");
			return mesService.msgChkNum(mesTo);
	}
	
	/* ========================= 회원가입  ===========================*/
	@RequestMapping(value="joinForm", method=RequestMethod.GET)//회원가입 페이지이동
	public String joinFormMember(Model model) {
		model.addAttribute("deptList",memberService.deptList());
		return "member/joinForm";
	}
	
	@RequestMapping(value = "joinMember", method = RequestMethod.POST) // 회원가입
	public String joinMember(MultipartHttpServletRequest mRequest) {
		try {
			memberService.joinMember(mRequest);
			mRequest.setAttribute("joinMember", "회원가입 성공");
			return "forward:main.do";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			mRequest.setAttribute("joinMember", "회원가입 실패");
			return "forward:main.do";
		}
	}

	@RequestMapping(value="member",method=RequestMethod.GET)  //중복 확인
	public String idConfirm(String mId, Model model) {
		int result = memberService.idConfirm(mId);
		model.addAttribute("result", result);
		return "member/idConfirm";
	}
	/* ========================= 정보수정  ===========================*/
	@RequestMapping("modifyForm") // 정보수정 페이지 이동
	public String modifyForm(Model model, HttpSession httpSession) {
		// String mId = ((Member)httpSession.getAttribute("member")).getmId();
		String mId = (String)httpSession.getAttribute("mId");
		model.addAttribute("deptList",memberService.deptList());
		model.addAttribute("modifyMember", memberService.getMember(mId));
		return "member/modifyForm";
	}

	@RequestMapping(value="modify",method=RequestMethod.POST)  //정보수정
	public String modify(MultipartHttpServletRequest mRequest, HttpSession httpSession, Model model) {		
		int result = memberService.modifyMember(mRequest);
		if(result>0) {
			model.addAttribute("modifyResult", result);
			model.addAttribute("deptList", memberService.deptList());
			Member member = memberService.getMember(mRequest.getParameter("mId"));
			httpSession.setAttribute("member", member);
			httpSession.setAttribute("mId", member.getmId());
			httpSession.setAttribute("mPw", member.getmPw());
			httpSession.setAttribute("mPhoto", member.getmPhoto());
			model.addAttribute("modifyMember", member);
		}
		return "forward:details.do";
	}

	/* ========================= 정보 상세 보기  ===========================*/
	@RequestMapping("details")  //상세보기 페이지 이동
	public String details(Model model, HttpSession httpSession) {
		String mId = (String)httpSession.getAttribute("mId");
		model.addAttribute("deptList",memberService.deptList());
		model.addAttribute("modifyMember", memberService.getMember(mId));
		return "member/details";
	}
	
	/* ========================== 계정 탈퇴  =============================*/
	@RequestMapping(value="secessionForm",method=RequestMethod.GET)  //탈퇴 페이지 이동
	public String secessionForm(Model model, HttpSession httpSession) {
		String mId = (String)httpSession.getAttribute("mId");
		model.addAttribute("secession", memberService.getMember(mId));
		return "member/secession";
	}
	
	@RequestMapping("mPwOkForm") // 탈퇴 비번확인 페이지 이동
	public String mPwOkForm(Model model, HttpSession httpSession) {
		System.out.println("컨트롤러 GET");
		String mId = (String)httpSession.getAttribute("mId");
		model.addAttribute("secession", memberService.getMember(mId));
		return "member/mPwOk";
	}
	
	@RequestMapping("secession")// 탈퇴
	public String secession(String mPw, HttpSession httpSession, Model model) {
		Member member = (Member)httpSession.getAttribute("member");
		int result = 0;
		try {
			result = memberService.secession(member, mPw);
			if(result == 1) model.addAttribute("updateresult"," 성공");
			else model.addAttribute("updateresult", "비번이 틀려서 탈퇴가 불가능 합니다");
			httpSession.invalidate();
			System.out.println("탈퇴 성공");
			/*String mId = (String) httpSession.getAttribute("mId");
			System.out.println("탈퇴 후 접속 확인 mId : "+mId);*/
			return "forward:main.do";
		} catch (Exception e) {
			System.out.println("탈퇴 결과값 : "+result);
			model.addAttribute("updateresult"," 실패");
			System.out.println("탈퇴 실패");
			return "forward:secessionForm.do";
		}
	}

	/* ========================== 추가 ============================= */
	// list페이지 계정추가 할때 사용(index페이지에서 수정 후 1번만 실행 할것)
	@RequestMapping(value = "insert50", method = RequestMethod.GET) // 회원 추가
	private String insert50() {
		memberService.insert50();
		return "redirect:main.do";

	}
	
	//서클 가입 탈퇴
	@RequestMapping(value="circleJoin", method=RequestMethod.GET)
	public String circleJoin(HttpSession session, int cNum, Model model) {
		Member member = memberService.getMember((String)session.getAttribute("mId"));
		String result = "";
		if(member !=null) {
			if(member.getmCircle1()==0) {
				member.setmCircle1(cNum);
				memberService.circleJoin(member);
				model.addAttribute("CircleJoinResult", "가입성공");
				result = "forward:circleMain.do";
			} else {
				if(member.getmCircle2()==0) {
					member.setmCircle2(cNum);
					memberService.circleJoin(member);
					model.addAttribute("CircleJoinResult", "가입성공");
					result = "forward:circleMain.do";
				}
				else {
					if(member.getmCircle3()==0) {
						member.setmCircle3(cNum);
						memberService.circleJoin(member);
						model.addAttribute("CircleJoinResult", "가입성공");
						result = "forward:circleMain.do";
					} else {
						model.addAttribute("CircleJoinResult", "가입할 수 있는 동아리가 가득찼습니다");
						result = "forward:circleView.do";
					}
				}
			}
			session.setAttribute("member", member);
		} else {
			model.addAttribute("CircleJoinResult", "존재하지 않는 회원입니다");
			result = "forward:circleView.do";
		}
		return result;
	}
	
	@RequestMapping(value="circleOut", method=RequestMethod.GET)
	public String circleOut(HttpSession session, int cNum, Model model) {
		Member member = memberService.getMember((String)session.getAttribute("mId"));
		String result = "";
		if(member !=null) {
			if(member.getmCircle1()==cNum) {
				member.setmCircle1(0);
				memberService.circleOut(member);
				model.addAttribute("circleOutResult", "탈퇴성공");
				result = "forward:circleMain.do";
			} else {
				if(member.getmCircle2()==cNum) {
					member.setmCircle2(0);
					memberService.circleOut(member);
					model.addAttribute("circleOutResult", "탈퇴성공");
					result = "forward:circleMain.do";
				}
				else {
					if(member.getmCircle3()==cNum) {
						member.setmCircle3(0);
						memberService.circleOut(member);
						model.addAttribute("circleOutResult", "탈퇴성공");
						result = "forward:circleMain.do";
					} else {
						model.addAttribute("circleOutResult", "가입되지 않은 동아리입니다");
						result = "forward:circleMain.do";
					}
				}
			}
			session.setAttribute("member", member);
		} else {
			model.addAttribute("circleOutResult", "존재하지 않는 회원입니다");
			result = "forward:Main.do";
		}
		return result;
	}
	
}
