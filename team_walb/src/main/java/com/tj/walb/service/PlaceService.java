package com.tj.walb.service;

import java.util.List;

import com.tj.walb.model.Place;

//　場所に関するService　INTERFACE
public interface PlaceService {
	public List<Place> plist(); // 場所のリストを貰う
	public int pInsert(Place place); // 新たな場所を登録する
	public int pDelete(int pNum); // 場所を削除する
}
