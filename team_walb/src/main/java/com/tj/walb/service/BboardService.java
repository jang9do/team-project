package com.tj.walb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tj.walb.model.Bboard;
import com.tj.walb.model.BboardBunApply;
import com.tj.walb.model.BboardCircle;
import com.tj.walb.model.BunApply;
import com.tj.walb.model.FileUploadVO;

public interface BboardService {
	public void disActi();
	
	public int insertBboard(Bboard bboard);
	public int modifyBboard(Model model,Bboard bboard);
	public BboardCircle viewBboard(int bNum);
	public int bunapplyChk(BunApply bunapply);
	public int participateBboard(int bNum);
	public int addBunapply(BunApply bunapply);
	public int cancleBunapply(BunApply bunapply);
	public int minusBboard(int bNum);
	
	public List<BboardBunApply> myBunListAll(BboardBunApply bboardBun);
	public int totCntmyBunListAll(String mId);
	
	public List<BboardCircle> bungae3();
	public List<BboardCircle> bboardListAll(BboardCircle bCircle);
	public List<BboardCircle> bboardListIng(BboardCircle bCircle);
	public List<BboardCircle> bboardListPopular(BboardCircle bCircle);
	public int totCntBboardAll();
	public int totCntBboardIng();
	public int getBnumAfterInsert(int cNum);
	
	public FileUploadVO fileUpload(FileUploadVO fileUploadVO, HttpServletRequest request);

}
