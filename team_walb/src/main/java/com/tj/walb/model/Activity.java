package com.tj.walb.model;

import java.sql.Timestamp;

//　活動予約のDTO
public class Activity {
	private int actiNum; // 番号
	private int cNum; // 申請した同好会の番号
	private String cName; // 申請した同好会の名前
	private int pNum; // 活動する場所の番号
	private String pName; // 活動する場所の名前
	private String actiTitle; // 活動の題目
	private Timestamp actiDate; // 活動の予定した日
	private int actiTime; // 利用する時間
	private String actiCon; // 活動の内容
	private int actiChk; // 許可の有無
	
	//　GETTER, SETTER
	public int getActiNum() {
		return actiNum;
	}
	public void setActiNum(int actiNum) {
		this.actiNum = actiNum;
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
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getActiTitle() {
		return actiTitle;
	}
	public void setActiTitle(String actiTitle) {
		this.actiTitle = actiTitle;
	}
	public Timestamp getActiDate() {
		return actiDate;
	}
	public void setActiDate(Timestamp actiDate) {
		this.actiDate = actiDate;
	}
	public int getActiTime() {
		return actiTime;
	}
	public void setActiTime(int actiTime) {
		this.actiTime = actiTime;
	}
	public String getActiCon() {
		return actiCon;
	}
	public void setActiCon(String actiCon) {
		this.actiCon = actiCon;
	}
	public int getActiChk() {
		return actiChk;
	}
	public void setActiChk(int actiChk) {
		this.actiChk = actiChk;
	}
	
	@Override
	public String toString() {
		return "Activity [actiNum=" + actiNum + ", cNum=" + cNum + ", cName=" + cName + ", pNum=" + pNum + ", pName="
				+ pName + ", actiTitle=" + actiTitle + ", actiDate=" + actiDate + ", actiTime=" + actiTime
				+ ", actiCon=" + actiCon + ", actiChk=" + actiChk + "]";
	}
}
