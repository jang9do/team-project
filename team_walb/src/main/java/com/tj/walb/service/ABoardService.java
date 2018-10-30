package com.tj.walb.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.tj.walb.model.ABoard;
import com.tj.walb.model.AReply;
import com.tj.walb.model.FileUploadVO;

//　後期掲示板に関するService　INTERFACE
public interface ABoardService {
	public List<ABoard> aBoardList(int startRow, int endRow); // 後期掲示板のリストを貰う
	public List<ABoard> aBoardTop3(); //　後期掲示板の点数が一番高いもの三つのリストを貰う
	public ABoard aBoardView(int aNum); // 後期掲示物の詳細内容を見う
	public int aBoardModify(ABoard aBoard, ABoard modifyBoard); // 後期掲示物の情報を修正
	public int aBoardDelete(int aNum); // 後期掲示物を削除する
	public int aBoardInsert(ABoard aBoard); // 新たな後期掲示物を登録
	public int totCnt(); // 後期掲示物の全ての数を計算する
	public int aScoreChange(int aNum, double aScore); // 後期掲示物の評点を変える
	public int aReplyInsert(AReply aReply); // 後期掲示物にcommentを登録する
	public List<AReply> aReplyList(int aNum); // 後期掲示物につけているcommentのリストを貰う
	public double aReplyAvg(int aNum); // 後期掲示物につけているcomment達の平均点を計算
	public FileUploadVO fileUpload(FileUploadVO fileUploadVO, HttpServletRequest request); // CKEditorのファイルアップロード機能を利用する為のMethod
}
