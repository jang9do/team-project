package com.tj.walb.dao;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.tj.walb.model.Fboard;
@Repository
public class FboardDaoImpl implements FboardDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public List<Fboard> fBoardList(Fboard fBoard) { // dto를 리턴값으로 넘긴다
		return sessionTemplate.selectList("fBoardList", fBoard);
	}

	@Override
	public int fBoardTotal(int cNum) { // 게시글 갯수를 리턴값으로 넘긴다
		return sessionTemplate.selectOne("fBoardTotal", cNum);
	}

	@Override
	public Fboard fBoardDetail(int fNum) { // 게시글번호를 리턴값으로 넘긴다
		return sessionTemplate.selectOne("fBoardDetail", fNum);
	}

	@Override
	public int fBoardInsert(Fboard fBoard) { // dto를 리턴값으로 넘긴다
		return sessionTemplate.insert("fBoardInsert", fBoard);
	}

	@Override
	public int fBoardUpdate(Fboard fBoard) { // dto를 리턴값으로 넘긴다
		return sessionTemplate.update("fBoardUpdate", fBoard);
	}

	@Override
	public int fBoardDelete(int fNum) { // 게시글번호를 리턴값으로 넘긴다
		return sessionTemplate.delete("fBoardDelete", fNum);
	}

	@Override
	public int fBoardAstep(Fboard fBoard) {
		return sessionTemplate.update("fBoardAstep" ,fBoard);
	}

	@Override
	public int fBoardReply(Fboard fBoard) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("fBoardReply" ,fBoard);
	}

}
