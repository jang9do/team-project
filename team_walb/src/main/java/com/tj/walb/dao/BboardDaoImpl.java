package com.tj.walb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.Bboard;
import com.tj.walb.model.BboardBunApply;
import com.tj.walb.model.BboardCircle;
import com.tj.walb.model.BunApply;

@Repository
public class BboardDaoImpl implements BboardDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	// 번개모임 마감시간 완료 처리
	@Override
	public void disActi() {
		sessionTemplate.update("disActi");		
	}
	
	
	@Override
	public List<BboardCircle> bungae3() {
		/*System.out.println("DAO 들어왔어");
		System.out.println("쿼리 돌려 가져온 값"+sessionTemplate.selectList("bungae3"));*/
		return sessionTemplate.selectList("bungae3");
	}
	@Override
	public int insertBboard(Bboard bboard) {
		return sessionTemplate.insert("insertBboard", bboard);
	}
	@Override
	public int modifyBboard(Bboard bboard) {
		return sessionTemplate.update("modifyBboard", bboard);
	}
	@Override
	public BboardCircle viewBboard(int bNum) {
		return sessionTemplate.selectOne("viewBboard", bNum);
	}
	// 번개 참여 중복 확인
	@Override
	public int bunapplyChk(BunApply bunapply) {
		return sessionTemplate.selectOne("bunapplyChk", bunapply);
	}
	@Override
	public int participateBboard(int bNum) {
		return sessionTemplate.insert("participateBboard", bNum);
	}
	@Override
	public int addBunapply(BunApply bunapply) {
		return sessionTemplate.insert("addBunapply", bunapply);
	}

	
	//번개 참여 취소
	@Override
	public int cancleBunapply(BunApply bunapply) {
		return sessionTemplate.delete("cancleBunapply", bunapply);
	}
	@Override
	public int minusBboard(int bNum) {
		return sessionTemplate.update("minusBboard", bNum);
	}
	
	//리스트 출력
	@Override
	public List<BboardCircle> bboardListAll(BboardCircle bCircle) {
		return sessionTemplate.selectList("bboardListAll", bCircle);
	}
	@Override
	public List<BboardCircle> bboardListPopular(BboardCircle bCircle) {
		return sessionTemplate.selectList("bboardListPopular", bCircle);
	}
	@Override
	public List<BboardCircle> bboardListIng(BboardCircle bCircle) {
		return sessionTemplate.selectList("bboardListIng", bCircle);
	}
	//글 전체개수
	@Override
	public int totCntBboardAll() {
		return sessionTemplate.selectOne("totCntBboardAll");
	}
	@Override
	public int totCntBboardIng() {
		return sessionTemplate.selectOne("totCntBboardIng");
	}
	@Override
	public int getBnumAfterInsert(int cNum) { // 번개 활동 신청후 작성자 참여시키기
		return sessionTemplate.selectOne("getBnumAfterInsert", cNum);
	}
	
	
	//나의 번개 목록
	@Override
	public List<BboardBunApply> myBunListAll(BboardBunApply bboardBun) {
		return sessionTemplate.selectList("myBunListAll", bboardBun);
	}
	@Override
	public int totCntmyBunListAll(String mId) {		
		return sessionTemplate.selectOne("totCntmyBunListAll", mId);
	}
	


}
