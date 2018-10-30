package com.tj.walb.model;

//　同好会のDTO
public class Circle {
	private int cNum; // 番号
	private String cName; // 同好会の名前
	private String mId; // 同好会の管理者に該当する会員のID
	private String cContent; // 同好会の説明
	private String cTime; // 定期活動の曜日
	private int cHit; // 同好会のクリックの数（同好会のランキングに必要）
	private String cPhoto; // 同好会のプロフィール写真
	private int startRow; // PAGINGに必要なSTART番号
	private int endRow; // PAGINGに必要なEND番号
	
	//　GETTER, SETTER
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
	public String getcPhoto() {
		return cPhoto;
	}
	public void setcPhoto(String cPhoto) {
		this.cPhoto = cPhoto;
	}
	
	@Override
	public String toString() {
		return "Circle [cNum=" + cNum + ", cName=" + cName + ", mId=" + mId + ", cContent=" + cContent + ", cTime="
				+ cTime + ", cHit=" + cHit + ", cPhoto=" + cPhoto + ", startRow=" + startRow + ", endRow=" + endRow
				+ "]";
	}
}
