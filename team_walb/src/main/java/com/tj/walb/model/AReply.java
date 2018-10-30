package com.tj.walb.model;

import java.sql.Timestamp;

//　後期のCOMMENTのDTO
public class AReply {
	private int reNum; // 番号
	private String mId; // commentを登録した会員の名前
	private int aNum; // commentが登録している後期掲示物の番号
	private String reContent; // commentの内容
	private Timestamp reDate; // commentを登録した日
	private double reScore; // 活動に関して会員が与える点数
	
	//　GETTER, SETTER
	public int getReNum() {
		return reNum;
	}
	public void setReNum(int reNum) {
		this.reNum = reNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public Timestamp getReDate() {
		return reDate;
	}
	public void setReDate(Timestamp reDate) {
		this.reDate = reDate;
	}
	public double getReScore() {
		return reScore;
	}
	public void setReScore(double reScore) {
		this.reScore = reScore;
	}
	
	@Override
	public String toString() {
		return "AReply [reNum=" + reNum + ", mId=" + mId + ", aNum=" + aNum + ", reContent=" + reContent + ", reDate="
				+ reDate + ", reScore=" + reScore + "]";
	}
}
