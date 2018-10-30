package com.tj.walb.model;

import java.sql.Date;

public class Member {
	private String mId;  //아이디 
	private String mPw;  //비번
	private String mName;  //이름 
	private Date mBirth;  //생년월일 
	private String mPhoto;  //프로필사진 
	private int lNo;  //계급번호 
	private int deptNo;  //부서번호 
	private Date mJoin;  //가입일 
	private Date mHire;  //입사일 
	private int mOut;  //탈퇴여부 
	private int mCircle1;  //동아리 번호1 
	private int mCircle2;  //동아리 번호2
	private int mCircle3;  //동아리 번호3
	private int startRow;  //paging
	private int endRow;    //paging
	private String schItem; // mId나 mName
	private String schWord; // 검색단어
	
	public Member(){}
	
	public Member(String mId, String mPw) {
		this.mId = mId;
		this.mPw = mPw;
	}
	public Member(String mId, String mPw, String mName, Date mBirth, String mPhoto, int lNo, int deptNo, Date mJoin,
			Date mHire, int mOut, int mCircle1, int mCircle2, int mCircle3, int startRow, int endRow) {
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mBirth = mBirth;
		this.mPhoto = mPhoto;
		this.lNo = lNo;
		this.deptNo = deptNo;
		this.mJoin = mJoin;
		this.mHire = mHire;
		this.mOut = mOut;
		this.mCircle1 = mCircle1;
		this.mCircle2 = mCircle2;
		this.mCircle3 = mCircle3;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public Date getmBirth() {
		return mBirth;
	}

	public void setmBirth(Date mBirth) {
		this.mBirth = mBirth;
	}

	public String getmPhoto() {
		return mPhoto;
	}

	public void setmPhoto(String mPhoto) {
		this.mPhoto = mPhoto;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public Date getmJoin() {
		return mJoin;
	}

	public void setmJoin(Date mJoin) {
		this.mJoin = mJoin;
	}

	public Date getmHire() {
		return mHire;
	}

	public void setmHire(Date mHire) {
		this.mHire = mHire;
	}

	public int getmOut() {
		return mOut;
	}

	public void setmOut(int mOut) {
		this.mOut = mOut;
	}

	public int getmCircle1() {
		return mCircle1;
	}

	public void setmCircle1(int mCircle1) {
		this.mCircle1 = mCircle1;
	}

	public int getmCircle2() {
		return mCircle2;
	}

	public void setmCircle2(int mCircle2) {
		this.mCircle2 = mCircle2;
	}

	public int getmCircle3() {
		return mCircle3;
	}

	public void setmCircle3(int mCircle3) {
		this.mCircle3 = mCircle3;
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

	public String getSchItem() {
		return schItem;
	}


	public void setSchItem(String schItem) {
		this.schItem = schItem;
	}


	public String getSchWord() {
		return schWord;
	}


	public void setSchWord(String schWord) {
		this.schWord = schWord;
	}


	@Override
	public String toString() {
		return "Member [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mBirth=" + mBirth + ", mPhoto=" + mPhoto
				+ ", lNo=" + lNo + ", deptNo=" + deptNo + ", mJoin=" + mJoin + ", mHire=" + mHire + ", mOut=" + mOut
				+ ", mCircle1=" + mCircle1 + ", mCircle2=" + mCircle2 + ", mCircle3=" + mCircle3 + ", startRow="
				+ startRow + ", endRow=" + endRow + ", getmId()=" + getmId() + ", getmPw()=" + getmPw()
				+ ", getmName()=" + getmName() + ", getmBirth()=" + getmBirth() + ", getmPhoto()=" + getmPhoto()
				+ ", getlNo()=" + getlNo() + ", getDeptNo()=" + getDeptNo() + ", getmJoin()=" + getmJoin()
				+ ", getmHire()=" + getmHire() + ", getmOut()=" + getmOut() + ", getmCircle1()=" + getmCircle1()
				+ ", getmCircle2()=" + getmCircle2() + ", getmCircle3()=" + getmCircle3() + ", getStartRow()="
				+ getStartRow() + ", getEndRow()=" + getEndRow() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
