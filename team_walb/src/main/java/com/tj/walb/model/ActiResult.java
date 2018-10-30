package com.tj.walb.model;

import java.sql.Timestamp;

//　　活動結果のDTO
public class ActiResult {
	private int arNum; // 番号
	private int pNum; // 活動した場所の番号
	private String pName; // 活動した場所の名前
	private int cNum; // 活動した同好会の番号
	private String cName; // 活動した同好会の名前
	private String arTitle; // 活動の題目
	private Timestamp arDate; // 活動した日
	private String arCon; // 活動の内容
	private int arResult; // 活動結果
	private int aNum; // 後期を作成した場合の後期番号
	
	//　GETTER, SETTER
	public int getArNum() {
		return arNum;
	}
	public void setArNum(int arNum) {
		this.arNum = arNum;
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
	public String getArTitle() {
		return arTitle;
	}
	public void setArTitle(String arTitle) {
		this.arTitle = arTitle;
	}
	public Timestamp getArDate() {
		return arDate;
	}
	public void setArDate(Timestamp arDate) {
		this.arDate = arDate;
	}
	public String getArCon() {
		return arCon;
	}
	public void setArCon(String arCon) {
		this.arCon = arCon;
	}
	public int getArResult() {
		return arResult;
	}
	public void setArResult(int arResult) {
		this.arResult = arResult;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	
	@Override
	public String toString() {
		return "ActiResult [arNum=" + arNum + ", pNum=" + pNum + ", pName=" + pName + ", cNum=" + cNum + ", cName="
				+ cName + ", arTitle=" + arTitle + ", arDate=" + arDate + ", arCon=" + arCon + ", arResult=" + arResult
				+ ", aNum=" + aNum + "]";
	}
}
