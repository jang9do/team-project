package com.tj.walb.model;

import java.sql.Timestamp;

public class Message {
	private long mesNum;		//쪽지 번호
	private String mesTo;		//받는 사람
	private String mesFrom;		//보내는 사람
	private String mesTitle;	//쪽지 제목
	private String mesContent;	//쪽지 내용
	private Timestamp mesDate;	//쪽지 발송일
	private int mesChk;			//쪽지 확인 여부
	private String mName;		//보낸 사람 이름
	private int startRow;		
	private int endRow;
	public long getMesNum() {
		return mesNum;
	}
	public void setMesNum(long mesNum) {
		this.mesNum = mesNum;
	}
	public String getMesTo() {
		return mesTo;
	}
	public void setMesTo(String mesTo) {
		this.mesTo = mesTo;
	}
	public String getMesFrom() {
		return mesFrom;
	}
	public void setMesFrom(String mesFrom) {
		this.mesFrom = mesFrom;
	}
	public String getMesTitle() {
		return mesTitle;
	}
	public void setMesTitle(String mesTitle) {
		this.mesTitle = mesTitle;
	}
	public String getMesContent() {
		return mesContent;
	}
	public void setMesContent(String mesContent) {
		this.mesContent = mesContent;
	}
	public Timestamp getMesDate() {
		return mesDate;
	}
	public void setMesDate(Timestamp mesDate) {
		this.mesDate = mesDate;
	}
	public int getMesChk() {
		return mesChk;
	}
	public void setMesChk(int mesChk) {
		this.mesChk = mesChk;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	@Override
	public String toString() {
		return "Message [mesNum=" + mesNum + ", mesTo=" + mesTo + ", mesFrom=" + mesFrom + ", mesTitle=" + mesTitle
				+ ", mesContent=" + mesContent + ", mesDate=" + mesDate + ", mesChk=" + mesChk + ", mName=" + mName
				+ ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
