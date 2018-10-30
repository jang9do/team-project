package com.tj.walb.model;

public class BunApply {
	private int bunNum;
	private int bNum;
	private String mId;
	
	
	public int getBunNum() {
		return bunNum;
	}
	public void setBunNum(int bunNum) {
		this.bunNum = bunNum;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	
	@Override
	public String toString() {
		return "BunApply [bunNum=" + bunNum + ", bNum=" + bNum + ", mId=" + mId + "]";
	}
}
