package com.tj.walb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.walb.dao.PlaceDao;
import com.tj.walb.model.Place;

//　場所に関するService
@Service
public class PlaceServiceImpl implements PlaceService {
	@Autowired
	private PlaceDao placeDao;
	
	@Override
	public List<Place> plist() {
		return placeDao.plist();
	}

	@Override
	public int pInsert(Place place) {
		return placeDao.pInsert(place);
	}

	@Override
	public int pDelete(int pNum) {
		return placeDao.pDelete(pNum);
	}

}
