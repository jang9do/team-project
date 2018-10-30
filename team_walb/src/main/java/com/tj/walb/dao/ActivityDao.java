package com.tj.walb.dao;

import java.util.List;

import com.tj.walb.model.Activity;

//　活動予約に関するDAO　INTERFACE
public interface ActivityDao {
	public int actiRequest(Activity activity); // 活動予約を申請する
	public int actiDelete(int actiNum); // 活動予約を削除する
	public int actiChk(int actiNum); // 活動予約の申請を承認する
	public List<Activity> actiList(int cNum); // 自分が申請した予約のリストを貰う
	public List<Activity> adminActiList(); // 入っている予約の申請リストを貰う
	public List<Activity> actiTimeList(Activity activity); // 入力した日の予約状況を見る
	public Activity activityView(int actiNum); // 予約に関する詳細内容を見る
}
