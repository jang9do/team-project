package com.tj.walb.model;

import java.sql.Timestamp;

public class FunBoard {
	private int funNum;
	private String funTitle;
	private String funCon;
	private Timestamp funStart;
	private Timestamp funEnd;
	private String funIp;
	private int funGold;
	private int funGoal;
	private int cNum;
	private String cName;
	private String cPhoto;
	private String mId;
	private int startRow;
	private int endRow;
	
	public int getFunNum() {
		return funNum;
	}
	public void setFunNum(int funNum) {
		this.funNum = funNum;
	}
	public String getFunTitle() {
		return funTitle;
	}
	public void setFunTitle(String funTitle) {
		this.funTitle = funTitle;
	}
	public String getFunCon() {
		return funCon;
	}
	public void setFunCon(String funCon) {
		this.funCon = funCon;
	}
	public Timestamp getFunStart() {
		return funStart;
	}
	public void setFunStart(Timestamp funStart) {
		this.funStart = funStart;
	}
	public Timestamp getFunEnd() {
		return funEnd;
	}
	public void setFunEnd(Timestamp funEnd) {
		this.funEnd = funEnd;
	}
	public String getFunIp() {
		return funIp;
	}
	public void setFunIp(String funIp) {
		this.funIp = funIp;
	}
	public int getFunGold() {
		return funGold;
	}
	public void setFunGold(int funGold) {
		this.funGold = funGold;
	}
	public int getFunGoal() {
		return funGoal;
	}
	public void setFunGoal(int funGoal) {
		this.funGoal = funGoal;
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
		return "FunBoard [funNum=" + funNum + ", funPhoto=" + ", funTitle=" + funTitle + ", funCon=" + funCon
				+ ", funStart=" + funStart + ", funEnd=" + funEnd + ", funIp=" + funIp + ", funGold=" + funGold
				+ ", funGoal=" + funGoal + ", cNum=" + cNum + ", cName=" + cName + ", mId=" + mId + ", startRow="
				+ startRow + ", endRow=" + endRow + "]";
	}
}
