package com.tj.walb.service;

//　PAZINGに必要な機能
public class Paging {
	private int currentPage = 1; //　現在のPAGE
	private int pageSize; //　画面に表示するPAGEの数
	private int blockSize; //　画面に表示する掲示物の数
	private int startRow; //　画面に表示する最初のPAGE
	private int endRow; //　画面に表示する最後のPAGE
	private int startPage; //　画面に表示する最初の掲示物
	private int endPage; //　画面に表示する最後の掲示物
	private int total; //　掲示物の全体数
	private int pageCnt; //　全体のPAGE数
	public Paging(int total, String pageNum, int pageSize, int blockSize) {
		this.total = total;
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		startRow = (currentPage-1) * pageSize + 1;
		endRow = startRow + pageSize -1;
		pageCnt = (int)Math.ceil((double)total/pageSize);
		startPage = ((currentPage-1)/blockSize)*blockSize+1;
		//startPage = currentPage - (currentPage-1) % blockSize;
		endPage = startPage+blockSize-1;
		if(endPage>pageCnt)
			endPage = pageCnt;
	}
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
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
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
}
