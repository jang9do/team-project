package com.tj.walb.model;

//　活動に関する場所のDTO
public class Place {
	private int pNum; // 場所の番号
	private String pName; // 場所の名前
	private String pLoc; // 場所の詳細住所
	private String pPhoto; // 場所の写真
	
	//　GETTER, SETTER
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
	public String getpLoc() {
		return pLoc;
	}
	public void setpLoc(String pLoc) {
		this.pLoc = pLoc;
	}
	public String getpPhoto() {
		return pPhoto;
	}
	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}
	
	@Override
	public String toString() {
		return "Place [pNum=" + pNum + ", pName=" + pName + ", pLoc=" + pLoc + ", pPhoto=" + pPhoto + "]";
	}
}
