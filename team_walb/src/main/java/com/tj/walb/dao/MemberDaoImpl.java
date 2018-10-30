package com.tj.walb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.CircleMember;
import com.tj.walb.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public Member getMember(String mId) {// 가져옴
		return sessionTemplate.selectOne("getMember", mId);
	}

	@Override
	public int idConfirm(String mId) {// id확인
		return sessionTemplate.selectOne("idConfirm", mId);
	}

	@Override
	public int joinMember(Member member) {// 회원가입
		return sessionTemplate.insert("joinMember", member);
	}

	@Override
	public int modifyMember(Member member) {// 회원수정
		return sessionTemplate.update("modifyMember", member);
	}

	@Override
	public int secession(Member member) {// 회원탈퇴
		return sessionTemplate.update("secession", member);
	}

	@Override
	public List<Member> memberList(Member member) { // 회원리스트 출력
		return sessionTemplate.selectList("memberList", member);
	}

	@Override
	public int total(Member member) {
		return sessionTemplate.selectOne("total", member);
	}

	@Override
	public int circleJoin(Member member) {
		return sessionTemplate.update("memberCircleJoin", member);
	}

	@Override
	public int circleOut(Member member) {
		return sessionTemplate.update("memberCircleOut", member);
	}
	@Override
	public CircleMember mIdCircleList(String mId) {
		return sessionTemplate.selectOne("mIdCircleList", mId);
	}

	@Override
	public List<Member> circleMemberList(int cNum) {
		return sessionTemplate.selectList("circleMemberList", cNum);
	}

}
