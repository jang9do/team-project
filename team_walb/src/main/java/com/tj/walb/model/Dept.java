package com.tj.walb.model;

public class Dept {
	private int deptNo;
	private String dName;
	private String dLoc;
	
	public Dept(){}

	public Dept(int deptNo, String dName, String dLoc) {
		super();
		this.deptNo = deptNo;
		this.dName = dName;
		this.dLoc = dLoc;
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
		return "Dept [deptNo=" + deptNo + ", dName=" + dName + ", dLoc=" + dLoc + "]";
	}
	
	

}
