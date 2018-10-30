package com.tj.walb.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.walb.model.Gboard;

//　公知に関するService　INTERFACE
public interface GboardService {
	public List<Gboard> notice10(); //　最新の公知上位１０個を貰う
	public List<Gboard> gboardList(int startRow, int endRow); // 公知掲示物のリストを貰う
	public int gboardInsert(MultipartHttpServletRequest mRequest); // 公知掲示物を登録する
	public int gboardModify(MultipartHttpServletRequest mRequest, Gboard gboard); // 公知掲示物のを修正する
	public int gboardDelete(int gNum); // 公知掲示物の削除する
	public Gboard gboardView(int gNum); // 公知掲示物の詳細内容を見る
	public int totCnt(); // 公知掲示物の総数を計算する
}
