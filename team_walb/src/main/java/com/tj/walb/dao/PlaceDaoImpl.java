package com.tj.walb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.walb.model.Place;

//　場所に関するDAO
@Repository
public class PlaceDaoImpl implements PlaceDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public List<Place> plist() {
		return sessionTemplate.selectList("placeList");
	}

	@Override
	public int pInsert(Place place) {
		return sessionTemplate.insert("placeInsert", place);
	}

	@Override
	public int pDelete(int pNum) {
		return sessionTemplate.delete("placeDelete", pNum);
	}

}
