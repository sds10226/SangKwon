package com.cafe24.sosang.service;

import org.json.simple.JSONObject;

import com.cafe24.sosang.dto.AreaDTO;
import com.cafe24.sosang.dto.StoreDTO;

public interface StoreService {
	
	// select
	public StoreDTO selectStrFif(AreaDTO adto) throws Exception;
	public StoreDTO selectStrFour(AreaDTO adto) throws Exception;
	public StoreDTO selectStrThi(AreaDTO adto) throws Exception;
	public StoreDTO selectStrSec(AreaDTO adto) throws Exception;
	public StoreDTO selectStrFir(AreaDTO adto) throws Exception;
	
	// update
	public void updateStrFif(StoreDTO dto) throws Exception;
	public void updateStrFour(StoreDTO dto) throws Exception;
	public void updateStrThi(StoreDTO dto) throws Exception;
	public void updateStrSec(StoreDTO dto) throws Exception;
	public void updateStrFir(StoreDTO dto) throws Exception;
	
	// chart
	public JSONObject getChartData();
	
}
