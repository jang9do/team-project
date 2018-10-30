package com.tj.walb.model;

import java.sql.Date;

public class Fboard {
	private int fNum;			// 게시번호
	private String mId;			// 작성자
	private String mName;
	private String fTitle;		// 제목
	private String fContent;	// 내용
	private String fIp;			// ip
	private Date fDate;			// 작성일
	private int fGroup;			// 그룹
	private int fStep;			// 그룹순서
	private int fIndent;		// 들여쓰기
	private int cNum;			// 동아리번호
	private int startRow;		// 페이징1
	private int endRow;			// 페이징2
	public int getfNum() {
		return fNum;
	}
	public void setfNum(int fNum) {
		this.fNum = fNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getfTitle() {
		return fTitle;
	}
	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}
	public String getfContent() {
		return fContent;
	}
	public void setfContent(String fContent) {
		this.fContent = fContent;
	}
	public String getfIp() {
		return fIp;
	}
	public void setfIp(String fIp) {
		this.fIp = fIp;
	}
	public Date getfDate() {
		return fDate;
	}
	public void setfDate(Date fDate) {
		this.fDate = fDate;
	}
	public int getfGroup() {
		return fGroup;
	}
	public void setfGroup(int fGroup) {
		this.fGroup = fGroup;
	}
	public int getfStep() {
		return fStep;
	}
	public void setfStep(int fStep) {
		this.fStep = fStep;
	}
	public int getfIndent() {
		return fIndent;
	}
	public void setfIndent(int fIndent) {
		this.fIndent = fIndent;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
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
		return "Fboard [fNum=" + fNum + ", mId=" + mId + ", mName=" + mName + ", fTitle=" + fTitle + ", fContent="
				+ fContent + ", fIp=" + fIp + ", fDate=" + fDate + ", fGroup=" + fGroup + ", fStep=" + fStep
				+ ", fIndent=" + fIndent + ", cNum=" + cNum + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
