package com.tj.walb.model;

import java.sql.Date;

public class BboardCircle {
	private int bNum;	//번개번호
	private int cNum;	//해당 동아리 번호
	private String bTitle;	//번개 모임 제목
	private String bContent;//번개 모임 내용
	private Date bStart;	//등록일
	private String bEnd;		//마감일
	private int bCount;		//신청수
	private int bPeople;	//최소인원
	private int bActi;		//활성화 >> 종료후 1
	
	private int hour; // 마감임박 시간
	
	private String cPhoto;	 //동아리 대표이미지
	private String cName;	 //동아리 이름
	private String mId; 	 //동아리장
	private String cContent; //동아리설명
	private String cTime; 	 //동아리 정기 활동 요일(시간)
	private int cHit; 		 //조회수
	
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
	public int getHour() {
		return hour;
	}
	public void setHour(int hour) {
		this.hour = hour;
	}
	public String getcPhoto() {
		return cPhoto;
	}
	public void setcPhoto(String cPhoto) {
		this.cPhoto = cPhoto;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcTime() {
		return cTime;
	}
	public void setcTime(String cTime) {
		this.cTime = cTime;
	}
	public int getcHit() {
		return cHit;
	}
	public void setcHit(int cHit) {
		this.cHit = cHit;
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
		return "BboardCircle [bNum=" + bNum + ", cNum=" + cNum + ", bTitle=" + bTitle + ", bContent=" + bContent
				+ ", bStart=" + bStart + ", bEnd=" + bEnd + ", bCount=" + bCount + ", bPeople=" + bPeople + ", bActi="
				+ bActi + ", hour=" + hour + ", cPhoto=" + cPhoto + ", cName=" + cName + ", mId=" + mId + ", cContent="
				+ cContent + ", cTime=" + cTime + ", cHit=" + cHit + ", startRow=" + startRow + ", endRow=" + endRow
				+ "]";
	}
	
	
	
	
	
	}
