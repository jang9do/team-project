package com.tj.walb.model;

import java.sql.Date;

public class Bboard {
	private int bNum;	//번개번호
	private int cNum;	//해당 동아리 번호
	private String bTitle;	//번개 모임 제목
	private String bContent;//번개 모임 내용
	private Date bStart;	//등록일
	private String bEnd;		//마감일
	private int bCount;		//신청수
	private int bPeople;	//최소인원
	private int bActi;		//활성화 >> 종료후 1
	
	private int startRow;	 //출력 시작번호
	private int endRow;		 //출력 끝번호
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Date getbStart() {
		return bStart;
	}
	public void setbStart(Date bStart) {
		this.bStart = bStart;
	}
	public String getbEnd() {
		return bEnd;
	}
	public void setbEnd(String bEnd) {
		this.bEnd = bEnd;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	public int getbPeople() {
		return bPeople;
	}
	public void setbPeople(int bPeople) {
		this.bPeople = bPeople;
	}
	public int getbActi() {
		return bActi;
	}
	public void setbActi(int bActi) {
		this.bActi = bActi;
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
		return "Bboard [bNum=" + bNum + ", cNum=" + cNum + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bStart="
				+ bStart + ", bEnd=" + bEnd + ", bCount=" + bCount + ", bPeople=" + bPeople + ", bActi=" + bActi
				+ ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
