package com.tj.walb.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.walb.model.ActiResult;
import com.tj.walb.model.Activity;
import com.tj.walb.model.Circle;
import com.tj.walb.model.Member;
import com.tj.walb.model.Place;
import com.tj.walb.service.ActiResultService;
import com.tj.walb.service.ActivityService;
import com.tj.walb.service.CircleService;
import com.tj.walb.service.MemberService;
import com.tj.walb.service.MessageService;
import com.tj.walb.service.PlaceService;

@Controller
public class CircleMasterController { // 同好会の活動の予約に関するController
	@Autowired
	private PlaceService pService; // 場所の情報に関するService
	@Autowired
	private ActivityService actiService; // 同好会の活動の予約に関するService
	@Autowired
	private ActiResultService actiResultService; // 同好会の活動の結果を貯槽するService
	@Autowired
	private MemberService mService;
	@Autowired
	private CircleService cService;
	
	private int write=0;
	
	@Autowired
	MessageService mesService;
	@ModelAttribute("msgChkNum") //계속 사용하는 결과값을 기본으로 세팅>> 모든 컨트롤러 삽입
		public int msgChkNum(HttpSession session, String mesTo){ //HttpServletRequest request;
			//HttpSession session = request.getSession();
			mesTo = (String) session.getAttribute("mId");
			//System.out.println(mesTo==null? "로인인 전 알람":"로그인 후 알람");
			return mesService.msgChkNum(mesTo);
	}
	
	@RequestMapping(value="reserve", method=RequestMethod.GET)
	public String reserve(Model model) { // 同好会の活動の予約するmethod
		List<Place> pList = pService.plist();
		model.addAttribute("pList", pList);
		return "reserve/reserve";
	}
	
	@RequestMapping(value="reserveView", method=RequestMethod.GET)
	public String reserveView(Model model) { // 同好会の活動の予約する為のViewに移動するmethod
		List<Place> pList = pService.plist();
		model.addAttribute("pList", pList);
		return "reserve/reserveView";
	}
	
	@RequestMapping(value="reserveTime", method=RequestMethod.GET)
	public String reserveTime(int pNum, String actiDate, int cNum, Model model) throws ParseException { // 同好会の活動の予約時間を設定するAjax使用のViewに移動するmethod
		Activity activity = new Activity();
		activity.setpNum(pNum);
		activity.setcNum(cNum);
		activity.setActiDate(Timestamp.valueOf(actiDate+" 00:00:00"));
		List<Activity> actiList = actiService.activityTimeList(activity);
		model.addAttribute("actiList", actiList);
		write=1; // Viewを通ると変形
		
		return "reserve/reserveTime";
	}
	
	@RequestMapping(value="reserveTimeTable", method=RequestMethod.GET)
	public String reserveTimeTable(int pNum, String actiDate, Model model) throws ParseException { // 同好会の活動の予約状況を見る為のAjaxに移動するmethod
		Activity activity = new Activity();
		activity.setpNum(pNum);
		activity.setActiDate(Timestamp.valueOf(actiDate+" 00:00:00"));
		List<Activity> actiList = actiService.activityTimeList(activity);
		model.addAttribute("actiList", actiList);
		write=1; // Viewを通ると変形
		
		return "reserve/reserveTimeTable";
	}
	
	@RequestMapping(value="reserveResult", method=RequestMethod.POST)
	public String reserveResult(Activity activity, String actiDate, Model model) { // 同好会の活動を申請するmethod
		activity.setActiDate(Timestamp.valueOf(actiDate));
		if(write==1) { // Viewを通らないと登録しない
			try {
				actiService.activityRequest(activity);
				model.addAttribute("actiInsert", "신청성공");
			} catch(Exception e){
				System.out.println(e.getMessage());
				model.addAttribute("actiInsert", "신청실패");
			} finally {
				write=0;
			}
		} else {
			model.addAttribute("actiInsert", "올바르지 않은 접근입니다");
			write=0;
		}
		return "forward:reserveList.do";
	}
	
	@RequestMapping(value="reserveList", method=RequestMethod.GET)
	public String reserveList(int cNum, Model model) { // 同好会の名で予約できている目録を見るmethod（GET)
		List<Activity> actiList =  actiService.activityList(cNum);
		model.addAttribute("reserveList", actiList);
		return "reserve/reserveList";
	}
	@RequestMapping(value="reserveList", method=RequestMethod.POST)
	public String reserveList2(int cNum, Model model) { // 同好会の名で予約できている目録を見るmethod（POST)
		List<Activity> actiList =  actiService.activityList(cNum);
		model.addAttribute("reserveList", actiList);
		return "reserve/reserveList";
	}
	
	@RequestMapping(value="reserveDelete", method=RequestMethod.GET)
	public String reserveDelete(int actiNum, Model model) { // 活動の予約を消すmethod
		try {
			actiService.activityDelete(actiNum);
			model.addAttribute("reserveDelete", "삭제성공");
		} catch(Exception e){
			System.out.println(e.getMessage());
			model.addAttribute("reserveDelete", "삭제실패");
		}
		return "forward:reserveList.do";
	}
	
