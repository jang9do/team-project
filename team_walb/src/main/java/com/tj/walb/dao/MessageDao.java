package com.tj.walb.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tj.walb.model.Message;

public interface MessageDao {
	public int msgSend(Message message);			//쪽지 발송
	public int msgReceiveCnt(String mesTo);			//받은 쪽지 수
	public int msgSpCnt(Message message);			//특정인과 주고받은 쪽지 수
	public int msgSendCnt(String mesFrom);			//보낸 쪽지 수
	public int msgNoreadCnt(String mesTo);			//안읽은 쪽지 수
	public List<Message> msgReceiveList(Message message);	//받은 쪽지함
	public List<Message> newMsgList(Message message);		//안읽은 쪽지 list
	public List<Message> msgSpList(Message message);		//특정인과 주고받은 쪽지 리스트
	public List<Message> msgSendList(Message message);		//보낸 쪽지함
	public Message msgReading(long mesNum);			//쪽지 상세보기
	public int msgChk(long mesNum);					//쪽지 읽음처리
	public int msgDelete(long delNum);				//쪽지 삭제
	public int msgChkNum(String mesTo);
}
