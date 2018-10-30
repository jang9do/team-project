package com.tj.walb.model;

import java.sql.Timestamp;

//　公知掲示板のDTO
public class Gboard {
	private int gNum;		//공지번호　公知番号
	private String mId; 	//작성자　登録した管理者のID
	private String gTitle;	//공지글 제목　公知の題目
	private String gContent;	//　公知の内容
	private String gIp;		//공지글 작성 IP　公知を作成した場所のIP
	private Timestamp gDate;//공지글 등록일　公知の登録した日
	private String gFile;	//첨부파일　公知に添付されているファイルの名前（ないならNULLになる）
	
	private int startRow;	 //출력 시작번호　PAGINGに必要なSTART番号
	private int endRow;		 //출력 끝번호　PAGINGに必要なEND番号

	//　GETTER, SETTER
	public String getgContent() {
		return gContent;
	}
	public void setgContent(String gContent) {
		this.gContent = gContent;
	}
	public int getgNum() {
		return gNum;
	}
	public void setgNum(int gNum) {
		this.gNum = gNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getgTitle() {
		return gTitle;
	}
	public void setgTitle(String gTitle) {
		this.gTitle = gTitle;
	}
	public String getgIp() {
		return gIp;
	}
	public void setgIp(String gIp) {
		this.gIp = gIp;
	}
	public Timestamp getgDate() {
		return gDate;
	}
	public void setgDate(Timestamp gDate) {
		this.gDate = gDate;
	}
	public String getgFile() {
		return gFile;
	}
	public void setgFile(String gFile) {
		this.gFile = gFile;
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
		return "Gboard [gNum=" + gNum + ", mId=" + mId + ", gTitle=" + gTitle + ", gContent=" + gContent + ", gIp="
				+ gIp + ", gDate=" + gDate + ", gFile=" + gFile + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
}
