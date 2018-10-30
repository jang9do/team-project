package com.tj.walb.model;

import java.sql.Timestamp;

//　後期の掲示板DTO
public class ABoard {
	private int aNum; // 掲示物の番号
	private int cNum; // 掲示物の作成した同好会の番号
	private String cName; // 掲示物の作成した同好会の名前
	private String mId; // 掲示物の作成した会員のID
	private String aTitle; // 掲示物の題目
	private Timestamp aDate; // 掲示物を登録した日
	private Timestamp bDate; // 同好会の活動をした日
	private String aContent; // 後期の内容
	private String aIp; // 掲示物を登録した場所のIP
	private double aScore; // 掲示物の評点
	private int startRow; // 掲示板のPAGINGに必要なSTART番号
	private int endRow; // 掲示板のPAGINGに必要なEND番号
	private String cPhoto; // 掲示板のPAGINGに必要なEND番号
	
	//　GETTER, SETTER
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
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
	public String getaTitle() {
		return aTitle;
	}
	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}
	public Timestamp getaDate() {
		return aDate;
	}
	public void setaDate(Timestamp aDate) {
		this.aDate = aDate;
	}
	public Timestamp getbDate() {
		return bDate;
	}
	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getaIp() {
		return aIp;
	}
	public void setaIp(String aIp) {
		this.aIp = aIp;
	}
	public double getaScore() {
		return aScore;
	}
	public void setaScore(double aScore) {
		this.aScore = aScore;
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
	public String getcPhoto() {
		return cPhoto;
	}
	public void setcPhoto(String cPhoto) {
		this.cPhoto = cPhoto;
	}
	
	@Override
	public String toString() {
		return "ABoard [aNum=" + aNum + ", cNum=" + cNum + ", cName=" + cName + ", mId=" + mId + ", aTitle=" + aTitle
				+ ", aDate=" + aDate + ", bDate=" + bDate + ", aContent=" + aContent + ", aIp=" + aIp + ", aScore="
				+ aScore + ", startRow=" + startRow + ", endRow=" + endRow + ", cPhoto=" + cPhoto + "]";
	}
}
