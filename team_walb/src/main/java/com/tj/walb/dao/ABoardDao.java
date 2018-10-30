package com.tj.walb.dao;

import java.util.List;

import com.tj.walb.model.ABoard;
import com.tj.walb.model.AReply;

 //　後期掲示板にかんするDAO　INTERFACE
public interface ABoardDao {
	public List<ABoard> aBoardList(int startRow, int endRow); // 後期掲示板のリストを貰う
	public ABoard aBoardView(int aNum); // 後期掲示物の詳細内容を見う
	public List<ABoard> ABoardTop3(); //　後期掲示板の点数が一番高いもの三つのリストを貰う
	public int aBoardModify(ABoard aBoard); // 後期掲示物の情報を修正
	public int aBoardDelete(int aNum); // 後期掲示物を削除する
	public int aBoardInsert(ABoard aBoard); // 新たな後期掲示物を登録
	public int totCnt(); // 後期掲示物の全ての数を計算する
	public int aScoreChange(ABoard aBoard); // 後期掲示物の評点を変える
	public int aReplyInsert(AReply aReply); // 後期掲示物にcommentを登録する
	public List<AReply> aReplyList(int aNum); // 後期掲示物につけているcommentのリストを貰う
	public double aReplyAvg(int aNum); // 後期掲示物につけているcomment達の平均点を計算
}
