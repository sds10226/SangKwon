package com.cafe24.sosang.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.sosang.dao.StoreDAO;
import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.ResultDTO;
import com.cafe24.sosang.dto.StoreDTO;



@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDAO storeDAO;

	// select
	@Override
	public StoreDTO selectStrFif(AreaDTO adto) throws Exception {
		System.out.println("StoreServiceImple selectStrFif() ... dao호출");
		return storeDAO.selectStrFif(adto);
	}
	@Override
	public StoreDTO selectStrFour(AreaDTO adto) throws Exception {
		System.out.println("StoreServiceImple selectStrFour() ... dao호출");
		return storeDAO.selectStrFour(adto);
	}
	@Override
	public StoreDTO selectStrThi(AreaDTO adto) throws Exception {
		System.out.println("StoreServiceImple selectStrThi() ... dao호출");
		return storeDAO.selectStrThi(adto);
	}
	@Override
	public StoreDTO selectStrSec(AreaDTO adto) throws Exception {
		System.out.println("StoreServiceImple selectStrSec() ... dao호출");
		return storeDAO.selectStrSec(adto);
	}
	@Override
	public StoreDTO selectStrFir(AreaDTO adto) throws Exception {
		System.out.println("StoreServiceImple selectStrFir() ... dao호출");
		return storeDAO.selectStrFir(adto);
	}
	
	// update
	@Override
	public void updateStrFif(StoreDTO dto) throws Exception {
		System.out.println("StoreServiceImple updateStrFif() ... dao호출");
		storeDAO.updateStrFif(dto);
	}
	@Override
	public void updateStrFour(StoreDTO dto) throws Exception {
		System.out.println("StoreServiceImple updateStrFour() ... dao호출");
		storeDAO.updateStrFour(dto);
	}
	@Override
	public void updateStrThi(StoreDTO dto) throws Exception {
		System.out.println("StoreServiceImple updateStrThi() ... dao호출");
		storeDAO.updateStrThi(dto);
	}
	@Override
	public void updateStrSec(StoreDTO dto) throws Exception {
		System.out.println("StoreServiceImple updateStrSec() ... dao호출");
		storeDAO.updateStrSec(dto);
	}
	@Override
	public void updateStrFir(StoreDTO dto) throws Exception {
		System.out.println("StoreServiceImple updateStrFir() ... dao호출");
		storeDAO.updateStrFir(dto);
	}
	
	// chart
	@Override
	public JSONObject getChartData() {
		System.out.println("StoreServiceImple getChartData() ...");
		List<ResultDTO> items = storeDAO.selectStrList();
		
		// 점포수 데이터
		JSONArray barlist = new JSONArray();
		// 개업률 데이터
		JSONArray barlist2 = new JSONArray();
		// 폐업률 데이터
		JSONArray barlist3 = new JSONArray();
		
		// 최종 리턴 JSON
		JSONObject responseObj = new JSONObject();
		// list에 추가되는 JSON
		JSONObject barObj = null;
		
		for(int i = 0; i < items.size(); i++) {
			String part = items.get(i).getPart();
			int strCount = items.get(i).getStr_count();
			int smlrStrCount = items.get(i).getSmlr_str_count();
			int open = items.get(i).getOpen();
			int close = items.get(i).getClose();
			
			barObj = new JSONObject();
			barObj.put("part", part);
			barObj.put("strCount", strCount);
			barObj.put("smlrStrCount", smlrStrCount);
			barlist.add(barObj);
			barObj = new JSONObject();
			barObj.put("part", part);
			barObj.put("open", open);
			barlist2.add(barObj);
			barObj = new JSONObject();
			barObj.put("part", part);
			barObj.put("close", close);
			barlist3.add(barObj);
		}
		
		responseObj.put("barlist", barlist);
		responseObj.put("barlist2", barlist2);
		responseObj.put("barlist3", barlist3);
		System.out.println(responseObj.toString());
		
		return responseObj;
	}

}
