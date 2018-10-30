package com.tj.walb.dao;

import java.util.List;

import com.tj.walb.model.Gboard;

//　公知に関するDAO　INTERFACE
public interface GboardDao {
	public List<Gboard> gboardList(int startRow, int endRow); // 公知掲示物のリストを貰う
	public int gboardInsert(Gboard gboard); // 公知掲示物を登録する
	public int gboardModify(Gboard gboard); // 公知掲示物のを修正する
	public int gboardDelete(int gNum); // 公知掲示物の削除する
	public Gboard gboardView(int gNum); // 公知掲示物の詳細内容を見る
	public int totCnt(); // 公知掲示物の総数を計算する
}
