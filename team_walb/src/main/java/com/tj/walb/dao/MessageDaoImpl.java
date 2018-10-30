package com.tj.walb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.Message;
@Repository
public class MessageDaoImpl implements MessageDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	//쪽지 발송
	@Override
	public int msgSend(Message message) {
		return sessionTemplate.update("msgSend", message);
	}

	//받은 쪽지 수
	@Override
	public int msgReceiveCnt(String mesTo) {
		return sessionTemplate.selectOne("msgReceiveCnt", mesTo);
	}

	//보낸 쪽지 수
	@Override
	public int msgSendCnt(String mesFrom) {
		return sessionTemplate.selectOne("msgSendCnt", mesFrom);
	}

	//안읽은 쪽지 수
	@Override
	public int msgNoreadCnt(String mesTo) {
		return sessionTemplate.selectOne("msgNoreadCnt",mesTo);
	}

	//받은 쪽지 list
	@Override
	public List<Message> msgReceiveList(Message message) {
		return sessionTemplate.selectList("msgReceiveList", message);
	}

	//안읽은 쪽지 list
	@Override
	public List<Message> newMsgList(Message message) {
		return sessionTemplate.selectList("newMsgList",message);
	}
	
	//보낸 쪽지 list
	@Override
	public List<Message> msgSendList(Message message) {
		return sessionTemplate.selectList("msgSendList", message);
	}
	
	//특정인과 주고받은 쪽지 수
	@Override
	public int msgSpCnt(Message message) {
		System.out.println(message.toString());
		System.out.println(sessionTemplate==null? "null야":"null아냐");
		return sessionTemplate.selectOne("msgSpCnt",message);
	}

	//특정인과 주고받은 쪽지 목록
	@Override
	public List<Message> msgSpList(Message message) {
		return sessionTemplate.selectList("msgSpList", message);
	}
	
	//쪽지 상세보기
	@Override
	public Message msgReading(long mesNum) {
		return sessionTemplate.selectOne("msgReading", mesNum);
	}

	//쪽지 읽음처리
	@Override
	public int msgChk(long mesNum) {
		return sessionTemplate.update("msgChk", mesNum);
	}

	//쪽지 삭제
	@Override
	public int msgDelete(long delNum) {
		return sessionTemplate.update("msgDelete", delNum);
	}

	
	@Override
	public int msgChkNum(String mesTo) {
		return sessionTemplate.selectOne("msgChkNum", mesTo);
	}
}
