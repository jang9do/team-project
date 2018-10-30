package com.tj.walb.service;

import java.util.List;

import com.tj.walb.model.Activity;

//　活動予約に関するService　INTERFACE
public interface ActivityService {
	public int activityRequest(Activity activity); // 活動予約を申請する
	public List<Activity> activityList(int cNum); // 自分が申請した予約のリストを貰う
	public List<Activity> adminActiList(); // 入っている予約の申請リストを貰う
	public List<Activity> activityTimeList(Activity activity); // 入力した日の予約状況を見る
	public int activityDelete(int actiNum); // 活動予約を削除する
	public int activityChk(int actiNum); // 活動予約の申請を承認する
	public Activity acticityView(int actiNum); // 予約に関する詳細内容を見る
}
