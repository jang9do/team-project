package com.tj.walb.dao;

import java.util.List;

import com.tj.walb.model.CircleMember;
import com.tj.walb.model.Member;

public interface MemberDao {
	public Member getMember(String mId);
	public int idConfirm(String mId);
	public int modifyMember(Member member);
	public int joinMember(Member member);
	public int secession(Member member);
	public List<Member> memberList(Member member);
	public int total(Member member);
	public int circleJoin(Member member);
	public int circleOut(Member member);
	public CircleMember mIdCircleList(String mId);
	public List<Member> circleMemberList(int cNum);
}