	@RequestMapping(value="actiResultChk", method=RequestMethod.GET)
	public String actiResultChk(int actiNum, Model model) { // 管理者が活動承認するmethod
		Activity activity = actiService.acticityView(actiNum);
		ActiResult actiResult = new ActiResult();
		actiResult.setpNum(activity.getpNum());
		actiResult.setcNum(activity.getcNum());
		actiResult.setArTitle(activity.getActiTitle());
		actiResult.setArDate(activity.getActiDate());
		actiResult.setArCon(activity.getActiCon());
		
		try {
			actiResultService.actiResultInsert(actiResult);
			actiService.activityDelete(actiNum);
			model.addAttribute("actiResult", "활동확인");
		} catch(Exception e){
			System.out.println(e.getMessage());
			model.addAttribute("actiResult", "작업실패");
		}
		
		return "forward:reserveList.do";
	}
	@RequestMapping(value="actiAfter", method=RequestMethod.POST)
	public String actiAfter(int actiNum, Model model) { // 同好会の活動の結果を貯蔵するmethod
		Activity activity = actiService.acticityView(actiNum);
		ActiResult actiResult = new ActiResult();
		actiResult.setpNum(activity.getpNum());
		actiResult.setcNum(activity.getcNum());
		actiResult.setArTitle(activity.getActiTitle());
		actiResult.setArDate(activity.getActiDate());
		actiResult.setArCon(activity.getActiCon());
		
		try {
			actiResultService.actiResultInsert(actiResult);
			actiService.activityDelete(actiNum);
			model.addAttribute("actiResult", "활동확인");
		} catch(Exception e){
			System.out.println(e.getMessage());
			model.addAttribute("actiResult", "작업실패");
		}
		
		return "forward:aBoardList.do";
	}
	
	@RequestMapping(value="circleInsertForm", method=RequestMethod.GET)
	public String circleInsertForm() { // 新たな同好会を登録する為のViewに移動するmethod
		return "circle/CircleInsertForm";
	}
	
	@RequestMapping(value="circleInsert", method=RequestMethod.POST)
	public String circleInsert(Circle circle, Model model) { // 新たな同好会を登録するmethod
		Member member = mService.getMember(circle.getmId());
		String result = "";
		if(member !=null) { // 同好会のマスタになる人の空いたスロットに同好会を登録する
			if(member.getmCircle1()==0) {
				cService.cirInsert(circle);
				System.out.println(cService.CircleLastNum());
				member.setmCircle1(cService.CircleLastNum());
				mService.circleJoin(member);
				model.addAttribute("CircleInsertResult", "가입성공");
				result = "redirect:circleList.do";
			} else {
				if(member.getmCircle2()==0) {
					cService.cirInsert(circle);
					member.setmCircle2(cService.CircleLastNum());
					mService.circleJoin(member);
					model.addAttribute("CircleInsertResult", "가입성공");
					result = "redirect:circleList.do";
				}
				else {
					if(member.getmCircle3()==0) {
						cService.cirInsert(circle);
						member.setmCircle3(cService.CircleLastNum());
						mService.circleJoin(member);
						model.addAttribute("CircleInsertResult", "가입성공");
						result = "redirect:circleList.do";
					} else {
						model.addAttribute("CircleInsertResult", "가입할 수 있는 동아리가 가득찼습니다");
						result = "circle/CircleInsertForm";
					}
				}
			}
		} else {
			model.addAttribute("CircleInsertResult", "존재하지 않는 회원입니다");
			result = "circle/CircleInsertForm";
		}
		return result;
	}
	
	@RequestMapping(value="circleModifyForm", method=RequestMethod.GET)
	public String circleModifyForm(int cNum, Model model) { // 同好会の情報を修正する為のViewに移動するmethod
		model.addAttribute("circleView", cService.circleView(cNum));
		
		return "circle/CircleModifyForm";
	}
	@RequestMapping(value="circleModify", method=RequestMethod.POST)
	public String circleModify(MultipartHttpServletRequest mRequest, Model model) { // 同好会の情報を修正するmethod
		try {
			cService.circleUpdate(mRequest);
			model.addAttribute("circleUpdate", "수정 성공");
		} catch(Exception e) {
			model.addAttribute("circleUpdate", "수정 실패");
		}
		
		return "forward:circleView.do";
	}
	
	@RequestMapping(value="circleDelete", method=RequestMethod.GET)
	public String circleDelete(int cNum, Model model) { // 同好会を消すmethod
		try {
			cService.circleDelete(cNum);
			model.addAttribute("circleUpdate", "삭제 성공");
		} catch(Exception e) {
			model.addAttribute("circleUpdate", "삭제 실패");
		}
		
		return "circle/CircleModifyForm";
	}
	
	@RequestMapping(value="actiAdminList", method=RequestMethod.GET)
	public String actiAdminList(Model model) { // 同好会を活動申請目録を見る管理者ページに関するmethod
		model.addAttribute("actiAdmin", actiService.adminActiList());
		return "reserve/reserveChk";
	}
	
	@RequestMapping(value="actiChk", method=RequestMethod.GET)
	public String actiAdminList(int actiNum, Model model) { // 活動を承認するmethod
		try {
			actiService.activityChk(actiNum);
			model.addAttribute("actiChkResult", "승인완료");
		} catch(Exception e) {
			model.addAttribute("actiChkResult", "승인실패");
		}
		return "forward:actiAdminList.do";
	}
	
	@RequestMapping(value="reserveAdminDelete", method=RequestMethod.GET)
	public String reserveAdminDelete(int actiNum, Model model) { // 活動を承認しないmethod
		try {
			actiService.activityDelete(actiNum);
			model.addAttribute("actiChkResult", "삭제성공");
		} catch(Exception e){
			System.out.println(e.getMessage());
			model.addAttribute("actiChkResult", "삭제실패");
		}
		return "forward:actiAdminList.do";
	}
}
