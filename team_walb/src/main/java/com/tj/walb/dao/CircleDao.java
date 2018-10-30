package com.tj.walb.dao;

import java.util.List;

import com.tj.walb.model.Circle;

//　同好会に関するDAO　INTERFACE
public interface CircleDao {
	public int cirInsert(Circle circle); // 新たな同好会を登録する
	public Circle circleView(int cNum); // 同好会の詳細説明を見る
	public int circleUpdate(Circle circle); // 活動の情報を修正する
	public int circleDelete(int cNum); // 同好会を削除する
	public List<Circle> circleList(int startRow, int endRow); // 同好会のリストを貰う
	public List<Circle> circleTop3(); // HIT数が上位三つの同好会のリストを貰う
	public Circle circleTop(); // HIT数が一番多い同好会の情報を貰う
	public int circleHit(int cNum); // 同好会のHIT数を上がる
	public int totCnt(); // 同好会の全ての数を計算する（PAGING)
	public int searchTotCnt(Circle circle); // 検索結果で出た同好会の全ての数を計算する（PAGING)
	public List<Circle> circleSearch(Circle circle); // 同好会を検索する
	public int CircleLastNum(); // 最後に登録した同好会の番号を貰う
}
