package com.tj.walb.model;

import java.sql.Date;

public class MemberDept {
	//Member
	private String mId;  //아이디
	private String mPw;  //비번
	private String mName;  //이름
	private Date mBirth;  //생년월일
	private String mPhoto;  //프로필사진
	private int lNo; // 계급번호
	private String mCircle1; //동아리 번호
	private String mCircle2; //동아리 번호
	private String mCircle3; //동아리 번호
	private Date mJoin;  //가입일
	private Date mHire;  //입사일
	private int mOut;  //탈퇴여부
	
	//DEPT
	private int deptNo; //부서번호
	private String dName; //부서이름
	private String dLoc; //부서위치
	
	public MemberDept(){}
	public MemberDept(String mId, String mPw, String mName, Date mBirth, String mPhoto, int lNo, String mCircle1,
			String mCircle2, String mCircle3, Date mJoin, Date mHire, int mOut, int deptNo, String dName, String dLoc) {
		super();
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mBirth = mBirth;
		this.mPhoto = mPhoto;
		this.lNo = lNo;
		this.mCircle1 = mCircle1;
		this.mCircle2 = mCircle2;
		this.mCircle3 = mCircle3;
		this.mJoin = mJoin;
		this.mHire = mHire;
		this.mOut = mOut;
		this.deptNo = deptNo;
		this.dName = dName;
		this.dLoc = dLoc;
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
	public String getmCircle1() {
		return mCircle1;
	}
	public void setmCircle1(String mCircle1) {
		this.mCircle1 = mCircle1;
	}
	public String getmCircle2() {
		return mCircle2;
	}
	public void setmCircle2(String mCircle2) {
		this.mCircle2 = mCircle2;
	}
	public String getmCircle3() {
		return mCircle3;
	}
	public void setmCircle3(String mCircle3) {
		this.mCircle3 = mCircle3;
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
	public int getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getdLoc() {
		return dLoc;
	}
	public void setdLoc(String dLoc) {
		this.dLoc = dLoc;
	}
	@Override
	public String toString() {
		return "MemberDept [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mBirth=" + mBirth + ", mPhoto="
				+ mPhoto + ", lNo=" + lNo + ", mCircle1=" + mCircle1 + ", mCircle2=" + mCircle2 + ", mCircle3="
				+ mCircle3 + ", mJoin=" + mJoin + ", mHire=" + mHire + ", mOut=" + mOut + ", deptNo=" + deptNo
				+ ", dName=" + dName + ", dLoc=" + dLoc + "]";
	}
	
}
