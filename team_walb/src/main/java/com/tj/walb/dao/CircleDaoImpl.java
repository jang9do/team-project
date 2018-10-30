package com.tj.walb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.Circle;

//　同好会に関するDAO
@Repository
public class CircleDaoImpl implements CircleDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public int cirInsert(Circle circle) {
		return sessionTemplate.insert("CircleInsert", circle);
	}

	@Override
	public Circle circleView(int cNum) {
		return sessionTemplate.selectOne("CircleView", cNum);
	}

	@Override
	public int circleUpdate(Circle circle) {
		return sessionTemplate.update("CircleUpdate", circle);
	}

	@Override
	public int circleDelete(int cNum) {
		return sessionTemplate.delete("CircleDelete", cNum);
	}

	@Override
	public List<Circle> circleList(int startRow, int endRow) {
		Circle circle = new Circle();
		circle.setStartRow(startRow);
		circle.setEndRow(endRow);
		return sessionTemplate.selectList("CircleList", circle);
	}
	
	@Override
	public List<Circle> circleTop3(){
		return sessionTemplate.selectList("CircleTop3");
	}

	@Override
	public int circleHit(int cNum) {
		return sessionTemplate.update("CircleHit", cNum);
	}

	@Override
	public int totCnt() {
		return sessionTemplate.selectOne("CircletotCnt");
	}

	@Override
	public Circle circleTop() {
		return sessionTemplate.selectOne("CircleTop");
	}

	@Override
	public int searchTotCnt(Circle circle) {
		return sessionTemplate.selectOne("CircleSearchtotCnt", circle);
	}

	@Override
	public List<Circle> circleSearch(Circle circle) {
		return sessionTemplate.selectList("CircleSearch", circle);
	}

	@Override
	public int CircleLastNum() {
		return sessionTemplate.selectOne("CircleLastNum");
	}

}
