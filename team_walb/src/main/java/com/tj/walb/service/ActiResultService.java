package com.tj.walb.service;

import java.sql.Timestamp;
import java.util.List;

import com.tj.walb.model.ActiResult;

//　活動記録に関するService　INTERFACE
public interface ActiResultService {
	public int actiResultInsert(ActiResult actiResult); // 活動記録を貯槽
	public List<ActiResult> actiResultList(int cName, Timestamp arDate); // 活動記録のリストを貰う（設定した日）
}
