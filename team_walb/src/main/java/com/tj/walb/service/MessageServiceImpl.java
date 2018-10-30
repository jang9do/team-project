package com.tj.walb.service;

import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.walb.dao.MessageDao;
import com.tj.walb.model.Message;
@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao msgdao;
	
	@Override
	public int msgSend(Message message) {
		return msgdao.msgSend(message);
	}

	@Override
	public int msgReceiveCnt(String mesTo) {
		return msgdao.msgReceiveCnt(mesTo);
	}

	@Override
	public int msgSendCnt(String mesFrom) {
		return msgdao.msgSendCnt(mesFrom);
	}

	@Override
	public int msgNoreadCnt(String mesTo) {
		return msgdao.msgNoreadCnt(mesTo);
	}

	@Override
	public List<Message> msgReceiveList(Message message) {
		return msgdao.msgReceiveList(message);
	}

	@Override
	public List<Message> newMsgList(Message message) {
		return msgdao.newMsgList(message);
	}
	
	@Override
	public List<Message> msgSendList(Message message) {
		return msgdao.msgSendList(message);
	}

	@Override
	public Message msgReading(long mesNum) {
		return msgdao.msgReading(mesNum);
	}

	@Override
	public int msgChk(long mesNum) {
		return msgdao.msgChk(mesNum);
	}

	@Override
	public int msgDelete(String mesNums) {
		StringTokenizer delNum = new StringTokenizer(mesNums, "-");
		long[] delNums= new long[delNum.countTokens()];
		int idx = 0;
		while(delNum.hasMoreTokens()) {
			delNums[idx] = Long.valueOf(delNum.nextToken()); 
			idx++;
		}
		for(int i=0 ; i<delNums.length ; i++) {
			msgdao.msgDelete(delNums[i]);			
		}
		return 1;
	}
	
	@Override
	public int msgChkNum(String mesTo) {
		return msgdao.msgChkNum(mesTo);
	}

	@Override
	public int msgSpCnt(Message message) {
		return msgdao.msgSpCnt(message);
	}

	@Override
	public List<Message> msgSpList(Message message) {
		return msgdao.msgSpList(message);
	}
}
